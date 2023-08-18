package com.ohmija.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.service.DataService;

@Controller
public class DataController {

	@Autowired private DataService dataService;
	
	@PostMapping("/saveFestivals")
	@ResponseBody
	public String saveData(@RequestBody List<Map<String, Object>> list) {
		ModelAndView mav = new ModelAndView("/home");
		int row = dataService.insert(list);
		mav.addObject("list", list);
		return "Data saved successfully";
	}
}
