package com.market.rabbit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("controller 요청 전");
		boolean pass = false;//false 가 반환되면 컨트롤러로 접근이 불가능 하다.		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginId") == null) {
			System.out.println("로그인 처리가 안되어있음");
			response.sendRedirect("/rabbit/member/memberLogin");
		}else {
			System.out.println("로그인 처리 되어있음");
			pass = true;
		}		
		return pass;
	}
}
