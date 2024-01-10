package com.fa.plus.admin.service;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginUserCounter implements HttpSessionListener {
	private int userCount;
	
	public void sessionCreated(HttpSessionEvent se ) {
		++userCount;
		System.out.println("생성된 SessionID " + se.getSession().getId());
		System.out.println("로그인된 사용자 수 : " + userCount);
		
	}
	
	public void sessionDestroyed(HttpSessionEvent se) {
		--userCount;
		System.out.println("제거된 Session Id" + se.getSession().getId());
		System.out.println("로그인된 사용자 수 : " + userCount);
	}
}
