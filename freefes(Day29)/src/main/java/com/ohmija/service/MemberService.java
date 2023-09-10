package com.ohmija.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

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
	      dto.setUserpw(defense_BH(dto.getUserpw()));
	      return dao.insert(dto);
	   }

	public int dupCheck(String userid) {
		return dao.selectCount(userid);
	}


	public int passCheck(String userpw) {		
		  int row = 0;
		    // 1) 걸러줄 변수 지정
		    String lower_case = "abcdefghijklmnopqrstuvwxyz";
		    String upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    String special = "!@#$%^&*()_+[]{}|;:,.<>?";

		    boolean containsLower = false;
		    boolean containsUpper = false;
		    boolean containsSpecial = false;

		    // 소문자, 대문자, 특수 문자 포함 여부 검사
		    for (char c : userpw.toCharArray()) {
		        if (lower_case.contains(String.valueOf(c))) {
		            containsLower = true;
		        } else if (upper_case.contains(String.valueOf(c))) {
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
		return dao.passCheck_before(dto);
	}


	public MemberDTO selectVerify(MemberDTO dto) {
		return dao.selectVerify(dto);
	}

	public int selectAnswer(MemberDTO dto) {
		return dao.selectAnswer(dto);
	}

	public int login_bye_check(MemberDTO dto) {
		return dao.login_bye_check(dto);
	}

	public int passupdate(MemberDTO dto) {
		return dao.passupdate(dto);
	}

	public int update(MemberDTO dto) {
		return dao.update(dto);
	}

	public int profileUpdate(MemberDTO dto) {
	      return dao.profileUpdate(dto);
	}
	
	public String defense_BH(String userpw) {
	      StringBuffer reverse = new StringBuffer(userpw);
	      String reverse_pw = reverse.reverse().toString();
	      String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+[]{}|;:,.<>?";
	      String[] arr = str.split("");
	      String defense_BH = ""; 
	      Random ran = new Random();
	        int ran_number;
	        for (int i = 0; i < 5; i++) {
	           ran_number = ran.nextInt(arr.length);
	           defense_BH += arr[ran_number];
	      }
	        defense_BH  += userpw.length()/10 + arr[ran_number = ran.nextInt(arr.length)];
	       
	        for (int i = 0; i < userpw.length(); i++) {
	           if(userpw.length() % 2 ==  0) {
	              defense_BH += userpw.substring(i, i+1);
	           }
	           if(userpw.length() % 2 != 0) {
	              defense_BH += reverse_pw.substring(i, i+1);
	           }
	         for (int j = 0; j < 3; j++) {
	            defense_BH += arr[ran_number = ran.nextInt(arr.length)];
	         }
	        }
	      
	        for (int i = 0; defense_BH.length() < 94; i++) {
	           defense_BH += arr[ran.nextInt(arr.length)];
	      }
	        for (int i = 0; i < 10; i++) {
	           ran_number = ran.nextInt(arr.length);
	           if(userpw.length() % 2 !=  0) {
	              defense_BH = defense_BH.substring(0, 6) + arr[ran_number] +  defense_BH.substring(6);
	           }
	           if(userpw.length() % 2 == 0) {
	              defense_BH = defense_BH.substring(0, 6) + arr[ran_number] +  defense_BH.substring(6);
	              if(i == 4) {
	                 break;
	              }
	           }
	      }
	        if(defense_BH.length() !=99) {
	           defense_BH = defense_BH.substring(0, defense_BH.length()-5);
	        }
	        defense_BH += userpw.length()%10;
	      return defense_BH;
	   }
	   
	   public String decrypt_BH(String check_pw) {
	      int pass = 0;
	        String str = "";
	        String decrypt_BH = "";
	        StringBuffer reverse;
	        if(check_pw.substring(5,6).equals("0")) {
	           pass = Integer.parseInt(check_pw.substring(check_pw.length()-1));
	        }
	        if(!check_pw.substring(5,6).equals("0")) {
	           pass = Integer.parseInt(check_pw.substring(5,6)) * 10 +  Integer.parseInt(check_pw.substring(check_pw.length()-1));
	        }
	        
	        if(pass % 2 == 0) {
	           str = check_pw.substring(12, check_pw.length());
	        }
	        if(pass % 2 != 0) {
	           str = check_pw.substring(17, check_pw.length());
	        }
	        
	        for (int i = 0; i < pass*4; i = i+4) {
	           decrypt_BH += str.substring(i, i+1);
	      }
	        if(decrypt_BH.length() % 2 != 0) {
	           reverse = new StringBuffer(decrypt_BH);
	           decrypt_BH = reverse.reverse().toString();
	        }
	        System.out.println("decrypt_BH = " + decrypt_BH);
	      return decrypt_BH;
	   }
}
