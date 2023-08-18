package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.DataDTO;
import com.ohmija.repository.DataDAO;

@Service
public class DataService {

	@Autowired DataDAO dao;

	@Transactional
	public int insert(DataDTO dto) {
		return dao.insert(dto);
	}

	
}
