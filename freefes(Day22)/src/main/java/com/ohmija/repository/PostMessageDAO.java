package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.Post_messageDTO;

@Repository
public interface PostMessageDAO {

	int sendMessage(Post_messageDTO dtoP);

	List<Post_messageDTO> selectMessage(int idx);

	int delete(int idx);

	List<Post_messageDTO> select_SendMessage(int idx);

	List<Post_messageDTO> select_recievedMessage(int idx);

	int insertMessage(Post_messageDTO message);
	
}
