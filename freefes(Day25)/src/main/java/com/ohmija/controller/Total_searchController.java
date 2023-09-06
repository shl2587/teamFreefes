package com.ohmija.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.service.TotalSerchService;

@Controller
public class Total_searchController {

	@Autowired private TotalSerchService total_search_service;
	
	@GetMapping("/total_search/${total_search}")
	public ModelAndView total_search(@PathVariable("total_search") String total_search) {
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> total_search_result = total_search_service.get_total_search(total_search);
		mav.addObject("total_search_result", total_search_result);

		return mav;
	}
}
