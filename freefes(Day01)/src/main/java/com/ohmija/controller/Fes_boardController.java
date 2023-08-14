package com.ohmija.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	@Autowired Fes_boardService fes_boardService;
	
	@GetMapping("/mainboard")
	public void mainBoard() {};
	
	@GetMapping("/mainboardWrite")
	public void mainWrite() {};
	
	@PostMapping("/mainboardWrite")
	public String mainWrite(BoardDTO dto) {
		int row = 0;
		int member = 1;
		dto.setMember(member);
		row = fes_boardService.mainWrite(dto);
		return "redirect://";
	};
	
}
