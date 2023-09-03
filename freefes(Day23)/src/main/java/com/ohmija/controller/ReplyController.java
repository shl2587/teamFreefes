package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.ReplyDTO;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/member/mypage")
public class ReplyController {
	
	@Autowired private ReplyService replyService;
	
	@GetMapping("/reply_list/{idx}")
	public ModelAndView Favorites(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/reply_list");
		List<ReplyDTO> Rep = replyService.selectfav(idx);
		mav.addObject("Rep", Rep);
		return mav;
	}

}
