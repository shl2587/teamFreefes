package com.ohmija.controller;


import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	@Autowired Fes_boardService fes_boardService;
	
	@GetMapping("/mainboard")
	public ModelAndView mainBoard() throws ParseException {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> fes_boardList = fes_boardService.selectAll();
		
		return mav;
	};
	
	
	@GetMapping("/mainboardWrite")
	public void mainWrite() {};
	
	@PostMapping("/mainboardWrite")
	public String mainWrite(BoardDTO dto) {
		int row = 0;
		System.out.println(dto.getFile_list());
		row = fes_boardService.mainWrite(dto);
		if (row != 0) {
			System.out.println("게시글 추가 성공");
		}
		return "redirect:/";
	};
	
}
