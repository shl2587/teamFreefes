package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.MemberDTO;
import com.ohmija.service.MemberService;
import com.ohmija.service.MypageService;

@Controller
@RequestMapping("/member/mypage")
public class MypageController {
	
	@Autowired private MypageService mypageService;
	@Autowired private MemberService memberService;
	
	@GetMapping("/mypage/{idx}")
	public ModelAndView mypage(@PathVariable("idx")int idx) {
		ModelAndView mav =new ModelAndView("/member/mypage/mypage");
		 MemberDTO tmp = memberService.selectOne(idx);
		 mav.addObject("login", tmp);
		return mav;
	}
	
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/modify");
		 MemberDTO tmp = memberService.selectOne(idx);
		 mav.addObject("login", tmp);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(@PathVariable("idx")int idx, MemberDTO dto) {
		int row = mypageService.update(dto);
		System.out.println(row);
		return "redirect:/mypage/mypage";
	}

	@GetMapping("/changeProfile")
	public void changeProfile() {}
	


}
