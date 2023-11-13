package com.ohmija.controller;


import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.Festival_statusDTO;
import com.ohmija.service.DataService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired private DataService dataService;

	@GetMapping()
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		List<Festival_statusDTO> list = dataService.getData();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/dataList")
	public ModelAndView getDataList() throws ParseException {
		ModelAndView mav = new ModelAndView("home");
		List<Festival_statusDTO> list = dataService.getData();
		int row = dataService.data_move(list);
		mav.addObject("row", row);
		return mav;
	}
	
	
	
}
