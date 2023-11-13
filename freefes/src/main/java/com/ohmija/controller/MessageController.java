package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.Post_messageDTO;
import com.ohmija.service.Post_messageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired private Post_messageService post_messageService;
	
	@GetMapping("/sendMessage/{idx}")
	public ModelAndView sendMessage(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/message/sendMessage");
		return mav;
	}
	
	@PostMapping("/sendMessage/{idx}")
	public String sendMessage(@PathVariable("idx")int idx, Post_messageDTO dtoP, String receiver_nickname) {
		post_messageService.sendMessage(dtoP, idx, receiver_nickname);
		return "redirect:/message/listMessage/{idx}";
	}
	
	@GetMapping("/listMessage/{idx}")
	public ModelAndView receiverMessage(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/message/listMessage");
		List<Post_messageDTO> list = post_messageService.selectMessage(idx);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/sendMessage_List/{idx}")
	public ModelAndView sendMessage_List(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/message/sendMessage_List");
		List<Post_messageDTO> list = post_messageService.select_SendMessage(idx);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/receivedMessage_List/{idx}")
	public ModelAndView recievedMessage_List(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/message/receivedMessage_List");
		List<Post_messageDTO> list = post_messageService.receivedMessage_List(idx);
		mav.addObject("list", list);
		return mav;
	}

}
