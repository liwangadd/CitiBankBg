/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

import java.util.ArrayList;
import java.util.List;

/**
 * 排序辅助类；
 * 构建一个order by 之后的排序部分语句；
 * <code><pre>
 *  Order order = new Order();
 *  order.asc("field1").desc("field2")...
 *  order.toSqlString();
 * </pre></code>
 * 
 * @author chenr
 * @version 2.0.0, 2011-6-22
 */
public class Order {

	/**
	 * 是否反正顺序
	 */
	private boolean positive;
	/**
	 * 字段排序列表
	 */
	private List<OrderFragment> orderList = null;
	
	/**
	 * 字段排序（内部类）
	 * 包装一个字段的顺序
	 * 
	 */
	private class OrderFragment{
		/**
		 * 列名
		 */
		String columnName;
		/**
		 * 是否升序
		 */
		boolean ascending;
		/**
		 * 实例化字段排序对象（内部使用）;
		 * 请勿直接使用此构造函数
		 * @param colName 列名
		 * @param asc 是否升序
		 */
		OrderFragment(String colName, boolean asc){
			this.columnName = colName;
			this.ascending = asc;
		}
		
		/**
		 * 获取SQL字符串
		 * @return 字符串
		 */
		String toSqlString(){
			return new StringBuffer(this.columnName)
				.append((positive && ascending) ? " asc" : " desc")
				.toString();
		}
	}
	
	/**
	 * 实例化新的Order对象
	 * 内部排序列表为空
	 */
	public Order(){
		this.positive = true;
		this.orderList = new ArrayList<OrderFragment>();
	}
	
	/**
	 * 反向Order排序
	 * @return 对象本身
	 */
	public Order reverse(){
		this.positive = !this.positive ;
		return this;
	}
	
	/**
	 * 增加一个字段降序
	 * @param columnName
	 * @return 对象本身
	 */
	public Order desc(String columnName){
		orderList.add(new OrderFragment(columnName, false));
		return this;
		
	}
	
	/**
	 * 增加一个字段升序
	 * @param columnName
	 * @return 对象本身
	 */

	public Order asc(String columnName){
		orderList.add(new OrderFragment(columnName, true));
		return this;
	}
	
	/**
	 * 转化为可使用的SQL语句order by部分
	 * @return SQL字符串
	 */
	public String toSqlString(){
		if(orderList.size() == 0){
			return "";
		}
		StringBuffer sb = new StringBuffer();
		for(OrderFragment rf : orderList){
			sb.append(", ").append(rf.toSqlString());
		}
		if(sb.length() > 0)
			return " ORDER BY " + sb.substring(2);
		return "";
	}
	
	
	/**
	 * 重载了Object的toString方法，方便打印调试
	 * @see #toSqlString()
	 * @see Object#toString()
	 */
	public String toString(){
		return toSqlString();
	}
}
