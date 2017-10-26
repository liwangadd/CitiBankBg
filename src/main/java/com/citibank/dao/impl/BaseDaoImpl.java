/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao.impl;

import com.citibank.dao.BaseDao;
import com.citibank.dao.InnerSql;
import com.citibank.dao.MapRowMapper;
import com.citibank.dao.Order;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.util.Assert;

import javax.xml.transform.SourceLocator;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 基础数据库访问操作接口的默认实现；
 * 使用标准SQL拼装实现单表、批量等操作
 * 
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * @see com.citibank.dao.BaseDao
 */
public class BaseDaoImpl implements BaseDao {
	
	/**
	 * 查询指定SQL返回的记录总数
	 */
	private final static String COUNT_SQL = "SELECT COUNT(0) FROM (${SQL}) TEMP_C";
	
	/**
	 * Spring的JDBC操作模板类实例
	 * @see org.springframework.jdbc.core.JdbcTemplate
	 */
	private JdbcTemplate jdbcTemplate;
	/**
	 * Spring的JDBC 命名参数操作模板类实例
	 * @see org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate
	 */
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	
	/**
	 * 注入JdbcTemplate对象
	 * @param jdbcTemplate
	 * 
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate = jdbcTemplate;
		this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
	}
	
	/**
	 * 获取JdbcTemplate对象
	 * @return JdbcTemplate对象
	 */
	public JdbcTemplate getJdbcTemplate(){
		return this.jdbcTemplate;
	}
	
	/**
	 * 获取NamedParameterJdbcTemplate对象
	 * @return NamedParameterJdbcTemplate对象
	 */
	public NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
		return this.namedParameterJdbcTemplate;
	}
	
	public void create(String tbName, Map<String, ?> row) {
		Assert.notEmpty(row);
		
		List<Object> plist = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("INSERT INTO ");
		sb.append(tbName).append(" (");
		StringBuffer sb2 = new StringBuffer("VALUES (");
		for(String key : row.keySet()){
			sb.append(key);

			Object o = row.get(key);
			if(o instanceof InnerSql){
				sb2.append(((InnerSql) o).getSql());
			}else{
				sb2.append('?');
				plist.add(o);
			}
			sb.append(", ");
			sb2.append(", ");
		}
		sb.replace(sb.length() - 2, sb.length() - 1, ")");
		sb2.replace(sb2.length() - 2, sb2.length() - 1, ")");
		sb.append(sb2);
		this.jdbcTemplate.update(sb.toString(), plist.toArray());
	}
	
	public int update(String tbName, Map<String, ?> row, Map<String, ?> conds) {
		Assert.notEmpty(row);
		Assert.notEmpty(conds);
		
		List<Object> plist = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("UPDATE ");
		sb.append(tbName).append(" SET ");
		
		for(String key : row.keySet()){
			sb.append(key).append('=');
			Object o = row.get(key);
			if(o instanceof InnerSql){
				sb.append(((InnerSql) o).getSql());
			}else{
				sb.append('?');
				plist.add(o);
			}
			sb.append(", ");
		}
		sb.delete(sb.length() - 2, sb.length() - 1);
		sb.append(" WHERE ");
		for(String key : conds.keySet()){
			sb.append(key).append('=');
			Object o = conds.get(key);
			if(o instanceof InnerSql){
				sb.append(((InnerSql) o).getSql());
			}else{
				sb.append('?');
				plist.add(o);
			}
			sb.append(" AND ");
		}
		sb.delete(sb.length() - 5, sb.length() - 1);
		return this.jdbcTemplate.update(sb.toString(), plist.toArray());
	}
	
	public Map<String, Object> retrieve(String tbName, Map<String, ?> conds) {
		Assert.notEmpty(conds);

		List<Object> plist = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("SELECT * FROM ");
		sb.append(tbName.toUpperCase()).append(" WHERE ");

		for (String key : conds.keySet()) {
			sb.append(key.toUpperCase()).append('=');
			Object o = conds.get(key);
			if (o instanceof InnerSql) {
				sb.append(((InnerSql) o).getSql());
			} else {
				sb.append('?');
				plist.add(o);
			}
			sb.append(" AND ");
		}
		sb.delete(sb.length() - 5, sb.length() - 1);

		List<Map<String, Object>> list = queryForList(sb.toString(), plist.toArray());
		
		if (list.size() > 0) {
			return list.get(0);
		}
		return Collections.emptyMap();
	}

	public int delete(String tbName, Map<String, ?> conds) {
		Assert.notEmpty(conds);
		List<Object> plist = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("DELETE FROM ");
		sb.append(tbName.toUpperCase()).append(" WHERE ");
		
		for(String key : conds.keySet()){
			sb.append(key.toUpperCase()).append('=');
			Object o = conds.get(key);
			if(o instanceof InnerSql){
				sb.append(((InnerSql) o).getSql());
			}else{
				sb.append('?');
				plist.add(o);
			}
			sb.append(" AND ");
		}
		sb.delete(sb.length() - 5, sb.length() - 1);
		
		return this.jdbcTemplate.update(sb.toString(), plist.toArray());
	}

	public List<Map<String, Object>> listAll(String tbName) {
		StringBuffer sb = new StringBuffer("SELECT * FROM ")
			.append(tbName.toUpperCase());
		return queryForList(sb.toString());
	}

	public List<Map<String, Object>> listAll(String tbName, Order o) {
		StringBuffer sb = new StringBuffer("SELECT * FROM ")
		.append(tbName.toUpperCase()).append(o.toSqlString());
		return queryForList(sb.toString());
	}
	
	@SuppressWarnings("unchecked")
	public long count(String sql){
		//System.out.println(COUNT_SQL.replaceFirst("\\$\\{SQL\\}", sql));
		return this.jdbcTemplate.queryForLong(COUNT_SQL.replaceFirst("\\$\\{SQL\\}", sql));
	}
	
	@SuppressWarnings("unchecked")
	public long count(String sql, Object... params){
		if(params.length == 0){
			return this.jdbcTemplate.queryForLong(COUNT_SQL.replaceFirst("\\$\\{SQL\\}", sql));
		}
		return this.jdbcTemplate.queryForLong(COUNT_SQL.replaceFirst("\\$\\{SQL\\}", sql), params);
	}
	
	public long count(String sql, Map<String, ?> params){
		return this.namedParameterJdbcTemplate.queryForLong(COUNT_SQL.replaceFirst("\\$\\{SQL\\}", sql), params);
	}
	
	public List<Map<String, Object>> queryForList(String sql, Map<String, ?> params){
		return this.namedParameterJdbcTemplate.query(sql, params, new MapRowMapper());
	}
	
	public List<Map<String, Object>> queryForList(String sql, Object... params){
		if(params.length == 0){
			return jdbcTemplate.query(sql, new MapRowMapper());
		}
		return jdbcTemplate.query(sql, params, new MapRowMapper());
	}

	public int executeUpdate(String sql, Object... params) {
		if(params.length == 0){
			return this.jdbcTemplate.update(sql);
		}
		return this.jdbcTemplate.update(sql, params);
	}

	public int executeUpdate(String sql, Map<String, ?> params) {
		return this.namedParameterJdbcTemplate.update(sql, params);
	}

	public int[] batchUpdate(String[] sql) {
		return this.jdbcTemplate.batchUpdate(sql);
	}

	@SuppressWarnings("unchecked")
	public int[] batchUpdate(String sql, List<Map<String, ?>> batchValues) {
		return this.namedParameterJdbcTemplate.batchUpdate(sql, batchValues.toArray(new Map[0]));
	}

	public int[] batchUpdate(String sql, final Object[][] batchValues) {
		
		return this.jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				for(int index = 0; index < batchValues[i].length; index++){
					Object value = batchValues[i][index];
					StatementCreatorUtils.setParameterValue(ps, index+1, SqlTypeValue.TYPE_UNKNOWN, value);
				}
			}
			
			public int getBatchSize() {
				return batchValues.length;
			}
		});
	}

}
