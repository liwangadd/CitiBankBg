/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.citibank.dao.DomainWrap;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.SimpleDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



/**
 * 数据库的简单访问对象Oracle实现
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * 
 */
public class OracleSimpleDaoImpl extends AbstractSimpleDao {

	/**
	 * 分页SQL语句模板
	 */
	private static final String SPLIT_PAGE_SQL = 
			"select * from ( select split_rows.*, rownum as split_rows_num from " +
			" (${SQL}) split_rows where rownum <= :__end ) where split_rows_num >= :__start";

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
		String execSql = SPLIT_PAGE_SQL.replaceAll("\\$\\{SQL\\}", sql);
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
		String execSql = SPLIT_PAGE_SQL.replaceAll("\\$\\{SQL\\}", sql);
		List<Map<String, Object>> pageList = queryForList(execSql, p);
		System.out.println("------------------------------------------------------------------------------------");
		System.out.println(execSql);
		System.out.println("start: " + p.get("__start"));
		System.out.println("end: " + p.get("__end"));
	
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		page.setSize(pagesize);
		page.setIndex(pageindex);
		page.setTotal(totalCount,pagesize);
		page.setList(pageList);
		System.out.println("pagesize: " + pagesize);
		System.out.println("pageindex: " + pageindex);
		System.out.println("totalCount: " + totalCount);
		System.out.println(pageList.size());
		System.out.println("------------------------------------------------------------------------------------");
		
		return page;
	}
	
	public static void main(String[] args) {
		try {
			
	
			//ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/*.xml");
			//ApplicationContext ac2 = new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml","dao.xml"});
			ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:/resources/spring/*applicationContext.xml");
			
			SimpleDao cmcSimpleDao = (SimpleDao) ac.getBean("cmcSimpleDao");
			
			long l = cmcSimpleDao.count("cmc_func");
			System.out.println(l);
			
			l = cmcSimpleDao.count("select func_name from cmc_func where func_name like '操%'");
			System.out.println(l);
			
			
			l = cmcSimpleDao.count("select func_name from cmc_func where func_name like ?",   "操%");
			System.out.println(l);
			
		
			// 用文件系统的路径,默认指项目的根路径
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("src/appcontext.xml");
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("webRoot/WEB-INF/appcontext.xml");
			// 用classpath路径
		    // ApplicationContext factory = new ClassPathXmlApplicationContext("classpath:appcontext.xml");
		    // ApplicationContext factory = new ClassPathXmlApplicationContext("appcontext.xml");

		    // ClassPathXmlApplicationContext使用了file前缀是可以使用绝对路径的
		    // ApplicationContext factory = new ClassPathXmlApplicationContext("file:F:/workspace/example/src/appcontext.xml");

		    // 用文件系统的路径,默认指项目的根路径
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("src/appcontext.xml");
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("webRoot/WEB-INF/appcontext.xml");



		    // 使用了classpath:前缀,这样,FileSystemXmlApplicationContext也能够读取classpath下的相对路径
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("classpath:appcontext.xml");
		    // ApplicationContext factory = new FileSystemXmlApplicationContext("file:F:/workspace/example/src/appcontext.xml");

		    // 不加file前缀
		    //ApplicationContext factory = new FileSystemXmlApplicationContext("F:/workspace/example/src/appcontext.xml");
		}
		
		catch(Exception ex) {
			
		}
	}

}
