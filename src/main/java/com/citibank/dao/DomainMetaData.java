/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */

package com.citibank.dao;

import java.lang.reflect.Field;
import java.util.*;

/**
 * 域对象的（元）数据（注解映射的表名、字段名、主键）
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * 
 * @see com.citibank.dao.Table
 * @see com.citibank.dao.Column
 * @see com.citibank.dao.Pk
 */
public class DomainMetaData {

	/**
	 * 表名称
	 */
	private String tableName;
	/**
	 * 主键定义，<字段名称， 主键生成类型>
	 */
	private Map<String, IdGenerationType> pks;
	/**
	 * 字段定义，<字段名称， 字段在类中的反射引用>
	 */
	private Map<String, Field> columns;
	/**
	 * 普通字段，即不包括主键的字段集合
	 */
	private Set<String> columnsWithoutPk;
	
	/**
	 * 获取表名
	 * @return 字符串
	 */
	public String getTableName() {
		return tableName;
	}
	
	/**
	 * 获取主键定义主键定义
	 * @return Map<字段名称， 主键生成类型>
	 */
	
	public Map<String, IdGenerationType> getPks() {
		return pks;
	}
	
	/**
	 * 获取字段定义
	 * @return Map<字段名称， 字段在类中的反射引用>
	 */
	
	public Map<String, Field> getColumns() {
		return columns;
	} 
	/**
	 * 获取普通字段，即不包括主键的字段集合
	 * @return 字符串集合
	 */
	public Set<String>getcolumnsWithoutPk(){
		return columnsWithoutPk;
	}

	/**
	 * 实例化一个域对象元数据对象
	 * @param c 域类型定义类
	 */
	public DomainMetaData(Class<?> c){
		Map<String, IdGenerationType> pks0 = new HashMap<String, IdGenerationType>();
		Map<String, Field> columns0 = new HashMap<String, Field>();
		Set<String> columnsWithoutPk0 = new HashSet<String>();
		
		Table table = c.getAnnotation(Table.class);
		if (table == null) {
			throw new DaoException("ORM ERROR. no @Table found in class:"
					+ c.getName());
		}
		
		//获取表名称
		String tname = table.value();
		
		//如果注解使用了空值，就尝试使用类名称
		if (isEmpty(tname)) {
			tname = c.getSimpleName();
		}
		this.tableName = tname;
		
		
		//获取字段名称
		Field[] fs = c.getDeclaredFields();
		for (Field f : fs) {
			Column col = f.getAnnotation(Column.class);
			if (null == col) {
				continue;
			}
			String columnName = col.value();
			
			//如果列表注解为空，就尝试使用字段名称
			if (isEmpty(columnName)) {
				columnName = f.getName();
			}
			
			//检查是否主键
			Pk pk = f.getAnnotation(Pk.class);
			if(null != pk){
				IdGenerationType idType = pk.value();
				pks0.put(columnName, idType);
				//未使用idGeneration属性
			}else{
				columnsWithoutPk0.add(columnName);
			}
			f.setAccessible(true);
			columns0.put(columnName, f);
		}
		//使其不能修改
		this.pks = Collections.unmodifiableMap(pks0);
		this.columns = Collections.unmodifiableMap(columns0);
		this.columnsWithoutPk = Collections.unmodifiableSet(columnsWithoutPk0);
	}
	
	/**
	 * 是否空串
	 * @param s 字符串
	 * @return boolean值
	 */
	private static boolean isEmpty(String s) {
		return "".equals(s);
	}
		
}
