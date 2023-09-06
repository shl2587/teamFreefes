package com.ohmija.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.service.Fes_boardService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	
	
	
	@Autowired Fes_boardService fes_boardService;
	@Autowired HttpSession session;
	
	// 동영 코드
	// 임시 저장 선택
	@GetMapping("/mainboardWrite/{member}")
	public ModelAndView select_temp_board(@PathVariable("member") int member) {
		ModelAndView mav = new ModelAndView("fes_board/mainboardWrite");
		// 임시저장글 목록 불러오기
		ArrayList<BoardDTO> list = fes_boardService.select_temp_board(member);
		mav.addObject("list", list);
		return mav;
	}
	
	// 게시글 작성
	@PostMapping("/mainboardWrite/{member}")
	public String mainWrite(BoardDTO dto) {
		int row = 0;
		row = fes_boardService.mainWrite(dto);
		if (row != 0) {
			System.out.println("게시글 추가 성공");
		}
		return "redirect:/";
	}
	
	// 승록
	@GetMapping("/fes_board_list")
	public ModelAndView main_board_list(@RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView();
		
		
		// 페이징 코드
		int board_page_count = fes_boardService.select_total_page();
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		
		// board에 저장된 모든 게시글을 불러오는 코드
		List<BoardDTO> fes_boardList = fes_boardService.fes_board_selectAll(fes_paging_dto);
		
		mav.addObject("fes_paging_dto", fes_paging_dto);
		mav.addObject("fes_boardList", fes_boardList);
		
		return mav;
	}
	
	@GetMapping("/mainboard/{idx}")
	public ModelAndView main_board(BoardDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/fes_board/mainboard");
		
		
		
		BoardDTO board_dto = fes_boardService.get_main_board(dto, session);
		int check_favorites = fes_boardService.check_favorites_board(dto, session);
		mav.addObject("board_dto", board_dto);
		mav.addObject("check_favorites", check_favorites);
		return mav;
	}
	
	
}
