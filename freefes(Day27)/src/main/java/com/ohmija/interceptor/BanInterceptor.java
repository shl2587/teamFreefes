package com.ohmija.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.MemberDTO;

public class BanInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("login");

        if (member != null) {
            Date ban_until = member.getBan_until();
            Date currentDate = new Date();
            if (ban_until != null && ban_until.after(currentDate)) {
                response.sendRedirect("/freefes/ban_Page");
                return false;
            }
        }
        return true;
    }

    
    
    
    
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}