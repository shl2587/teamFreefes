package com.ohmija.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.MemberDTO;

public  class LoginRoleInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    if (request == null) {
	        System.out.println("Request is null");
	        response.sendRedirect("/");
	        return false;
	    }

	    HttpSession session = request.getSession();
	    if (session == null) {
	        System.out.println("Session is null");
	        response.sendRedirect("/");
	        return false;
	    }

	    MemberDTO dto = (MemberDTO) session.getAttribute("login");
	    if (dto == null) {
	        System.out.println("DTO is null");
	        response.sendRedirect("/");
	        return false;
	    }

	    int role = dto.getRole();
	    if (role != 0) {
	        response.sendRedirect("/");
	        return false;
	    }

	    return true;
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
