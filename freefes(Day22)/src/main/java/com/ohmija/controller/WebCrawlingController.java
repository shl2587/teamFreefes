package com.ohmija.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.service.WebCrawlingService;

@Controller
@RequestMapping("/")
public class WebCrawlingController {

	@Autowired WebCrawlingService web_crawlingService;
	
	@GetMapping("/total_search/{total_search}")
	public ModelAndView web_crawling(@RequestParam String total_search) {
		ModelAndView mav = new ModelAndView();
		
		String start_url = "http://localhost:8080/freefes";
		List<String> url_list = new ArrayList<>();
		url_list.add(start_url);
		try {
			Document document = Jsoup.connect(start_url).get();
			
			Elements links = document.select("a[href]");
			for (Element link : links) {
				String next_url = link.absUrl("href");
				url_list.add(next_url);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
        
		Map<String, Object> map = web_crawlingService.crawling_total_search(url_list, total_search);
		
		return mav;
	}
}
