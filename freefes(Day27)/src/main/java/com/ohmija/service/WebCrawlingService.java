package com.ohmija.service;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class WebCrawlingService {
	
	public Map<String, Object> crawling_total_search(List<String> url_list, String total_search) {
		Map<String, Object> map = new HashMap<>();
		
		try {
			for (String url : url_list) {
				Document document = Jsoup.connect(url).get();
				String html_information = document.html();
				map.put("html_information", html_information);
			}
			
		} catch (IOException e) {
			System.err.println("페이지 데이터 크롤링 오류 : " + e);
			e.printStackTrace();
		}
		
		return map;
	}
}
