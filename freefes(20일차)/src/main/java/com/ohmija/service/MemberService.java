package com.ohmija.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.ohmija.mail.MailComponent;
import com.ohmija.model.MemberDTO;
import com.ohmija.repository.MemberDAO;

@Service
public class MemberService {
	@Autowired private MailComponent mailComponent;
	@Autowired private MemberDAO dao;
	
	@Value("classpath:find.html")
	private Resource html;
	private Random ran = new Random();
	
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}

	public int dupCheck(String userid) {
		return dao.selectCount(userid);
	}


	public int passCheck(String userpw) {		
		  int row = 0;
		    // 1) 걸러줄 변수 지정
		    String abc = "abcdefghijklmnopqrstuvwxyz";
		    String ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    String special = "!@#$%^&*()_+[]{}|;:,.<>?";

		    boolean containsLower = false;
		    boolean containsUpper = false;
		    boolean containsSpecial = false;

		    // 소문자, 대문자, 특수 문자 포함 여부 검사
		    for (char c : userpw.toCharArray()) {
		        if (abc.contains(String.valueOf(c))) {
		            containsLower = true;
		        } else if (ABC.contains(String.valueOf(c))) {
		            containsUpper = true;
		        } else if (special.contains(String.valueOf(c))) {
		            containsSpecial = true;
		        }
		    }

		    if (userpw.length() > 7 && userpw.length() < 21) {
		        if (containsLower && containsUpper && containsSpecial) {
		            System.out.println("비밀번호 사용 가능합니다.");
		            return row =1;
		        } 
		        else {
		            System.out.println("비밀번호는 영문과 특수문자 숫자를 포함하여야 합니다.");
		        }
		    } else {
		        System.out.println("8자리 이상 20자리 이하의 비밀번호여야 합니다.");
		        return row = -1;
		    }
		    return row;
	}

	public int nickCheck(String nickname) {
		return dao.nickCheck(nickname);
	}

	public int findId2(String name, String email) {
		return dao.findId2(name, email);
	}

	public MemberDTO login(MemberDTO dto) {
		return dao.selectLogin(dto);
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

	public MemberDTO findId(HashMap<String, Object> param) {
		return dao.findId(param);
	}

	public int sendAuthNumber(MemberDTO dto) throws IOException {
		String content = "<h3>인증번호는 [%s]입니다</h3>";
		int authNumber = ran.nextInt(89999999) + 10000000;
		content = String.format(content, authNumber);
		
		String email = dto.getEmail();
		
		int row = mailComponent.sendMail(email, content);
		
		return row > 0 ? authNumber : row;
	}
	
	public int selectid(MemberDTO dto) throws IOException {
	    int row = dao.selectid(dto);
	    return row;
	}

	public String selectMyid(String name) {
		return dao.selectMyid(name);
	}

	public int selectpw_id(MemberDTO dto) {
		return dao.selectpw_id(dto);
	}
	
	public MemberDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int passCheck_before(MemberDTO dto) {
		System.out.println("넘어오냐");
		return dao.passCheck_before(dto);
	}


	public MemberDTO selectVerify(MemberDTO dto) {
		return dao.selectVerify(dto);
	}

	public int selectAnswer(MemberDTO dto) {
		return dao.selectAnswer(dto);
	}

}
