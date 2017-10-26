package com.citibank.common;

import java.util.Map;

/**
 * 包装Map类，可以使用调用链;
 * 类似于StringBuffer的调用方式
 * <p>
 *  <code>Map<String, String> map = MapWrap.map("key1", "value1")
 *   .put("k2", "v2").put("k3", "v3").getMap();</code>
 * </p>
 * @param <K> 键名类型
 * @param <V> 键值类型
 * 
 * @author zmy
 * @version 2014-07-05
 */
public class MapWrap<K, V> {

	/**
	 * Map对象
	 */
	private Map<K,V> map;
	
	/**
	 * 实例化一个Map包装对象
	 * @param m Map对象
	 */
	public MapWrap(Map<K, V> m){
		this.map = m;
	}
	
	/**
	 * 加入一个键值对
	 * @param key 键名
	 * @param value 键值
	 * @return Map包装对象本身
	 */
	public MapWrap<K, V> put(K key, V value){
		this.map.put(key, value);
		return this;
	}
	
	/**
	 * 获取包装的Map对象
	 * @return Map对象
	 */
	public Map<K, V> getMap(){
		return this.map;
	}
	
	/**
	 * 返回一个CaseInsensitiveHashMap,放入了传入的一对key-&gt;value
	 * @param <K> 键名类型
	 * @param <V> 键名类型
	 * 
	 * @param key 键名
	 * @param value 键值
	 * @return Map包装对象
	 * 
	 * @see com.citibank.CaseInsensitiveHashMap
	 */
	public static <K,V> MapWrap<K, V> map(K key, V value){
		MapWrap<K, V> m = new MapWrap<K, V>(new CaseInsensitiveHashMap<K,V>());
		m.put(key, value);
		return m;
	}
}
