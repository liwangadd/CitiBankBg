/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.common;

import com.citibank.dao.SimpleDao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



/**
 * 代码字典实现类
 */
public class CodeDictImpl implements CodeDict {
	
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
	public String getCode(String category, String code) {
		
		String sql = "select * from JOA_CODE where category_id=? and code_key=? order by ONUM";
		List<Map<String, Object>> codelist = joaSimpleDao.queryForList(sql, category, code);
		if(codelist.size() > 0){
			return (String)codelist.get(0).get("CODE_VALUE");
		}
		return null;
	}
	/**
	 * 获取一个代码类别下所有代码
	 * @param category 代码类别
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, String> getCodes(String category) {
		String sql = "select * from JOA_CODE where category_id=? order by ONUM";
		List<Map<String, Object>> codelist = joaSimpleDao.queryForList(sql, category);
		Map<String, String> codemap = new HashMap<String, String>();
		if(codelist.size() > 0){
			for(Map<String, Object> code : codelist){
				codemap.put((String)code.get("CODE_KEY"), (String)code.get("CODE_VALUE"));
			}
		}
		return codemap;
	}
	/**
	 * 获取所有代码定义
	 * @return 存放代码的键值对的Map对象
	 */
	public Map<String, Map<String, String>> getAllCodes() {
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
		return codes0;
	}

}
