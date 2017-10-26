package com.citibank.common;

import java.util.Map;


public interface CodeDict {

	/**
	 * 获取一个代码类别下代码键的值
	 * @param category 代码类别
	 * @param code 代码键
	 * @return 键值
	 */
	public String getCode(String category, String code);
	
	/**
	 * 获取一个代码类别下所有代码
	 * @param category 代码类别
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, String> getCodes(String category);
	
	/**
	 * 获取所有代码定义
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, Map<String, String>> getAllCodes();
	
}
