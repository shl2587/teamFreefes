package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.MemberDTO;
import com.ohmija.repository.MypageDAO;

@Service
public class MypageService {
	
	@Autowired private MypageDAO dao;

	public int changepw(String userpw2) {
		return dao.changepw(userpw2);
	}

	public int update(MemberDTO dto) {
		System.out.println(dto.getPhonenumber());
		return dao.update(dto);
	}

	public int userpwsam(String newPassword) {
		return dao.selectuserpw(newPassword);
	}

	public int userpwNew(MemberDTO dto) {
		return dao.userpwNew(dto);
	}

	public MemberDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	

}
