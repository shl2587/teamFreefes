package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.MemberDTO;

@Repository
public interface MemberDAO {

	int insert(MemberDTO dto);

	int insertpasswd(String userpw);

	int resetPassword(MemberDTO dto);

	MemberDTO selectLogin(MemberDTO dto);

	String selectlogin(MemberDTO dto);
	
	int selectCount(String userid);
	
	int findId(MemberDTO dto);

	int findId2(String name, String email);
	
	int nickCheck(String nickname);

	int nickNameCheck(String nickname);

	int emailCheck(String email);

	String selectEmail(MemberDTO dto);



}
