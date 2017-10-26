/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao.impl;

import com.citibank.common.BaseConstant;
import com.citibank.dao.DomainWrap;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.SimpleDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;



/**
 * 简单数据库访问对象默认部分实现；
 * 分页接口方法未实现；
 * @author chenr
 * @version 2.0.0, 2011-6-22
 *
 */


public abstract class  AbstractSimpleDao extends BaseDaoImpl implements SimpleDao {
	
	public <T> void create(T o) {
		DomainWrap<T> dw = new DomainWrap<T>(o);
		create(dw.getTableName(), dw.getRowMapForCreate());
	}

	public <T> void retrieve(T o) {
		DomainWrap<T> dw = new DomainWrap<T>(o);
		String tbName = dw.getTableName();
		Map<String, Object> conds = dw.getIdMap();
		List<Object> plist = new ArrayList<Object>();
		
		StringBuffer sb = new StringBuffer("SELECT * FROM ");
		sb.append(tbName.toUpperCase()).append(" WHERE ");

		for (String key : conds.keySet()) {
			sb.append(key.toUpperCase()).append('=');
			Object obj = conds.get(key);
			sb.append('?');
			plist.add(obj);
			sb.append(" AND ");
		}
		sb.delete(sb.length() - 5, sb.length() - 1);
		getJdbcTemplate().queryForObject(sb.toString(), plist.toArray(), dw);
	}

	public <T> int update(T o) {
		DomainWrap<T> dw = new DomainWrap<T>(o);
		return update(dw.getTableName(), dw.getRowMap(), dw.getIdMap());
	}

	public <T> int delete(T o) {
		DomainWrap<T> dw = new DomainWrap<T>(o);
		return delete(dw.getTableName(), dw.getIdMap());
	}
	public <T> int updateIgnoreNull(T o) {
		DomainWrap<T> dw = new DomainWrap<T>(o);
		return update(dw.getTableName(), dw.getRowMapIgnoreNull(), dw.getIdMap());
	}

	public <T> List<T> listAll(Class<T> c) {
		DomainWrap<T> dw = new DomainWrap<T>(c);
		StringBuffer sb = new StringBuffer("SELECT * FROM ").append(dw.getTableName());
		return getJdbcTemplate().query(sb.toString(), dw);
	}

	public <T> List<T> listAll(Class<T> c, Order o) {
		DomainWrap<T> dw = new DomainWrap<T>(c);
		StringBuffer sb = new StringBuffer("SELECT * FROM ")
			.append(dw.getTableName()).append(o.toSqlString());
		return getJdbcTemplate().query(sb.toString(), dw);
	}
	
	/**
	 * 从Map中取得指定键的整数类型值
	 * @param params Map
	 * @param keyName 键名称
	 * @param defaultValue 默认值
	 * @return 整数
	 */
	protected int getInteger(Map<String, ?> params, String keyName, int defaultValue){
		if(params.containsKey(keyName)){
			return Integer.parseInt(params.get(keyName).toString());
		}else{
			return defaultValue;
		}
	}
	
	public <T> Page<T> pageQuery(Class<T> c, String condition,
			Map<String, ?> params, int pageindex, int pagesize, Order order) {
		
		DomainWrap<T> dw = new DomainWrap<T>(c);
		String sql = "SELECT * FROM " + dw.getTableName();
		if(null == condition || "".equals(condition))
			sql += " WHERE " + condition;
		
		return pageQuery(sql, params, pageindex, pagesize, order, c);
	}
	
	
	public <T> Page<T> pageQuery(Class<T> c, String condition, Map<String, ?> params, Order order) {
		
		int pageindex = getInteger(params, BaseConstant.PAGE_INDEX, BaseConstant.DEF_PAGE_INDEX);
		int pagesize = getInteger(params, BaseConstant.PAGE_SIZE, BaseConstant.DEF_PAGE_SIZE);
				
		return pageQuery(c, condition, params, pageindex, pagesize, order);
	}

	public <T> Page<T> pageQuery(String sql, Map<String, ?> params, Order order, Class<T> c) {
		
		int pageindex = getInteger(params, BaseConstant.PAGE_INDEX, BaseConstant.DEF_PAGE_INDEX);
		int pagesize = getInteger(params, BaseConstant.PAGE_SIZE, BaseConstant.DEF_PAGE_SIZE);
				
		return pageQuery(sql, params, pageindex, pagesize, order, c);
	}

	public Page<Map<String, Object>> pageQuery(String sql, Map<String, ?> params, Order order) {
		
		int pageindex = getInteger(params, BaseConstant.PAGE_INDEX, BaseConstant.DEF_PAGE_INDEX);
		int pagesize = getInteger(params, BaseConstant.PAGE_SIZE, BaseConstant.DEF_PAGE_SIZE);
				
		return pageQuery(sql, params, pageindex, pagesize, order);
	}
}
