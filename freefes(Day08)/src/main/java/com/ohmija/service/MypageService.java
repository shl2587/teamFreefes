package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.MemberDTO;
import com.ohmija.repository.MypageDAO;

@Service
public class MypageService {
	
	@Autowired private MypageDAO dao;

	public int changepw(String userpw2) {
		return dao.changepw(userpw2);
	}

	public int update(MemberDTO dto) {
		return dao.update(dto);
	}

	public int userpwsam(String userpw) {
		return dao.selectuserpw(userpw);
	}

	public int userpwNew(MemberDTO dto) {
		return dao.userpwNew(dto);
	}

	

}
