package com.ohmija.controller;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	
	
	@PostMapping("/getLogin")
	public int getLogin(@RequestBody MemberDTO dto, HttpSession session) {
		MemberDTO login = memberService.login(dto);
		if(login != null) {
			session.setAttribute("login", login);
			System.out.println("로그인 성공");
			return 1;
		}
		else {
			System.out.println("로그인실패");
			return 0;
		}	
	}	
	
	@PostMapping("/send_Auth_Idnum")
	public HashMap<String, Object> send_Auth_Idnum(@RequestBody MemberDTO dto, HttpSession session) throws IOException {


		String name = memberService.selectMyid(dto.getName());
		session.setAttribute("name", name);
		
		int row = memberService.selectid(dto);
		int row2 = 0;
		if (row != 0) {
			row2 = memberService.sendAuthNumber(dto);
			session.setAttribute("authNumber", row2);
			session.setMaxInactiveInterval(180);
			System.out.println("row2 = " + session.getAttribute("authNumber"));
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("success", row2 > 0 ? 1 : 0);
		result.put("message", row2 > 0 ? "메일이 발송되었습니다" : "메일 전송에 실패했습니다");
		return result;
	}

	@GetMapping("/check_Number/{authNumber}")
	public int check_Number(@PathVariable("authNumber") int authNumber, HttpSession session) {
		int sessionNumber = (int) session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		return authNumber == sessionNumber ? 1 : 0;
	}
	
	@GetMapping("/end")
	public void end(HttpServletRequest request) {
	    System.out.println("end");
	    HttpSession session = request.getSession(false);
	    System.out.println("name1 = " + session.getAttribute("name"));
	    if (session != null) {
	        session.invalidate();
	    }
	    System.out.println(session == null ? 1 : 2);
	    System.out.println("end2");
	    
	}
	
	@PostMapping("/send_Auth_pwnum")
	public HashMap<String, Object> send_Auth_pwnum(@RequestBody MemberDTO dto, HttpSession session) throws IOException {

		String userid = memberService.selectMyid(dto.getName());
		session.setAttribute("userid", userid);
		System.out.println("session name = " +  session.getAttribute("userid"));
		
		int row = memberService.selectpw_id(dto);
		int row2 = 0;
		if (row != 0) {
			row2 = memberService.sendAuthNumber(dto);
			session.setAttribute("authNumber", row2);
			session.setMaxInactiveInterval(180);
			System.out.println("row2 = " + session.getAttribute("authNumber"));
		}

		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("success", row2 > 0 ? 1 : 0);
		result.put("message", row2 > 0 ? "메일이 발송되었습니다" : "메일 전송에 실패했습니다");
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
		System.out.println(row);
		return String.format("%d", row);
	}
	
	@GetMapping("/nicknNameCheck/{nickname}")
	public String nickNameCheck(@PathVariable("nickname")String nickname) {
		int row = memberService.nickNameCheck(nickname);
		return String.format("%d", row);
	}
	
	@GetMapping("/emailCheck/{email}")
	public int emailCheck(@PathVariable("email")String email) {
		int row = memberService.emailCheck(email);
		System.out.println("경로이메일"+email);
		System.out.println("이메일  row : "+row);
		return  row;
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
	
	@GetMapping("/userpwsam/{newPassword}")
	public int userpwsam(@PathVariable("newPassword") String newPassword) {
		int row = mypageService.userpwsam(newPassword);
		return row;
	}
	
	@PostMapping("/userpwNew")
	public HashMap<String, Object>userpwNew (@RequestBody MemberDTO dto) {
		int passNew = mypageService.userpwNew(dto);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("passNew", passNew);
		result.put("status", true);
		return result;
	}

	@PostMapping("/passCheck_before/")
	public int passCheck_before(@RequestBody MemberDTO dto) {
		System.out.println("아이디 비번 일치 불일치");
		
		System.out.println(dto.getUserpw());
		System.out.println(dto.getUserid());
		
		int row = memberService.passCheck_before(dto);
		System.out.println(row);
		return row;
	}

	@PostMapping("/login_bye_check/")
	public int login_bye_check(@RequestBody MemberDTO dto, HttpSession session) {
		System.out.println("회원탈퇴");
		
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpw());
		
		int row = memberService.login_bye_check(dto);
		System.out.println("회원탈퇴 row : "+ row);
		session.invalidate();
		
		return row;
	}

	@PostMapping("/passupdate/")
	public int passupdate(@RequestBody MemberDTO dto) {
		int row = memberService.passupdate(dto);
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpw());
		return row;
	}

	@PostMapping("/image_choice")
    public int image_choice(@RequestBody MemberDTO dto, HttpSession session) {
        if(dto.getProfile_img().equals("1")) {dto.setProfile_img("https://hakcoding.github.io/img/마이멜로디.png");}
        if(dto.getProfile_img().equals("2")) {dto.setProfile_img("https://hakcoding.github.io/img/시나모롤.png");}
        if(dto.getProfile_img().equals("3")) {dto.setProfile_img("https://hakcoding.github.io/img/케로피.png");}
        if(dto.getProfile_img().equals("4")) {dto.setProfile_img("https://hakcoding.github.io/img/쿠로미.png");}
        if(dto.getProfile_img().equals("5")) {dto.setProfile_img("https://hakcoding.github.io/img/키티.png");}
        if(dto.getProfile_img().equals("6")) {dto.setProfile_img("https://hakcoding.github.io/img/폼폼푸린.png");}
        if(dto.getProfile_img().equals("7")) {dto.setProfile_img("https://hakcoding.github.io/img/구데타마.png");}
        if(dto.getProfile_img().equals("8")) {dto.setProfile_img("https://hakcoding.github.io/img/배드바츠마루.png");}
        if(dto.getProfile_img().equals("9")) {dto.setProfile_img("https://hakcoding.github.io/img/포차코.png");}
        
        int row = memberService.profileUpdate(dto);
        session.setAttribute("login", dto);
        return row;
    }


}
