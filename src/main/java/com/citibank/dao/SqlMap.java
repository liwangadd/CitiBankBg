/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

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
 * 统一管理SQL语句到外部文件
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * @see org.springframework.context.ResourceLoaderAware
 */
public class SqlMap implements ResourceLoaderAware {
	
	private String[] basenames = new String[0];
	private DbType dbtype = DbType.ROOT;
	
	private static final String PROPERTIES_SUFFIX = ".properties";
	private static final String XML_SUFFIX = ".xml";
	
	private final Map<String, Map<DbType, List<String>>> cachedFilenames = new HashMap<String, Map<DbType, List<String>>>();
	private final Map<DbType, Properties> cachedMergedProperties = new HashMap<DbType, Properties>();
	private final Map<String, Properties> cachedProperties = new HashMap<String, Properties>();
	
	private ResourceLoader resourceLoader = new DefaultResourceLoader();
	
	private final Log logger = LogFactory.getLog(getClass());
	
	public void setResourceLoader(ResourceLoader resourceLoader) {
		this.resourceLoader = (resourceLoader != null ? resourceLoader : new DefaultResourceLoader());
	}
	
	public void setBasenames(String[] basenames) {
		if(null == basenames){
			this.basenames = new String[0];
		}else{
			this.basenames = basenames;
		}
	}
	
	public void setDbtype(String dbtype){
		String[] temp = dbtype.toLowerCase().split("_");
		if(temp.length > 1){
			this.dbtype = new DbType(temp[0], temp[1]);
		}else if(temp.length > 0){
			this.dbtype = new DbType(temp[0], "");
		}
	}
	
	public DbType getDbType(){
		return this.dbtype;
	}
	
	public String getSql(String key){
		return getSql(key, this.dbtype);
	}
	public String getSql(String key, DbType dbtype){
		return getSqlMap(dbtype).getProperty(key);
	}
	
	public Properties getSqlMap(DbType dbtype){
		DbType dbt = dbtype == null ? DbType.ROOT : dbtype;
		String[] basenames = this.basenames;
		synchronized (this.cachedMergedProperties) {
			Properties mergedProps = this.cachedMergedProperties.get(dbt);
			if (mergedProps != null) {
				return mergedProps;
			}
			mergedProps = new Properties();
			for (int i = basenames.length - 1; i >= 0; i--) {
				List<String> filenames = calculateAllFilenames(basenames[i], dbt);
				for (int j = filenames.size() - 1; j >= 0; j--) {
					String filename = (String) filenames.get(j);
					Properties prop = getProperties(filename);
					if (prop.size() > 0) {
						mergedProps.putAll(prop);
					}
				}
			}
			this.cachedMergedProperties.put(dbt, mergedProps);
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
	 * @return
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
	
	
	
	protected List<String> calculateAllFilenames(String basename, DbType dbtype) {
		synchronized (this.cachedFilenames) {
			Map<DbType, List<String>> dbtMap = this.cachedFilenames.get(basename);
			if (dbtMap != null) {
				List<String> filenames = dbtMap.get(dbtype);
				if (filenames != null) {
					return filenames;
				}
			}
			List<String> filenames = new ArrayList<String>(7);
			filenames.addAll(calculateFilenamesForLocale(basename, dbtype));
			filenames.add(basename);
			if (dbtMap != null) {
				dbtMap.put(dbtype, filenames);
			}
			else {
				dbtMap = new HashMap<DbType, List<String>>();
				dbtMap.put(dbtype, filenames);
				this.cachedFilenames.put(basename, dbtMap);
			}
			return filenames;
		}
	}
	
	protected List<String> calculateFilenamesForLocale(String basename, DbType dbtype) {
		List<String> result = new ArrayList<String>(2);
		String type = dbtype.getType();
		String version = dbtype.getVersion();
		StringBuilder temp = new StringBuilder(basename);

		temp.append('_');
		if (type.length() > 0) {
			temp.append(type);
			result.add(0, temp.toString());
		}

		temp.append('_');
		if (version.length() > 0) {
			temp.append(version);
			result.add(0, temp.toString());
		}

		return result;
	}
}
