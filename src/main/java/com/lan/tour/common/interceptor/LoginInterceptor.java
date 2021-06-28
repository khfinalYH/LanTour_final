package com.lan.tour.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getRequestURI().contains("/loginform.do")||
		   request.getRequestURI().contains("/register.do")||
		   request.getRequestURI().contains("/idcheck.do")||
		   request.getRequestURI().contains("/login.do")||
		   request.getRequestURI().contains("/loginres.do")) {
			return true;
		}

		if(request.getSession().getAttribute("login")==null) {
			response.sendRedirect("loginform.do");
		}
			
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
