package com.citibank.dao.impl;

import com.citibank.dao.DomainWrap;
import com.citibank.dao.Order;
import com.citibank.dao.Page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MySQLSimpleDaoImpl extends AbstractSimpleDao {
	/**
	 * 分页SQL语句模板
	 */

	private static final String SPLIT_PAGE_SQL = "select * from (${SQL}) as TEMP_PGS limit :__offset , :__limit";
	
	/**
	 * 组合查询条件
	 * @param params 参数Map
	 * @param pageindex 分页页数
	 * @param pagesize 分页大小
	 * @return 包含分页参数的Map
	 */
	private Map<String, Object> makeConditions(Map<String, ?> params, int pageindex, int pagesize){
		
		if(params.containsKey("__limit") || params.containsKey("__offset")){
			throw new IllegalArgumentException("common defined param name can not be cover![__limit or __offset].");
		}
		if(pageindex <= 0 || pagesize <= 0){
			throw new IllegalArgumentException("pageindex and pagesize must be positive integer.");
		}
		Map<String, Object> p = new HashMap<String, Object>();
		p.putAll(params);
		int offset = (pageindex - 1) * pagesize;
		p.put("__limit", pagesize);
		p.put("__offset", offset);
		
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
//
		return page;
	}

	public Page<Map<String, Object>> pageQuery(String sql,
			Map<String, ?> params, int pageindex, int pagesize, Order order) {
		
		Map<String, Object> p = makeConditions(params, pageindex, pagesize);
		long totalCount = count(sql, params);

		sql += order.toSqlString();
		String execSql = SPLIT_PAGE_SQL.replaceAll("\\$\\{SQL\\}", sql);
		System.out.println(execSql);
		System.out.println(p.toString());
		List<Map<String, Object>> pageList = queryForList(execSql, p);
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		page.setTotal(totalCount,pagesize);
		page.setList(pageList);

		return page;
	}
	
	/*public static void main(String[] args) {
		try {
			
	
		
			ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:/resources/spring*//*applicationContext.xml");
			
			SimpleDao joaSimpleDao = (SimpleDao) ac.getBean("joaSimpleDao");
			
			long l = joaSimpleDao.count("select * from test");
			System.out.println(l);
			
			l = joaSimpleDao.count("select name from test where name like '%c%'");
			System.out.println(l);
			Map<String,String> map = new HashMap<String,String>();
			map.put("name", "%c%");
			Page<Map<String,Object>> results = joaSimpleDao.pageQuery("select * from test where name like :name", map, 2,2, new Order().desc("NAME"));
			System.out.println(results.getSize());
			System.out.println(results.getTotal());
			System.out.println(results.getList().get(0).get("NAME"));
			
			 用文件系统的路径,默认指项目的根路径
		     ApplicationContext factory = new FileSystemXmlApplicationContext("src/appcontext.xml");
		     ApplicationContext factory = new FileSystemXmlApplicationContext("webRoot/WEB-INF/appcontext.xml");
			 用classpath路径
		     ApplicationContext factory = new ClassPathXmlApplicationContext("classpath:appcontext.xml");
		     ApplicationContext factory = new ClassPathXmlApplicationContext("appcontext.xml");

		     ClassPathXmlApplicationContext使用了file前缀是可以使用绝对路径的
		     ApplicationContext factory = new ClassPathXmlApplicationContext("file:F:/workspace/example/src/appcontext.xml");

		     用文件系统的路径,默认指项目的根路径
		     ApplicationContext factory = new FileSystemXmlApplicationContext("src/appcontext.xml");
		     ApplicationContext factory = new FileSystemXmlApplicationContext("webRoot/WEB-INF/appcontext.xml");



		     使用了classpath:前缀,这样,FileSystemXmlApplicationContext也能够读取classpath下的相对路径
		     ApplicationContext factory = new FileSystemXmlApplicationContext("classpath:appcontext.xml");
		     ApplicationContext factory = new FileSystemXmlApplicationContext("file:F:/workspace/example/src/appcontext.xml");

		     不加file前缀
		    ApplicationContext factory = new FileSystemXmlApplicationContext("F:/workspace/example/src/appcontext.xml");
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}*/

}
