package com.ohmija.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.service.MemberService;
import com.ohmija.model.MemberDTO;

@RestController
public class MemberAjaxController {

	@Autowired	private MemberService memberService;


	@PostMapping("/getlogin")
	public HashMap<String, Object> getlogin(@RequestBody MemberDTO dto) {
		System.out.println(dto.getUserid() + "확인");
		System.out.println(dto.getUserpw());
		String email = memberService.getlogin(dto);

		HashMap<String, Object> result = new HashMap<>();
		result.put("email", email);
		result.put("status", email != null);
		return result;
	}
	
	
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
		String email = memberService.getEmail(dto);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("email", email);
		result.put("status",email != null);
		return result;
	}

}


















