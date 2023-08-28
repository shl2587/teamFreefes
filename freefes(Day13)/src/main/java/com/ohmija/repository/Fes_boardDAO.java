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
	// 내용 제외 검색
	int select_search_total(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_All(Fes_searchDTO fes_search);
	// 내용 검색 했을 때 총 게시글 수
	int search_complex_total(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_complex(Fes_searchDTO fes_search);


	
}
