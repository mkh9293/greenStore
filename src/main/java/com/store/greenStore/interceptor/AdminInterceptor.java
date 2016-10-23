package com.store.greenStore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.store.greenStore.dto.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member user=(Member)session.getAttribute("login");
		
		if(!(user.getMname().equals("admin"))){
			response.sendRedirect("/greenStore");
			return false;
		}
		
		return true;
	}
	
}
