package com.citibank.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class JndiDataSource {
	
	private Object jndiObject =null;

	public boolean isSingleton() {
		return true;
	}

	/**
	 * Return the singleton JNDI object.
	 */
	public Object getInstance(String name) throws NamingException{
	  if (jndiObject != null) {
			return jndiObject;
	  }
	  Context ctx=new InitialContext();
	  Object obj = ctx.lookup(name);
	  jndiObject = obj;
	  return jndiObject;
	}
}
