package com.ohmija.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;

@Repository
public interface Fes_boardDAO {

	// 동영
	ArrayList<BoardDTO> select_coming();

	ArrayList<BoardDTO> select_top5(String rank);

	// 임시 게시판 및 게시글 작성
	int temp_board_save(BoardDTO dto);

	ArrayList<BoardDTO> select_temp_board(int member);

	BoardDTO load_temp_board(int idx);

	int temp_delete(int idx);
	
	int mainWrite(BoardDTO dto);
	
	BoardDTO load_after_save(BoardDTO dto);
	
	void grade_update(BoardDTO boardDTO);

	// 게시글 수정 신청
	int mainModify(BoardDTO dto);
	
	
	
	
	
	// 승록
	// 게시판 리스트
	int select_total_page();
	List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto);

	
	// 선택한 게시판 불러오기
	int update_board_count(BoardDTO dto);
	BoardDTO select_main_board(BoardDTO dto);

	
	// 검색했을때 게시판 리스트
	// 제목, 내용 제외 검색
	int select_search_total(Fes_searchDTO fes_search);
	int count_search_proceeding(Fes_searchDTO fes_search);
	int count_search_finish(Fes_searchDTO fes_search);
	int count_search_scheduled(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_All(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_proceeding(Fes_searchDTO fes_search_dto);
	List<BoardDTO> select_search_finish(Fes_searchDTO fes_search_dto);
	List<BoardDTO> select_search_scheduled(Fes_searchDTO fes_search_dto);


	// 제목, 내용 검색 했을 때 총 게시글 수
	int search_complex_total(Fes_searchDTO fes_search);
	int search_complex_proceeding(Fes_searchDTO fes_search);
	int search_complex_finish(Fes_searchDTO fes_search);
	int search_complex_scheduled(Fes_searchDTO fes_search);
	List<BoardDTO> select_search_complex(Fes_searchDTO fes_search);
	List<BoardDTO> select_complex_proceeding(Fes_searchDTO fes_search_dto);
	List<BoardDTO> select_complex_finish(Fes_searchDTO fes_search_dto);
	List<BoardDTO> select_complex_scheduled(Fes_searchDTO fes_search_dto);

	
	// 진행중, 종료, 예정된 축제 확인
	int select_count_proceeding();
	List<BoardDTO> select_fes_proceeding(Festival_board_pagingDTO fes_paging_dto);
	
	int select_count_finish();
	List<BoardDTO> select_fes_finish(Festival_board_pagingDTO fes_paging_dto);
	
	int select_count_scheduled();
	List<BoardDTO> select_fes_scheduled(Festival_board_pagingDTO fes_paging_dto);
	
	int select_total_favorites(BoardDTO board_dto);
	int update_total_favorites(BoardDTO board_dto);


	
	
	
	
	
	
	
	
	// 계립
	int select_my_board_list(int idx);

	List<BoardDTO> my_board_selectAll(Festival_board_pagingDTO fes_paging_dto);

	





	
}
