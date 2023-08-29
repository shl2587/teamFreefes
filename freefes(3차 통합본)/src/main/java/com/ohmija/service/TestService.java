package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.repository.TestDAO;

@Service
public class TestService {
	
	@Autowired
	private TestDAO dao;

	public String getVersion() {
		return dao.selectVersion();
	}

}
