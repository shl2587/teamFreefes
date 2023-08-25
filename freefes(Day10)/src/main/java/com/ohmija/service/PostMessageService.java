package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.PostMessageDTO;
import com.ohmija.repository.PostMessageDAO;

@Service
public class PostMessageService {

	@Autowired
	private PostMessageDAO dao;

	public int sendMessage(PostMessageDTO message) {
		return dao.insertMessage(message);
	}
	
}
