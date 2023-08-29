package com.ohmija.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	@Autowired Fes_boardService fes_boardService;
	
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
	@PostMapping("/mainboardWrite")
	public String mainWrite(BoardDTO dto) {
		int row = 0;
		row = fes_boardService.mainWrite(dto);
		if (row != 0) {
			System.out.println("게시글 추가 성공");
		}
		return "redirect:/";
	}
	
	// 승록
	@GetMapping("/mainboard/{idx}")
	public ModelAndView main_board(@PathVariable("idx") int idx,
									BoardDTO dto) {
		ModelAndView mav = new ModelAndView("/fes_board/mainboard");
		BoardDTO board_dto = fes_boardService.get_main_board(idx, dto);
		mav.addObject("board_dto", board_dto);
		return mav;
	}

	

	
	
}
