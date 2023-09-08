package com.ohmija.component;

import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


@Component
public class FesboardComponent {

	@Scheduled(fixedDelay = 5000)
	public void viewCountUpdate() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        if (attributes != null) {
        	HttpSession session = attributes.getRequest().getSession();
        	session.removeAttribute("viewed_boards");
        	System.out.println("해시값 삭제 완료");
        }
    }
}	
