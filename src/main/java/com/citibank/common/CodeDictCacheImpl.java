/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.common;

import com.citibank.dao.SimpleDao;

import java.util.*;




/**
 * 带缓存的代码字典实现类
 * @author chenr
 * @version 2.0.0, 2011-6-30
 */
public class CodeDictCacheImpl implements CodeDict, Reloadable {

	private Map<String, Map<String, String>> codes = new HashMap<String, Map<String, String>>();
	
	private long lastmodify = -1L;
	private Object lock = new Object();
	
	private SimpleDao joaSimpleDao;
	
	public void setJoaSimpleDao(SimpleDao joaSimpleDao) {
		this.joaSimpleDao = joaSimpleDao;
	}

	
	/**
	 * 获取一个代码类别下代码键的值
	 * @param category 代码类别
	 * @param code 代码键
	 * @return 键值
	 */
	public String getCode(String category, String code){
		if(lastmodify < 0) reload();
		synchronized (lock) {
			if(codes.containsKey(category)){
				Map<String, String> codemap = codes.get(category);
				if(codemap.containsKey(code)){
					return codemap.get(code);
				}
			}
		}
		return null;
	}
	/**
	 * 获取一个代码类别下所有代码
	 * @param category 代码类别
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, String> getCodes(String category){
		if(lastmodify < 0) reload();
		synchronized (lock) {
			if(codes.containsKey(category)){
				Map<String, String> codemap = codes.get(category);
				return Collections.unmodifiableMap(codemap);
//				Map<String, String> codemap2 =  new HashMap<String, String>();
//				codemap2.putAll(codemap);
//				return codemap2;
			}
		}
		return null;
	}
	/**
	 * 获取所有代码定义
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, Map<String, String>> getAllCodes(){
		Map<String, Map<String, String>> codes0 = new HashMap<String, Map<String, String>>();
		synchronized (lock) {
			for(String key : codes.keySet()){
				codes0.put(key, Collections.unmodifiableMap(codes.get(key)));
			}
		}
		return Collections.unmodifiableMap(codes0);
	}
	/**
	 * 最后重载时间
	 * @return long型毫秒时间
	 */
	public long lastModify() {
		return this.lastmodify;
	}
	/**
	 * 重载方法
	 * @return void
	 */
	public void reload() {
		String sql = "SELECT * FROM JOA_CODE_CATEGORY";
		List<Map<String, Object>> categorylist = joaSimpleDao.queryForList(sql);
		sql = "SELECT * FROM JOA_CODE ORDER BY CATEGORY_ID, ONUM";
		List<Map<String, Object>> codelist = joaSimpleDao.queryForList(sql);
		
		Map<String, Map<String, String>> codes0 = new HashMap<String, Map<String, String>>();
		for(Map<String, Object> category : categorylist){
			String categoryId = (String) category.get("CATEGORY_ID");
			codes0.put(categoryId, new LinkedHashMap<String, String>());
		}
		for(Map<String, Object> code : codelist){
			String categoryId = (String) code.get("CATEGORY_ID");
			String codeKey = (String) code.get("CODE_KEY");
			String codeValue = (String) code.get("CODE_VALUE");
			if(codes0.containsKey(categoryId)){
				codes0.get(categoryId).put(codeKey, codeValue);
			}
		}
		
		synchronized (lock) {
			this.codes = codes0;
			this.lastmodify = System.currentTimeMillis();
		}
	}

}
