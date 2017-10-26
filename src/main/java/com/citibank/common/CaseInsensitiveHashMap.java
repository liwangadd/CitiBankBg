/*
 * Copyright © 2011 Beijing HiGiNet Technology Co.,Ltd.
 * All right reserved.
 *
 */
package com.citibank.common;

import java.util.HashMap;

/**
 * 不区分大小写key的Map
 *
 * @param <K> 键名类型
 * @param <V> 键值类型
 * 
 * @author chenr
 * @version 2.0.0, 2011-6-22
 */
public class CaseInsensitiveHashMap<K, V> extends HashMap<K, V> {

	private static final long serialVersionUID = -8070414666027286684L;

	private Object getKey1(Object o) {
		if (o instanceof String) {
			return ((String) o).toUpperCase();
		} else {
			return o;
		}
	}

	@SuppressWarnings("unchecked")
	private K getKey2(K o) {
		if (o instanceof String) {
			return (K) ((String) o).toUpperCase();
		} else {
			return o;
		}
	}

	public CaseInsensitiveHashMap() {
		super();
	}

	public CaseInsensitiveHashMap(int initialCapacity) {
		super(initialCapacity);
	}

	/**
	 * @see java.util.Map#containsKey(Object)
	 */
	public boolean containsKey(Object key) {
		return super.containsKey(getKey1(key));
	}

	/**
	 * @see java.util.Map#get(Object)
	 */
	public V get(Object key) {
		return super.get(getKey1(key));
	}

	/**
	 * @see java.util.Map#put(Object, Object)
	 */
	public V put(K key, V value) {
		return super.put(getKey2(key), value);
	}

	/**
	 * @see java.util.Map#remove(Object)
	 */
	public V remove(Object key) {
		return super.remove(getKey1(key));
	}
}