package com.ohmija.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohmija.model.MemberDTO;
import com.ohmija.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login =  memberService.login(dto);
		session.setAttribute("login", login);
		System.out.println(login.getIdx());
		return "redirect:/";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/terms")
	public void terms() {
	}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto,String userpw, String nickname){
		int row = memberService.insert(dto);
		return "redirect:/";
	}

	@GetMapping("/findId")
	public void findId() {}
	
	@GetMapping("repw_email")
	public void repw_email() {}

	@GetMapping("repw")
	public void repw() {}
	
	@GetMapping("verify")
	public void verify() {}
	
	

}
