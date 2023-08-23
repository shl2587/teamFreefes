package com.ohmija.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;

@Repository
public interface Fes_boardDAO {

	int mainWrite(BoardDTO dto);

	ArrayList<BoardDTO> select_coming();

	ArrayList<BoardDTO> select_top10();

	List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto);

//	List<Festival_board_pagingDTO> fes_board_page_number();

	int select_total_page();
	
	
}
