package com.citibank.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;



/**
 * 资源包工具类， 实现了资源包缓存；
 * 依赖于spring的资源加载器；
 * 使用方法为：
 * <code><pre>
 * &lt;bean id="messageBundle" class="cn.com.higinet.common.MessageBundle" /&gt;
 * </pre></code>
 * 参考Spring 的消息包实现；
 * @author zmy
 * @version 2014-07-06
 * 
 * @see org.springframework.context.support.ReloadableResourceBundleMessageSource
 */
public class MessageBundle implements ResourceLoaderAware {
	
	private static final String PROPERTIES_SUFFIX = ".properties";
	private static final String XML_SUFFIX = ".xml";
	
	private final Map<String, Map<Locale, List<String>>> cachedFilenames = new HashMap<String, Map<Locale, List<String>>>();
	private final Map<Locale, Properties> cachedMergedProperties = new HashMap<Locale, Properties>();
	private final Map<String, Properties> cachedProperties = new HashMap<String, Properties>();
	
//	private final Map<String, Long> cachedPropertieRefreshTimestamp = new HashMap<String, Long>();
	
	private ResourceLoader resourceLoader = new DefaultResourceLoader();
	
	private final Log logger = LogFactory.getLog(getClass());
	
	public void setResourceLoader(ResourceLoader resourceLoader) {
		this.resourceLoader = (resourceLoader != null ? resourceLoader : new DefaultResourceLoader());
	}
	
	/**
	 * 取得指定国家语言的消息包；
	 * 若缓存中有就从缓存中取
	 * @param locale
	 * @return
	 */
	public Properties getMessages(Locale locale){
		String[] basenames = MessageSourcePart.getBasenames();
		Locale loc = locale == null ? new Locale("", "") : locale;
			
		synchronized (this.cachedMergedProperties) {
			Properties mergedProps = this.cachedMergedProperties.get(loc);
			if (mergedProps != null) {
				return mergedProps;
			}
			mergedProps = new Properties();
			for (int i = basenames.length - 1; i >= 0; i--) {
				List<String> filenames = calculateAllFilenames(basenames[i], loc);
				for (int j = filenames.size() - 1; j >= 0; j--) {
					String filename = (String) filenames.get(j);
					Properties prop = getProperties(filename);
					if (prop.size() > 0) {
						mergedProps.putAll(prop);
					}
				}
			}
			this.cachedMergedProperties.put(loc, mergedProps);
			return mergedProps;
		}
	}
	
	/**
	 * 从缓存或新加载属性文件
	 * @param filename
	 * @return
	 */
	protected Properties getProperties(String filename) {
		synchronized (this.cachedProperties) {
			Properties prop = this.cachedProperties.get(filename);
			if (prop != null ) {
				return prop;
			}
			return loadProperties(filename);
		}
	}
	
	/**
	 * 重新加载属性文件并缓存
	 * @param filename
	 * @return 属性对象
	 */
	protected Properties loadProperties(String filename){
		Properties props = new Properties();
		Resource resource = this.resourceLoader.getResource(filename + PROPERTIES_SUFFIX);
		if (!resource.exists()) {
			resource = this.resourceLoader.getResource(filename + XML_SUFFIX);
		}
		if (resource.exists()) {
			try{
				InputStream in = resource.getInputStream();
				try {
					if (resource.getFilename().endsWith(XML_SUFFIX)) {
						if (logger.isDebugEnabled()) {
							logger.debug("Loading properties [" + resource.getFilename() + "]");
						}
						props.loadFromXML(in);
					}else{
						props.load(in);
					}
				}finally {
					in.close();
				}
			} catch(IOException ex){
				if (logger.isWarnEnabled()) {
					logger.warn("Could not parse properties file [" + resource.getFilename() + "]", ex);
				}
			}
		} else {
			// Resource does not exist.
			if (logger.isDebugEnabled()) {
				logger.debug("No properties file found for [" + filename + "] - neither plain properties nor XML");
			}
		}
		this.cachedProperties.put(filename, props);
		return props;
	}
	
	
	
	protected List<String> calculateAllFilenames(String basename, Locale locale) {
		synchronized (this.cachedFilenames) {
			Map<Locale, List<String>> localeMap = this.cachedFilenames.get(basename);
			if (localeMap != null) {
				List<String> filenames = localeMap.get(locale);
				if (filenames != null) {
					return filenames;
				}
			}
			List<String> filenames = new ArrayList<String>(7);
			filenames.addAll(calculateFilenamesForLocale(basename, locale));
			filenames.add(basename);
			if (localeMap != null) {
				localeMap.put(locale, filenames);
			}
			else {
				localeMap = new HashMap<Locale, List<String>>();
				localeMap.put(locale, filenames);
				this.cachedFilenames.put(basename, localeMap);
			}
			return filenames;
		}
	}
	
	protected List<String> calculateFilenamesForLocale(String basename, Locale locale) {
		List<String> result = new ArrayList<String>(3);
		String language = locale.getLanguage();
		String country = locale.getCountry();
		String variant = locale.getVariant();
		StringBuilder temp = new StringBuilder(basename);

		temp.append('_');
		if (language.length() > 0) {
			temp.append(language);
			result.add(0, temp.toString());
		}

		temp.append('_');
		if (country.length() > 0) {
			temp.append(country);
			result.add(0, temp.toString());
		}

		if (variant.length() > 0 && (language.length() > 0 || country.length() > 0)) {
			temp.append('_').append(variant);
			result.add(0, temp.toString());
		}

		return result;
	}
}
