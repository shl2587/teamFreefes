package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.service.Post_messageService;

@RestController
public class MessageAjaxController {
	
	@Autowired private Post_messageService post_messageService; 
	
	@GetMapping("/message_delete/{idx}")
	public String message_delete(@PathVariable("idx")int idx) {
		System.out.println("쪽지 삭제중");
		int row = post_messageService.delete(idx);
		System.out.println("쪽지 삭제 : "+row);
	    return String.format("%d", row);
	}
	
	@GetMapping("/receiver_nickname/{receiver}")
	public int receiver_nicknameCheck(@PathVariable("receiver")String receiver) {
		System.out.println("닉네임 체크");
		System.out.println(receiver);
		int row = post_messageService.receiver_nicknameCheck(receiver);
		System.out.println("닉네임 체크 확인 : "+row);
	    return row;
	}
	
	@GetMapping("/isValidTitle/{title}")
	public String isValidTitle(@PathVariable("title")String title) {
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
	    if (content != null && content.trim().length() <= 300) {
	        return String.format("%d", 1);
	    } else {
	        return String.format("%d", 0);
	    }
	}
	
	@GetMapping("/result_update/{idx}")
	public int result_update(@PathVariable("idx") int idx) {
		System.out.println("읽음 간다");
		int row = post_messageService.result_update(idx);
		System.out.println("읽음 간다" + row);
		return row;
	}
}
