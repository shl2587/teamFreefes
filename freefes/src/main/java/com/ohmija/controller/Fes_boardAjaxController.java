package com.ohmija.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.service.Fes_boardService;

@RestController
@RequestMapping("/fes_board")
public class Fes_boardAjaxController {

	@Autowired Fes_boardService fes_boardService;
	
	// 동영
	// 임시 게시글 저장
	@PostMapping("/temp_board_save")
	public BoardDTO temp_board_save(@RequestBody BoardDTO dto) {
		BoardDTO boardDTO = fes_boardService.temp_board_save(dto);
		return boardDTO;
	}
	
	// 임시 게시글 불러오기
	@GetMapping("/load_temp_board/{idx}")
	public BoardDTO load_temp_board(@PathVariable int idx) {
		BoardDTO dto = fes_boardService.load_temp_board(idx);
		return dto;
	}
	
	// 임시 게시글 삭제
	@GetMapping("/temp_delete/{idx}")
	public int temp_delete(@PathVariable int idx) {
		int row = fes_boardService.temp_delete(idx);
		return row;
	}
	
	// 게시글 랭킹 불러오기
	@GetMapping("/top5_list/{rank}")
	public List<BoardDTO> get_ranking(@PathVariable String rank) {
		List<BoardDTO> top5_list = fes_boardService.select_top5(rank);
		
		return top5_list;
	}
	
	// 승록
	@Transactional
	@PostMapping("/{fes_page_href}")
	public ResponseEntity<Map<String, Object>> main_board_list(
										@PathVariable String fes_page_href,
										@RequestParam(value="request_page", defaultValue="1") int request_page,
										Fes_searchDTO fes_search,
										HttpSession search_session) {
		
		Map<String, Object> map = new HashMap<>();
		

		
		// 검색 코드
		int board_page_count = fes_boardService.select_search_total(fes_page_href, fes_search);
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		List<BoardDTO> fes_boardList = fes_boardService.fes_search_selectAll(fes_page_href, fes_search, fes_paging_dto);
		
		// 검색 결과가 있을 경우와 없을 경우 분리
		if (fes_boardList.size() > 0) {
			map.put("fes_boardList", fes_boardList);
			map.put("fes_paging_dto", fes_paging_dto);
			search_session.setAttribute("search_result", map);
		}
		if(fes_boardList.size() == 0) {
			map.put("fes_boardList", "검색된 축제가 없습니다.\n 다른 축제를 찾아 떠나요🎉🎉🎉");
			map.put("fes_paging_dto", null);
		}
		
		
		return ResponseEntity.ok(map);
	}
	
	
}
