package com.ohmija.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@Controller
public class HomeController {
	
	@Autowired private Fes_boardService fes_boardService;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		ArrayList<BoardDTO> comming_list = fes_boardService.select_coming();
		mav.addObject("comming_list", comming_list);
		ArrayList<BoardDTO> top10_list = fes_boardService.select_top10();
		mav.addObject("top10_list", top10_list);
		return mav;
	}
}
