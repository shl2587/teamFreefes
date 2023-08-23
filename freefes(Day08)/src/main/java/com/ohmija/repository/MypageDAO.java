package com.ohmija.repository;

import java.util.List;

import com.ohmija.model.MemberDTO;

public interface MypageDAO {

	List<MemberDTO> selectImg();

	int changepw(String userpw2);

	int selectuserpw(String userpw);

	int userpwNew(MemberDTO dto);

	int update(MemberDTO dto);


}
