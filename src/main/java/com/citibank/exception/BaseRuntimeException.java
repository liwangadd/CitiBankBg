/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.exception;

/**
 * 基础运行时异常
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * 
 */
public class BaseRuntimeException extends RuntimeException {
	
	private static final long serialVersionUID = 1431341934573539432L;

	/**
	 * 实例化一个基础运行时异常
	 * @param msg 异常消息
	 */
	public BaseRuntimeException(String msg) {
		super(msg);
	}
	
	/**
	 * 实例化一个基础运行时异常
	 * @param cause 异常
	 */
	public BaseRuntimeException(Throwable cause) {
		super(cause);
	}
	
	/**
	 * 实例化一个基础运行时异常
	 * @param msg 异常消息
	 * @param cause 异常
	 */
	public BaseRuntimeException(String msg, Throwable cause) {
		super(msg, cause);
	}
	
}
