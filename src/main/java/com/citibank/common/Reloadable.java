package com.citibank.common;

/**
 * 重载接口
 * 实现该接口，可留作重载内容之用；
 * 在集群环境下应发送组播到其他节点通知更新（未实现）
 * 
 * @author zmy
 * @version 2014-07-01
 * 
 */
public interface Reloadable {

	/**
	 * 最后重载时间
	 * @return long型毫秒时间
	 */
	public long lastModify();
	
	/**
	 * 重载方法;
	 * 实现注意同步
	 */
	public void reload();
}
