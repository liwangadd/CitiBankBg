/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

import java.util.List;

/**
 * 页对象（分页查询后结果）
 * @param <T> 页中记录列表的记录（可以是域对象或者Map）
 * 
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * 
 */
public class Page<T> {

	/**
	 * 页大小，默认25
	 */
	private int size = 25;
	/**
	 * 页码，默认1
	 */
	private int index = 1;
	/**
	 * 总记录数，默认0
	 */
	private long total = 0L;
	/**
	 * 记录列表
	 */
	private List<T> list;

	/**
	 * 页数
	 */
	private int pageCount;
	
	
	/**
	 * 获取页大小
	 * @return 整数
	 */
	public int getSize() {
		return size;
	}

	/**
	 * 设置页大小
	 * @param size 整数
	 */
	public void setSize(int size) {
		this.size = size;
	}

	/**
	 * 获取页码
	 * @return 整数
	 */
	public int getIndex() {
		return index;
	}

	/**
	 * 设置页码
	 * @param index 整数
	 */
	public void setIndex(int index) {
		this.index = index;
	}

	/**
	 * 获取总记录数
	 * @return 长整型数值
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * 设置总记录数
	 * @param total 长整型数值
	 */
	public void setTotal(long total,int pageSize) {
		this.total = total;
		this.pageCount= (int) (total/10);
		if(total%10!=0){
			this.pageCount++;
		}
	}

	/**
	 * 获取记录列表
	 * @return List<域对象（可以是POJO或者Map）>
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * 设置记录列表
	 * @param list List<域对象（可以是POJO或者Map）>
	 */
	public void setList(List<T> list) {
		this.list = list;
	}

	public int getpageCount() {

		return pageCount;
	}

}
