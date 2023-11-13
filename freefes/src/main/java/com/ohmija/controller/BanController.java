package com.ohmija.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BanController {

	@GetMapping("/ban_page")
	public void banPage() {}
	
}
