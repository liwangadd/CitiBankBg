package com.citibank.common;

import java.util.*;

import javax.servlet.http.*;

public class SessionContext {

	public static void injectUserId(Map<String, Object> value, HttpSession session) {
		Object user_id = session.getAttribute("user_id");
		if (user_id != null) {
			value.put("user_id", user_id);
		}
	}

	public static void injectUserId(Map<String, Object> value, HttpServletRequest request) {
		injectUserId(value, request.getSession());
	}

	public static String getUserId(HttpSession session) {
		return (String) session.getAttribute("user_id");

	}

	public static String getUserId(HttpServletRequest request) {
		return  request.getSession().getAttribute("user_id").toString();
	}
	
}
