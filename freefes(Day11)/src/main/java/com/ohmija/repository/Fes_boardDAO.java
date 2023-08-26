package com.ohmija.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;

@Repository
public interface Fes_boardDAO {

	ArrayList<BoardDTO> select_coming();

	ArrayList<BoardDTO> select_top10();

	// 게시판 리스트
	int select_total_page();
	List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto);

	BoardDTO select_main_board(int idx);

	// 검색했을때 게시판 리스트
//	int select_search_total(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_All(Fes_searchDTO fes_search);
	
}
