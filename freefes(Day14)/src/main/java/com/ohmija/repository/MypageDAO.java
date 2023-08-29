package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.MemberDTO;

@Repository
public interface MypageDAO {

	List<MemberDTO> selectImg();

	int changepw(String userpw2);

	int selectuserpw(String userpw);

	int userpwNew(MemberDTO dto);

	int update(MemberDTO dto);


}
