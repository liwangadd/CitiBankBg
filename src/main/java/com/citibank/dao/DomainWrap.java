/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import com.citibank.common.IdUtil;
import org.springframework.jdbc.core.RowMapper;




/**
 * 域对象的包装类;
 * 一个映射到数据库的POJO类即为域对象（全称模型域对象）
 * 
 * @param <T> 域对象类型
 * 
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * @see org.springframework.jdbc.core.RowMapper
 */
public class DomainWrap<T> implements RowMapper<T>{

	//应考虑将类的注解缓存起来
	
	
	/**
	 * 域对象
	 */
	private T domain;
	/**
	 * 域对象的类
	 */
	private Class<T> domainClass;
	/**
	 * 域对象的元数据对象
	 */
	private DomainMetaData dmd;
	
	/**
	 * 域对象的元数据对象缓存Map<域对象的类, 域对象的元数据对象>
	 */
	private static Map<Class<?>, DomainMetaData> domains;
	
	static {
		domains = new Hashtable<Class<?>, DomainMetaData>();
	}
	
	
	
	/**
	 * 获取指定域类型的域对象的元数据对象
	 * @param c 域类
	 * @return 域对象的元数据对象
	 */
	public static DomainMetaData getDomainMetaData(Class<?> c){
		
		DomainMetaData dmd = null;
		if(domains.containsKey(c)){
			dmd = domains.get(c);
		}else{
			dmd = new DomainMetaData(c);
			domains.put(c, dmd);
		}
		return dmd;
	}
	
	/**
	 * 获取域对象
	 * @return 域对象
	 */
	private T getDomain(){
		if(domain == null){
			try {
				return this.domainClass.newInstance();
			} catch (InstantiationException e) {
				throw new DaoException(e);
			} catch (IllegalAccessException e) {
				throw new DaoException(e);
			}
		}else{
			return domain;
		}
	}
	
	/**
	 * 实例化域对象的包装类
	 * @param o 域对象
	 */
	@SuppressWarnings("unchecked")
	public DomainWrap(T o) {
		this.domain = o;
		this.domainClass = (Class<T>) o.getClass();
		this.dmd = getDomainMetaData(this.domainClass);
	}
	
	/**
	 * 实例化域对象的包装类
	 * @param t 域对象类
	 */
	public DomainWrap(Class<T> t){
		this.domainClass = t;
		this.domain = null;
		this.dmd = getDomainMetaData(t);
	}
	
	/**
	 * 获取表名
	 * @return 字符串
	 */
	public String getTableName(){
		return dmd.getTableName();
	}

	/**
	 * 获取行记录值Map（不包含主键）
	 * @return Map<字段名, 字段值>
	 */
	public Map<String, Object> getRowMap(){
		T t = getDomain();
		Map<String, Object> row = new HashMap<String, Object>();
		Map<String, Field> columns = dmd.getColumns();
		Set<String> columnsWithoutPk = dmd.getcolumnsWithoutPk();
		try {
			for(String columnName : columnsWithoutPk){
				Field f = columns.get(columnName);
				row.put(columnName, f.get(t));
			}
		} catch (IllegalArgumentException e) {
			throw new DaoException(e);
		} catch (IllegalAccessException e) {
			throw new DaoException(e);
		}
		return row;
	}
	
	/**
	 * 获取行非空记录值Map（不包含主键）
	 * @return Map<字段名, 字段值>
	 */
	public Map<String, Object> getRowMapIgnoreNull(){
		T t = getDomain();
		Map<String, Object> row = new HashMap<String, Object>();
		Map<String, Field> columns = dmd.getColumns();
		Set<String> columnsWithoutPk = dmd.getcolumnsWithoutPk();
		try {
			for(String columnName : columnsWithoutPk){
				Field f = columns.get(columnName);
				Object fo = f.get(t);
				if(null != fo)
					row.put(columnName, fo);
			}
		} catch (IllegalArgumentException e) {
			throw new DaoException(e);
		} catch (IllegalAccessException e) {
			throw new DaoException(e);
		}
		return row;
	}
	
	/**
	 * 获取行主键记录值Map
	 * @return Map<字段名, 字段值>
	 */
	public Map<String, Object> getIdMap(){
		T t = getDomain();
		Map<String, Object> idmap = new HashMap<String, Object>();
		Map<String, Field> columns = dmd.getColumns();
		Map<String, IdGenerationType> pks = dmd.getPks();
		try {
			for(String columnName : pks.keySet()){
				Field f = columns.get(columnName);
				idmap.put(columnName, f.get(t));
			}
		} catch (IllegalArgumentException e) {
			throw new DaoException(e);
		} catch (IllegalAccessException e) {
			throw new DaoException(e);
		}
		return idmap;
	}
	
	/**
	 * 获取行记录值Map（包含主键，创建表记录时使用）
	 * @return Map<字段名, 字段值>
	 */
	public Map<String, Object> getRowMapForCreate(){
		T t = getDomain();
		Map<String, Object> row = new HashMap<String, Object>();
		Map<String, Field> columns = dmd.getColumns();
		Set<String> columnsWithoutPk = dmd.getcolumnsWithoutPk();
		Map<String, IdGenerationType> pks = dmd.getPks();
		try {
			for(String columnName : columnsWithoutPk){
				Field f = columns.get(columnName);
				row.put(columnName, f.get(t));
			}
			for(String columnName : pks.keySet()){
				Field f = columns.get(columnName);
				IdGenerationType idtype = pks.get(columnName);
				Object value = f.get(t);
				switch(idtype){
					case AUTO:
						break;
					case ASSIGN:
						row.put(columnName, value);
						break;
					case SEQUENCE:
						//TODO: doit
						break;
					case UUID:
						if(null == value){
							String uuid = IdUtil.uuid();
							f.set(t, uuid);
							row.put(columnName, uuid);
						}
				}
			}
		} catch (IllegalArgumentException e) {
			throw new DaoException(e);
		} catch (IllegalAccessException e) {
			throw new DaoException(e);
		}
		return row;
	}


	/**
	 * 记录ResultSet到域对象的转化
	 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
	 */
	public T mapRow(ResultSet rs, int index) throws SQLException {
		Map<String, Field> columns = dmd.getColumns();
		T t = getDomain();
		try {
			for(String columnName : columns.keySet()){
				Field f = columns.get(columnName);
				Class<?> ftype = f.getType();
				if(String.class.equals(ftype)){
						f.set(t, rs.getString(columnName));
				}else if ("int".equals(ftype.getName())){
					f.setInt(t, rs.getInt(columnName));
				}else if(Integer.class.equals(ftype)) {
					f.set(t, new Integer(rs.getInt(columnName)));
	            }else if("long".equals(ftype.getName()) ) {
	            	f.setLong(t, rs.getLong(columnName));
	            }else if(Long.class.equals(ftype)) {
	            	f.set(t, new Long(rs.getLong(columnName)));
	            }else if(Date.class.equals(ftype)){
	            	f.set(t, rs.getTimestamp(columnName));//会否有问题？
	            }else if(Timestamp.class.equals(ftype)){
	            	f.set(t, rs.getTimestamp(columnName));
	            }else if("double".equals(ftype.getName()) ) {
	            	f.setDouble(t, rs.getDouble(columnName));
	            }else if( Double.class.equals(ftype)) {
	            	f.set(t, new Double(rs.getDouble(columnName)));
	            }else if("short".equals(ftype.getName()) ) {
	            	f.setShort(t, rs.getShort(columnName));
	            }else if( Short.class.equals(ftype)) {
	            	f.set(t, new Short(rs.getShort(columnName)));
	            }else if("float".equals(ftype.getName())) {
	            	f.setFloat(t, rs.getFloat(columnName));
	            }else if( Float.class.equals(ftype)) {
	            	f.set(t, new Float(rs.getFloat(columnName)));
	            }
			}
		} catch (IllegalArgumentException e) {
			throw new DaoException(e);
		} catch (IllegalAccessException e) {
			throw new DaoException(e);
		}
		
		return t;
	}
	
}
