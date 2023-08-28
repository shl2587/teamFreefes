package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohmija.model.PostMessageDTO;
import com.ohmija.service.PostMessageService;

@Controller
@RequestMapping("/message")
public class PostMessageController {

	@Autowired
	private PostMessageService postMessageService;
	
	@PostMapping("/send")
	@ResponseBody
	public String sendMessage(@RequestBody PostMessageDTO message) {
		postMessageService.sendMessage(message);
		return "wanlyo";
	}
	
	
}
