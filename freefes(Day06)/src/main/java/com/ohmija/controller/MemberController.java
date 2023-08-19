package com.ohmija.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohmija.service.MemberService;
import com.ohmija.model.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/qwer")
	public void qwer() {}	
	@GetMapping("/qwer2")
	public void qwer2() {}	
	
	@GetMapping("/terms")
	public void terms() {}	
	
	// 병학 로그인
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = memberService.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	// 계립 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 계립
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto,String userpw, String nickname){
		int row = memberService.insert(dto);
		return "redirect:/";
	}
	
	@GetMapping("/repw_email")
	public void repw_email() {}	
	
	@PostMapping("/repw_email")
	public String repw_email(MemberDTO dto) throws IOException {
		int row = memberService.resetPassword(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public void findId() {}
	
//	@PostMapping("/findId")
//	public String findId(MemberDTO dto) {
//		int row = memberService.findId(dto);
//		System.out.println(row != 0 ? "성공" : "실패");
//		return "redirect:/member" + (row != 0 ? "/findIdPage" : "/findId");
//	}
	
	// 이거 두개는 무엇인고??????????????
	@GetMapping("/findIdPage")
	public void findIdPage() {}
	
	@GetMapping("/noFind")
	public void noFind() {}
}
