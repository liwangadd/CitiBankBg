/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.dao;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * POJO映射到数据库表的主键标记;
 * @author chenr
 * @version 2.0.0, 2011-6-22
 * @see com.citibank.dao.Table
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Pk {
	/**
	 * 主键生成类型
	 * @return 主键生成类型(枚举)
	 * @see com.citibank.dao.IdGenerationType
	 */
	IdGenerationType value() default IdGenerationType.ASSIGN;
	/**
	 * 主键生成参数（目前未使用）
	 * @return 字符串
	 */
	String idGeneration() default "";
}
