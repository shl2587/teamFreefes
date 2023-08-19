package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.repository.Admin_boardDAO;

@Service
public class Admin_boardService {

	@Autowired
	private Admin_boardDAO dao;

	public List<Admin_boardDTO> selectAll() {
		return dao.selectAll();
	}

	public Admin_boardDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(Admin_boardDTO dto) {
		return dao.admin_write(dto);
	}
	
	
}
