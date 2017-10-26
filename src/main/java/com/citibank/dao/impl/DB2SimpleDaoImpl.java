/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */

package com.citibank.dao.impl;

import com.citibank.dao.DomainWrap;
import com.citibank.dao.Order;
import com.citibank.dao.Page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



/**
 * 数据库的简单访问对象DB2实现
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * 
 */
public class DB2SimpleDaoImpl extends AbstractSimpleDao {

	/**
	 * 分页SQL语句模板
	 */
	private static final String SPLIT_PAGE_SQL =
		"select * from (select split_rows.*, rownumber() over(${ORDER}) as split_rows_num from " +
		" (${SQL}) split_rows) t where split_rows_num >= :__start and split_rows_num <= :__end";


	/**
	 * 组合查询条件
	 * @param params 参数Map
	 * @param pageindex 分页页数
	 * @param pagesize 分页大小
	 * @return 包含分页参数的Map
	 */
	private Map<String, Object> makeConditions(Map<String, ?> params, int pageindex, int pagesize){
		
		if(params.containsKey("__start") || params.containsKey("__end")){
			throw new IllegalArgumentException("common defined param name can not be cover![__start or __end].");
		}
		if(pageindex <= 0 || pagesize <= 0){
			throw new IllegalArgumentException("pageindex and pagesize must be positive integer.");
		}
		Map<String, Object> p = new HashMap<String, Object>();
		p.putAll(params);
		int start = (pageindex - 1) * pagesize + 1;
		int end = start + pagesize - 1;
		p.put("__start", start);
		p.put("__end", end);
		return p;
		
	}
	
	
	public <T> Page<T> pageQuery(String sql, Map<String, ?> params,
			int pageindex, int pagesize, Order order, Class<T> c) {
		
		DomainWrap<T> dw = new DomainWrap<T>(c);
		Map<String, Object> p = makeConditions(params, pageindex, pagesize);
		
		long totalCount = count(sql, params);
		
		sql += order.toSqlString();
		String execSql = SPLIT_PAGE_SQL.replaceAll("\\$\\{SQL\\}", sql).replaceAll("\\$\\{ORDER\\}", order.toSqlString());
		List<T> pageList = getNamedParameterJdbcTemplate().query(execSql, p, dw);
		
		Page<T> page = new Page<T>();
		page.setSize(pagesize);
		page.setIndex(pageindex);
		page.setTotal(totalCount,pagesize);
		page.setList(pageList);
		
		return page;
	}

	public Page pageQuery(String sql,
						  Map<String, ?> params, int pageindex, int pagesize, Order order) {
		
		Map<String, Object> p = makeConditions(params, pageindex, pagesize);
		
		long totalCount = count(sql, params);
		
		sql += order.toSqlString();
		String execSql = SPLIT_PAGE_SQL.replaceAll("\\$\\{SQL\\}", sql).replaceAll("\\$\\{ORDER\\}", order.toSqlString());
		List<Map<String, Object>> pageList = queryForList(execSql, p);
		
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		page.setSize(pagesize);
		page.setIndex(pageindex);
		page.setTotal(totalCount,pagesize);
		page.setList(pageList);
		
		return page;
	}
}
