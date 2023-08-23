package com.ohmija.controller;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.model.MemberDTO;
import com.ohmija.service.MemberService;
import com.ohmija.service.MypageService;

@RestController
public class MemberAjaxController {
	
	@Autowired private MemberService memberService;
	@Autowired private MypageService mypageService;
	
	@GetMapping("/dupCheck/{userid}")
	public String dupCheck(@PathVariable("userid") String userid) {
		int row = memberService.dupCheck(userid);
		return String.format("%d",row);
	}
	
	@GetMapping("/passCheck/{userpw}")
	public String passCheck(@PathVariable("userpw") String userpw){
		int row = memberService.passCheck(userpw);
		return String.format("%d", row);
	}
	
	@GetMapping("/nicknNameCheck/{nickname}")
	public String nickNameCheck(@PathVariable("nickname")String nickname) {
		int row = memberService.nickNameCheck(nickname);
		return String.format("%d", row);
	}
	
	@GetMapping("/emailCheck/{email}")
	public String emailCheck(@PathVariable("email")String email) {
		int row = memberService.emailCheck(email);
		System.out.println("경로닉네임");
		return String.format("%d", row);
	}
	

	@PostMapping("/getEmail")
	public HashMap<String, Object> getEmail(@RequestBody MemberDTO dto){
		System.out.println(dto.getName());
		System.out.println(dto.getEmail());
		System.out.println("자바 난 정병학");
		String email = memberService.getEmail(dto);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("email", email);
		result.put("status",email != null);
		return result;
	}
	
	@PostMapping("/findId")
	public boolean login(@RequestBody HashMap<String, Object> param, HttpSession session) {
		int sessionNumber = (int)session.getAttribute("authNumber");
		boolean result = false;
		
		if(sessionNumber == (int)param.get("authNumber")) {
			MemberDTO findId = memberService.findId(param);
			session.setAttribute("findId", findId);
			session.setMaxInactiveInterval(600);
			result = true;
		}
		return result;
	}
	
	@GetMapping("/sendAuthNumber/{email}/")
	public HashMap<String, Object> sendAuthNumber(@PathVariable("email") String email, HttpSession session) throws IOException {
		System.out.println("email : " + email);
		int row = memberService.sendAuthNumber(email);
		if(row != 0) {
			session.setAttribute("authNumber", row);
			session.setMaxInactiveInterval(180);
		}
		HashMap<String, Object> result = new HashMap<>();
		result.put("success", row > 0 ? 1 : 0);
		result.put("message", row > 0 ? "메일이 발송되었습니다" : "메일 전송에 실패했습니다");
		return result;
	}
	
	@PostMapping("/upload_pw")
	public String upload_pw(MemberDTO dto, String userpw2, HttpSession session) {
		String loggedInUserId = (String) session.getAttribute("login.userid");
		
		int row = mypageService.changepw(userpw2);
		if(row != 0) {
			session.invalidate();			
		}
		return "redirect:/mypage/modify";
	}
	
	@GetMapping("/userpwsam/{userpw}")
	public String userpwsam(@PathVariable("userpw") String userpw) {
		int row = mypageService.userpwsam(userpw);
		System.out.println("userpw : "+userpw);
		return String.format("%d", row);
	}
	
	@PostMapping("/userpwNew")
	public HashMap<String, Object>userpwNew (@RequestBody MemberDTO dto) {
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpwNew());
		int passNew = mypageService.userpwNew(dto);
		System.out.println("안녕");
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("passNew", passNew);
		result.put("status", true);
		return result;
	}

	
}
