package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.ReplyDTO;

@Repository
public interface ReplyDAO {

	List<ReplyDTO> selectfav(int idx);

}
