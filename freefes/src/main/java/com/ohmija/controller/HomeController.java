package com.ohmija.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.service.Admin_boardService;
import com.ohmija.service.Fes_boardService;

@Controller
public class HomeController {
	
	@Autowired private Fes_boardService fes_boardService;
	@Autowired private Admin_boardService admin_boardService;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		ArrayList<BoardDTO> comming_list = fes_boardService.select_coming();
		mav.addObject("comming_list", comming_list);
		
		// 공지사항 5개
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO();
		fes_paging_dto.setTotal_count(5);
		fes_paging_dto.setRequest_page(1);
		List<Admin_boardDTO> notice_list = admin_boardService.adminboard_selectAll(fes_paging_dto);
		mav.addObject("notice_list", notice_list);
		
		return mav;
	}
	
	
	
}
