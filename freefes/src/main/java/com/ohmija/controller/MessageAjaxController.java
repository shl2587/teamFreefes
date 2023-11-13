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
		int row = post_messageService.delete(idx);
	    return String.format("%d", row);
	}
	
	@GetMapping("/receiver_nickname/{receiver}")
	public int receiver_nicknameCheck(@PathVariable("receiver")String receiver) {
		System.out.println(receiver);
		int row = post_messageService.receiver_nicknameCheck(receiver);
	    return row;
	}
	
	@GetMapping("/isValidTitle/{title}")
	public int isValidTitle(@PathVariable("title")String title) {
		int row = 1;
		if (title != null && title.trim().length() <= 30) {
			return row;
	    } else {
	    	return row =0;
	    }
	}
	
	@GetMapping("/isValidContent/{content}")
	public int contentCheck(@PathVariable("content") String content) {
	    int row = 1;
	    if (content != null && content.trim().length() <= 300) {
	    	return row;
	    } else {
	    	return row =0;
	    }
	}
	
	@GetMapping("/result_update/{idx}")
	public int result_update(@PathVariable("idx") int idx) {
		int row = post_messageService.result_update(idx);
		return row;
	}
}
