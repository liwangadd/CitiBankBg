/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

import java.util.List;
import java.util.Map;

/**
 * 简单数据库访问对象
 * <pre>
 * 1.基于域对象（BO/VO）的注解映射到数据表的CURD操作；
 * 2.分页查询封装
 * </pre>
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * @see com.citibank.dao.BaseDao
 */
public interface SimpleDao extends BaseDao{

//	===========================================================================
	//CRUD 操作
	/**
	 * 创建一个表记录对象
	 * @param <T> 域对象类型
	 * @param o 域对象
	 */
	public <T> void create(T o);
	
	/**
	 * 通过主键信息获取此记录对象；
	 * 其他字段记录直接填充回传入的域对象中
	 * @param <T> 域对象类型
	 * @param o 域对象
	 */
	public <T> void retrieve(T o);
	
	/**
	 * 通过主键信息更新此记录对象
	 * @param <T> 域对象类型
	 * @param o 域对象
	 * @return 影响的记录条数（正确的期望值是1）
	 */
	public <T> int update(T o);
	
	/**
	 * 通过主键信息更新此记录对象，并忽略null值
	 * @param <T> 域对象类型
	 * @param o 域对象
	 * @return 影响的记录条数（正确的期望值是1）
	 */
	public <T> int updateIgnoreNull(T o);
	
	/**
	 * 通过主键信息删除此记录对象
	 * @param <T> 域对象类型
	 * @param o 域对象
	 * @return 影响的记录条数（正确的期望值是1）
	 */
	public <T> int delete(T o);
	
//	===========================================================================
	
	
	/**
	 * 获取某表中所有记录对象
	 * @param <T> 域对象类型
	 * @param c 域对象类型类
	 * @return 列表<域对象>
	 */
	public <T> List<T> listAll(Class<T> c);
	
	/**
	 * 获取某表中所有记录对象,按指定顺利排列
	 * @param c 域对象类型类
	 * @param o 排序对象
	 * @return 列表<域对象>
	 */
	public <T> List<T> listAll(Class<T> c, Order o);
	
	/**
	 * 分页查询某表中记录，按指定顺序排列
	 * @param c 域对象类型类
	 * @param pageindex 页码
	 * @param pagesize 分页大小
	 * @param order 排序对象
	 * @return 页对象<域对象>
	 */
	public <T> Page<T> pageQuery(Class<T> c, String condition, Map<String, ?> params, int pageindex, int pagesize, Order order);
	
	/**
	 * 分页查询指定SQL的记录，按指定顺序排列;
	 * 分页参数在params中
	 * @param <T> 域对象类型
	 * @param c 域对象类型类
	 * @param condition 条件字符串
	 * @param params 参数Map<字段名，字段值>
	 * @param order 排序对象
	 * @return 页对象<域对象>
	 */
	public <T> Page<T> pageQuery(Class<T> c, String condition, Map<String, ?> params, Order order);
	
	/**
	 * 分页查询指定SQL的记录，按指定顺序排列
	 * @param <T> 域对象类型
	 * @param sql SQL语句（可包含命名参数）
	 * @param params 参数Map<字段名，字段值>
	 * @param pageindex 页码
	 * @param pagesize 分页大小
	 * @param order 排序对象
	 * @param c 域对象类型类
	 * @return 页对象<域对象>
	 */
	public <T> Page<T> pageQuery(String sql, Map<String, ?> params, int pageindex, int pagesize, Order order, Class<T> c);
	
	
	/**
	 * 分页查询指定SQL的记录，按指定顺序排列;
	 * 分页参数在params中
	 * @param <T> 域对象类型
	 * @param sql SQL语句（可包含命名参数）
	 * @param params 参数Map<字段名，字段值>
	 * @param order 排序对象
	 * @param c 域对象类型类
	 * @return 页对象<域对象>
	 */
	public <T> Page<T> pageQuery(String sql, Map<String, ?> params, Order order, Class<T> c);
	
	
	/**
	 * 分页查询指定SQL的记录，按指定顺序排列;
	 * @param sql SQL语句（可包含命名参数）
	 * @param params 参数Map<字段名，字段值>
	 * @param pageindex 页码
	 * @param pagesize 分页大小
	 * @param order 排序对象
	 * @return 页对象<域对象>
	 */
	public Page pageQuery(String sql, Map<String, ?> params, int pageindex, int pagesize, Order order);
	
	/**
	 * 分页查询指定SQL的记录，按指定顺序排列;
	 * 分页参数在params中
	 * @param sql SQL语句（可包含命名参数）
	 * @param params 参数Map<字段名，字段值>
	 * @param order 排序对象
	 * @return 页对象<域对象>
	 */
	public Page<Map<String, Object>> pageQuery(String sql, Map<String, ?> params, Order order);
	
	
}
