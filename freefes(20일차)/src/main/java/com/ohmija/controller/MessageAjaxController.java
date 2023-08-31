package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.service.Post_messageService;

@RestController
public class MessageAjaxController {
	
	@Autowired private Post_messageService post_messageService; 
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx")int idx) {
		System.out.println("쪽지 삭제중");
		int row = post_messageService.delete(idx);
		System.out.println("쪽지 삭제 : "+row);
	    return String.format("%d", row);
	}
	
	@GetMapping("/reciever_nickname/{reciever}")
	public int reciever_nicknameCheck(@PathVariable("reciever")String reciever) {
		System.out.println("닉네임 체크");
		System.out.println(reciever);
		int row = post_messageService.reciever_nicknameCheck(reciever);
		System.out.println("닉네임 체크 확인 : "+row);
	    return row;
	}
	
	@GetMapping("/isValidTitle/{title}")
	public String isValidTitle(@PathVariable("title")String title) {
		int row = 0;
		System.out.println("쪽지 타이틀 길이 체크");
		if (title != null && title.trim().length() <= 30) {
			return String.format("%d", 1);
	    } else {
	    	return String.format("%d", 0);
	    }
	}
	
	@GetMapping("/isValidContent/{content}")
	public String contentCheck(@PathVariable("content") String content) {
	    System.out.println("쪽지 내용 길이 체크");
	    int row = 0;
	    if (content != null && content.trim().length() <= 300) {
	        return String.format("%d", 1);
	    } else {
	        return String.format("%d", 0);
	    }
	}
}
