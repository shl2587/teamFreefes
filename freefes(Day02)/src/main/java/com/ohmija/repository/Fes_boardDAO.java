package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;

@Repository
public interface Fes_boardDAO {

	int mainWrite(BoardDTO dto);

	
}
