package com.citibank.common;

import com.citibank.exception.BaseRuntimeException;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;



public class DataSourceFactory {
	private  static Object dataSourceFactory = null ;
	private  static String DB_TYPE = "db.dataSource.type";
	private  static String DB_DATABASECLASSNAME="db.dataBaseClassName";
//	private  static String DB_KEY="db.dataSource.key";
	private  static String ROOT_KEY="ess.comm_root_key";
//	private  static String DB_DECIPHERFIELD="db.dataSource.decipherField";
	private  static String DB_CLASS_ISSINGLETON = "isSingleton";
	private  static String DB_CLASS_GETINSTANCE = "getInstance";
	//可以加载不同的数据源
	//dbcp/c3p0/jndi ...
	//统一加载
	//加密连接字符串
//	<bean id="dataSource" class="DataSourceFactory"	 factory-method="getInstance" />
	private DataSourceFactory() {
		
	}
	public static Object getInstance(String basenames)
	{
		System.out.println("加载文件："+basenames);
		if (dataSourceFactory !=null) {
			return dataSourceFactory;
		}
		try {
			Properties properties = getProPerties(basenames);
			//加密密钥			
//			String encryptionKey = properties.getProperty(DB_KEY);
			String rootKey = properties.getProperty(ROOT_KEY);
			PropertyPlaceholderHelper prHelper = new PropertyPlaceholderHelper(properties,rootKey);
			properties = prHelper.resolveProperties();
			//加载的数据源类
			String className = properties.getProperty(DB_DATABASECLASSNAME);
			//数据源类型
			String type = properties.getProperty(DB_TYPE);
			//需要解密的字段			
//			String[] decipherfield = properties.getProperty(DB_DECIPHERFIELD).split(",");
			Class<?> c =  Class.forName(className);
			Object dataSource = c.newInstance();
//			System.out.println("b:"+dataSource);
//			Method[] ms=c.getDeclaredMethods(); 
			Method[] ms=c.getMethods();
			//判断是否是单例方法
			boolean isObj =false;
			for(Method m:ms){
				if (m.getName().equals(DB_CLASS_ISSINGLETON)) {
					Class<?>[] value_type =  m.getParameterTypes();
					Method m1 = c.getMethod(m.getName(),value_type); 
					isObj= (Boolean) m1.invoke(dataSource);
					System.out.println("isSingleton: "+isObj);
					if (isObj == true) {
						for(Method m_c:ms){
							if (m_c.getName().equals(DB_CLASS_GETINSTANCE) && properties.containsKey(type+"."+DB_CLASS_GETINSTANCE)) {
								Class<?>[] value_type_c =  m_c.getParameterTypes();
								Method m1_c = c.getMethod(m_c.getName(),value_type_c); 
								dataSourceFactory = m1_c.invoke(dataSource,changeValueType(value_type_c, properties.get(type+"."+DB_CLASS_GETINSTANCE).toString()));
//								System.out.println("e:"+dataSourceFactory);
								return dataSourceFactory;
								}
						}
						throw new IllegalArgumentException("Return the singleton object error!");
						}else {
							throw new IllegalArgumentException("Return the singleton object error!");
						}
				}
			}
			Map<String, String> propertesMap =  new HashMap<String, String>();
			for(Object key : properties.keySet()){
				String k = (String) key;
				if (k.substring(0, type.length()).equals(type)) {
					String value = properties.getProperty(k);
//					for (int i = 0; i < decipherfield.length; i++) {
//						if (k.equals(decipherfield[i])) {
//							value = decoder(encryptionKey, value);
//							break;
//						}
//					}
					k = k.substring(type.length()+1);
					k = k.substring(0, 1).toUpperCase()+k.substring(1); 
					propertesMap.put("set"+k, value);
				}
			}
			//循环自身的方法
//			System.out.println(ms.length);
			for(Method m:ms){ 
//				System.out.println(m.getName());
					if (propertesMap.containsKey(m.getName())) {
						Class<?>[] value_type =  m.getParameterTypes();
//						Method m1 = c.getDeclaredMethod(m.getName(),value_type); 
						Method m1 = c.getMethod(m.getName(),value_type); 
						System.out.println(m.getName()+"-->"+propertesMap.get(m.getName()));
						m1.invoke(dataSource, changeValueType(value_type, propertesMap.get(m.getName())));
						propertesMap.remove(m.getName());
					}
			}
			//判断propertesMap里面还有没有需要设置的方法，如果有则在其父类中查找
//			System.out.println(propertesMap.size());
			if (propertesMap.size()>0) {
				for (Method m:c.getMethods()) {
					if (propertesMap.containsKey(m.getName())) {
						Class<?>[] value_type =  m.getParameterTypes();
						Method m1 = getMethod(c,m.getName(),value_type); 
						if (m1 ==  null) {
							throw new NoSuchMethodException(m.getName()+" is not found");
						}
//						System.out.println(m.getName()+"-->"+propertesMap.get(m.getName()));
						m1.invoke(dataSource, changeValueType(value_type, propertesMap.get(m.getName())));
						propertesMap.remove(m.getName());
					}
				}
				
			}
//			System.out.println("e:"+dataSource);
			dataSourceFactory = dataSource;
			return dataSource;
		} catch (Exception e) {
			e.printStackTrace();
			throw new BaseRuntimeException(e);
		}
	}
		/**
	     * 反射获得方法，若本类不存在该方法则递归调用父类查找，若方法始终不存在返回空
	     * @author lzxz
	     * @param clazz           类对象
	     * @param methodName      方法名
	     * @param parameterTypes  方法参数列表
	     * @return 此方法获得Method对象总是可用的
	     */
		public static Method getMethod(Class<?> clazz, String methodName, Class<?>... parameterTypes) {
	
	        Method method = null;
	        try {
	            if(clazz == null) return null;
	            
	            method = clazz.getDeclaredMethod(methodName, parameterTypes);
	            method.setAccessible(true);
	            
	            return method;
	        } catch (NoSuchMethodException e) {
	            return getMethod(clazz.getSuperclass(), methodName, parameterTypes);
	        } catch (Exception e)
	        {
	        	e.printStackTrace();
	        }
	        return null;
	    }
//	private static String decoder(String encryptionKey,String value) throws Exception{
//		//加密数据解密
//		return DBUtil.decoder(value);
//	}
	public static Object[] changeValueType(Class<?>[] c,String... value) throws NumberFormatException, InstantiationException, IllegalAccessException
	{
		Object[] obj = new Object[value.length];
		if (c.length != value.length) {
			throw new IllegalArgumentException("Method error parameters");
		}
		for (int i = 0; i < c.length; i++) {
			if (c[i].equals(boolean.class)) {
				obj[i]=Boolean.valueOf(value[i].trim());
			}else if(c[i].equals(int.class)){
				obj[i]=Integer.parseInt(value[i].trim());
			}else if(c[i].equals(String.class)){
				obj[i]=value[i].trim();
			}else if(c[i].equals(long.class)){
				obj[i]=Long.valueOf(value[i].trim());
			}
		}
		return obj;
	}
	private  static Properties getProPerties(String basenames) throws IOException
	{
		Properties props = PropertiesUtil.load(basenames);
		return props;
	}
}
