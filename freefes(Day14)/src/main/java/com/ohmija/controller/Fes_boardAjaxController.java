package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.service.Fes_boardService;

@RestController
@RequestMapping("/fes_board")
public class Fes_boardAjaxController {

	@Autowired Fes_boardService fes_boardService;
	
	@Transactional
	@GetMapping("/fes_board_list")
	public ModelAndView main_board_list(@RequestParam(value="request_page", defaultValue="1") int request_page,
										Fes_searchDTO fes_search,
										BindingResult binding_result) {
		ModelAndView mav = new ModelAndView();
		
		// 검색 시 날짜 없을때 처리
        if (fes_search.getStart_date() == null) {
            binding_result.rejectValue("start_date", "field.empty", "Start date must not be empty");
        }
        if (fes_search.getEnd_date() == null) {
            binding_result.rejectValue("end_date", "field.empty", "End date must not be empty");
        }

		
		// 페이징 코드
		int board_page_count = fes_boardService.select_total_page();
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
	
		// board에 저장된 모든 게시글을 불러오는 코드
		List<BoardDTO> fes_boardList = fes_boardService.fes_board_selectAll(fes_paging_dto);
		
		// 검색 코드
		if (fes_search.getFes_keyword() != null) {
			board_page_count = fes_boardService.select_search_total(fes_search);
			fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
			fes_boardList = fes_boardService.fes_board_selectAll(fes_search, fes_paging_dto);
		}
		mav.addObject("fes_paging_dto", fes_paging_dto);
		mav.addObject("fes_boardList", fes_boardList);
		
		return mav;
	}
	
}
