package com.ohmija.repository;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.ohmija.model.MemberDTO;

@Repository
public interface MemberDAO {
	int insert(MemberDTO dto);

	int selectCount(String userid);

	int insertpasswd(String userpw);

	MemberDTO findId(HashMap<String, Object> param);

	int findId2(String name, String email);

	MemberDTO selectLogin(MemberDTO dto);

	int nickCheck(String nickname);

	int nickNameCheck(String nickname);

	int emailCheck(String email);

	String selectEmail(MemberDTO dto);

	int selectid(MemberDTO dto);

	String selectMyid(String name);

	int selectpw_id(MemberDTO dto);
}
