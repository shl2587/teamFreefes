package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.PostMessageDTO;

@Repository
public interface PostMessageDAO {

	int insertMessage(PostMessageDTO message);

	


	
}
