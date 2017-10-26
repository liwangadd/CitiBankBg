package com.citibank.common;

import java.io.IOException;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;


public class PropertyPlaceholderHelper {
	private final String placeholderPrefix = "${";
	private final String placeholderSuffix = "}";
	private final String decryptPrefix = "$[";
	private final String decryptSuffix = "]";
//	private final String valueSeparator = ":";
	private final boolean ignoreUnresolvablePlaceholders = false;
	private final boolean searchSystemEnvironment = true;
	private Properties props = null;
	private int systemPropertiesMode = 1; //1:默认先查找Properties，2：先查找系统参数
	private static String rootKey ; 
//	private static String encryptionKey ; 
	
	public PropertyPlaceholderHelper()
	{
		
	}
	public PropertyPlaceholderHelper(Properties props,String rootKey)
	{
		this.props = props;
		this.rootKey = rootKey;
	}
	private int findPlaceholderEndIndex(CharSequence buf, int startIndex,String prefix,String suffix) {
		int index = startIndex + prefix.length();
		int withinNestedPlaceholder = 0;
		while (index < buf.length()) {
			if (substringMatch(buf, index, suffix)) {
				if (withinNestedPlaceholder > 0) {
					withinNestedPlaceholder--;
					index = index + suffix.length();
				}
				else {
					return index;
				}
			}
//			else if (substringMatch(buf, index, this.simplePrefix)) {
//				withinNestedPlaceholder++;
//				index = index + this.simplePrefix.length();
//			}
			else {
				index++;
			}
		}
		return -1;
	}
	/**
	 * 解析字符串
	 * @param strVal

	 * @param visitedPlaceholders
	 * @return
	 */
	protected String parseStringValue(
			String strVal, Set<String> visitedPlaceholders) {

		StringBuilder buf = new StringBuilder(strVal);

		int startIndex = strVal.indexOf(this.placeholderPrefix);
		while (startIndex != -1) {
			int endIndex = findPlaceholderEndIndex(buf, startIndex,placeholderPrefix,placeholderSuffix);
			if (endIndex != -1) {
				String placeholder = buf.substring(startIndex + this.placeholderPrefix.length(), endIndex);
				if (!visitedPlaceholders.add(placeholder)) {
					throw new IllegalArgumentException(
							"Circular placeholder reference '" + placeholder + "' in property definitions");
				}
				// Recursive invocation, parsing placeholders contained in the placeholder key.
				placeholder = parseStringValue(placeholder, visitedPlaceholders);

				// Now obtain the value for the fully resolved key...
				String propVal = resolvePlaceholder(placeholder);
//				if (propVal == null && this.valueSeparator != null) {
//					int separatorIndex = placeholder.indexOf(this.valueSeparator);
//					if (separatorIndex != -1) {
//						String actualPlaceholder = placeholder.substring(0, separatorIndex);
//						String defaultValue = placeholder.substring(separatorIndex + this.valueSeparator.length());
//						propVal = resolvePlaceholder(actualPlaceholder);
//						if (propVal == null) {
//							propVal = defaultValue;
//						}
//					}
//				}
				if (propVal != null) {
					// Recursive invocation, parsing placeholders contained in the
					// previously resolved placeholder value.
					propVal = parseStringValue(propVal,visitedPlaceholders);
					buf.replace(startIndex, endIndex + this.placeholderSuffix.length(), propVal);
//					if (logger.isTraceEnabled()) {
//						logger.trace("Resolved placeholder '" + placeholder + "'");
//					}
					startIndex = buf.indexOf(this.placeholderPrefix, startIndex + propVal.length());
				}
				else if (this.ignoreUnresolvablePlaceholders) {
					// Proceed with unprocessed value.
					startIndex = buf.indexOf(this.placeholderPrefix, endIndex + this.placeholderSuffix.length());
				}
				else {
					throw new IllegalArgumentException("Could not resolve placeholder '" + placeholder + "'");
				}

				visitedPlaceholders.remove(placeholder);
			}
			else {
				startIndex = -1;
			}
		}
		startIndex = buf.indexOf(this.decryptPrefix);
		while (startIndex != -1) {
			int endIndex = findPlaceholderEndIndex(buf, startIndex,decryptPrefix,decryptSuffix);
			if (endIndex != -1) {
				String placeholder = buf.substring(startIndex + this.decryptPrefix.length(), endIndex);
				if (!visitedPlaceholders.add(placeholder)) {
					throw new IllegalArgumentException(
							"Circular placeholder reference '" + placeholder + "' in property definitions");
				}
				placeholder = parseStringValue(placeholder, visitedPlaceholders);
				String propVal = placeholder;
				if (propVal != null) {
					propVal = parseStringValue(propVal,visitedPlaceholders);
					try {
						propVal = decoder(rootKey, propVal);
					} catch (Exception e) {
						e.printStackTrace();
						throw new IllegalArgumentException(propVal+"decryption wrong");
					}
					buf.replace(startIndex, endIndex + this.decryptSuffix.length(), propVal);
					startIndex = buf.indexOf(this.decryptPrefix, startIndex + propVal.length());
				}
				else if (this.ignoreUnresolvablePlaceholders) {
					startIndex = buf.indexOf(this.decryptPrefix, endIndex + this.decryptSuffix.length());
				}
				else {
					throw new IllegalArgumentException("Could not resolve placeholder '" + placeholder + "'");
				}

				visitedPlaceholders.remove(placeholder);
			}
			else {
				startIndex = -1;
			}
		}
		return buf.toString();
	}
//	private class PropertyPlaceholderResolver{
//		
//		public String resolvePlaceholder(String placeholderName) {
//			return PropertyPlaceholderHelper.this.resolvePlaceholder(placeholderName,1);
//		}
//	}
	protected String resolvePlaceholder(String placeholder) {
		String propVal = null;
		if (systemPropertiesMode == 2) { //直接检查系统参数
			propVal = resolveSystemProperty(placeholder);
		}
		if (propVal == null) {
			propVal = props.getProperty(placeholder);
		}
		if (propVal == null && systemPropertiesMode == 1) {//检查系统参数
			propVal = resolveSystemProperty(placeholder);
		}
		return propVal;
	}
//	protected String resolvePlaceholder(String placeholder)
//	{
//		return props.getProperty(placeholder);
//	}
	/**
	 * Resolve the given key as JVM system property, and optionally also as
	 * system environment variable if no matching system property has been found.
	 * @param key the placeholder to resolve as system property key
	 * @return the system property value, or <code>null</code> if not found
	 * @see System#getProperty(String)
	 * @see System#getenv(String)
	 */
	protected String resolveSystemProperty(String key) {
		try {
			String value = System.getProperty(key);
			if (value == null && this.searchSystemEnvironment) {
				value = System.getenv(key);
			}
			return value;
		}
		catch (Throwable ex) {
			throw new IllegalArgumentException("Could not access system property '" + key + "': " + ex);
		}
	}
	/**
	 * 根据解析字符串获取其值替换占位符，当Properties中没有，可以检查系统参数

	 * @return
	 */
	public  String resolveStringValue(String value){
//		String value = replacePlaceholders(strVal);
//		return (value==null ? "" : value);
//	}
//	/**
//	 * 
//	 * @param value
//	 * @param placeholderResolver
//	 * @return
//	 */
//	protected String replacePlaceholders(String value) {
		if (value == null) {
			throw new IllegalArgumentException("Argument 'value' must not be null.");
		}
		return parseStringValue(value, new HashSet<String>());
	}
	/**
	 * Test whether the given string matches the given substring
	 * at the given index.
	 * @param str the original string (or StringBuilder)
	 * @param index the index in the original string to start matching against
	 * @param substring the substring to match at the given index
	 */
	public static boolean substringMatch(CharSequence str, int index, CharSequence substring) {
		for (int j = 0; j < substring.length(); j++) {
			int i = index + j;
			if (i >= str.length() || str.charAt(i) != substring.charAt(j)) {
				return false;
			}
		}
		return true;
	}
	/**
	 * 根据key获取占位符转化后的数据
	 * @param key
	 * @return
	 */
	public String getValue(String key)
	{
		return resolveStringValue(props.getProperty(key));
	}
	/**
	 * 遍历Properties里面的数据，一次转化
	 * @param strVal
	 * @return
	 */
	public  Properties resolveProperties(){
		Properties properties = new Properties();
		for(Object key : props.keySet()){
			String k = (String) key;
			properties.put(k, getValue(k));
		}
		return properties;
	}
	public Properties getProps() {
		return props;
	}
	public void setProps(Properties props) {
		this.props = props;
	}
	public boolean isIgnoreUnresolvablePlaceholders() {
		return ignoreUnresolvablePlaceholders;
	}
	public boolean isSearchSystemEnvironment() {
		return searchSystemEnvironment;
	}
	public int getSystemPropertiesMode() {
		return systemPropertiesMode;
	}
	public void setSystemPropertiesMode(int systemPropertiesMode) {
		this.systemPropertiesMode = systemPropertiesMode;
	}
	public static void main(String[] args) throws IOException {
		Properties props = PropertiesUtil.load("/resources/db/db.properties");
		PropertyPlaceholderHelper prUtil = new PropertyPlaceholderHelper(props,"zzj");
		System.out.println(props.get("c3p0.driverClass"));
		System.out.println(prUtil.getValue("jdbc.url"));
		System.out.println(prUtil.getValue("c3p0.driverClass"));
		System.out.println(prUtil.getValue("jndi.getInstance"));

		System.out.println(prUtil.resolveStringValue("${JAVA_HOME}"));
		System.out.println(props.get("db.password"));
		System.out.println(prUtil.getValue("db.password"));
		System.out.println(prUtil.getValue("dbcp.password"));
	}
	private static String decoder(String encryptionKey,String value) throws Exception{
		//加密数据解密
		DBUtil.set_root_key(rootKey);
//		DBUtil.set_client_key(encryptionKey);
		return DBUtil.Dencrypt(value, "db").trim();
	}
}
