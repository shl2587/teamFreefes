package com.ohmija.service;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.mail.MailComponent;
import com.ohmija.repository.MemberDAO;
import com.ohmija.model.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MailComponent mailComponent;
	@Autowired private MemberDAO dao;
	@Value("classpath:resetPassword.html")
	private Resource html;
	private Random ran = new Random();

	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}
	
	// 병학 코드
	@Transactional
	public int resetPassword(MemberDTO dto) throws IOException {
		
		// 1) 비밀번호 업데이트
		String userpw = (ran.nextInt(999999) + 100000) + "";
		dto.setUserpw(userpw);
		int row = dao.resetPassword(dto);
		
		// 2) 변경이 성공적으로 수행되었다면, 이메일 전송
		if(row != 0) {
			String content = "";
			Scanner sc = new Scanner(html.getFile());
			while(sc.hasNextLine()) {
				content += sc.nextLine();
			} 
			sc.close();
			content = String.format(content, userpw);
			mailComponent.sendMail(dto.getEmail(), content);
		}
		return row;
	}

	// 병학 코드
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.selectLogin(dto);
		return login;
	}

	// 계립 코드
	public int dupCheck(String userid) {
		return dao.selectCount(userid);
	}
	
	// 계립 코드
	public int passCheck(String userpw) {		
		  int row = 0;
		    // 1) 걸러줄 변수 지정
		    String small_letter = "abcdefghijklmnopqrstuvwxyz";
		    String capital_letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    String special = "!@#$%^&*()_+[]{}|;:,.<>?";

		    boolean containsLower = false;
		    boolean containsUpper = false;
		    boolean containsSpecial = false;

		    // 소문자, 대문자, 특수 문자 포함 여부 검사
		    for (char letter : userpw.toCharArray()) {
		        if (small_letter.contains(String.valueOf(letter))) {
		            containsLower = true;
		        } else if (capital_letter.contains(String.valueOf(letter))) {
		            containsUpper = true;
		        } else if (special.contains(String.valueOf(letter))) {
		            containsSpecial = true;
		        }
		    }

		    if (userpw.length() > 7 && userpw.length() < 21) {
		        if (containsLower && containsUpper && containsSpecial) {
		            row = dao.insertpasswd(userpw);
		            System.out.println("비밀번호 사용 가능합니다.");
		            return row; // 올바른 경우에만 DAO에 비밀번호 삽입 요청
		        } else {
		            System.out.println("비밀번호는 영문과 특수문자 숫자를 포함하여야 합니다.");
		        }
		    } else {
		        System.out.println("8자리 이상 20자리 이하의 비밀번호여야 합니다.");
		    }
		    return row;

	}

	// 병학 코드
	public String getlogin(MemberDTO dto) {
		return dao.selectlogin(dto);
	}
	
	// 계립 코드
	public int findId2(String name, String email) {
		return dao.findId2(name, email);
	}


	public int nickNameCheck(String nickname) {
		return dao.nickNameCheck(nickname);
	}

	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	public String getEmail(MemberDTO dto) {
		return dao.selectEmail(dto);
	}
}
