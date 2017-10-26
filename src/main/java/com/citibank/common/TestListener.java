package com.citibank.common;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TestListener implements HttpSessionListener {

	Log log = LogFactory.getLog(TestListener.class);
		


	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
//		if(ts==null) {
//			ServletContext context = arg0.getSession().getServletContext();
//			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
//			ts = (TestService) ctx.getBean("testService");
//		}
//		
//		System.out.println(ts.echo("hello"));
//		
//		log.info("hello");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
//		System.out.println(ts.echo("bye"));
//		log.info("bye");
	}

}
