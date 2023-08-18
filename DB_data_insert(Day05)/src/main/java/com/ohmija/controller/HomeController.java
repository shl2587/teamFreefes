package com.ohmija.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.DataDTO;
import com.ohmija.service.DataService;

@Controller
public class HomeController {
	
	@Autowired private DataService dataService;
	
	@RequestMapping("/")
	public String home() {
		StringBuffer result = new StringBuffer();
		File festival = new File("E:/취업지원반/팀 프로젝트/개발자료/crawling/festival.json");
		int row = 0;
		try {
			BufferedReader br = new BufferedReader(new FileReader(festival));
			for (int i = 0; i < 5766; i++) {
				result.append(br.readLine()+"\n");
			}
			System.out.println(result);
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject)parser.parse(result.toString());
			JSONArray jsonArray = (JSONArray)jsonObject.get("data");
			
			for(int i = 0; i < jsonArray.size(); i++) {
				JSONObject object = (JSONObject) jsonArray.get(i);
				String title = (String) object.get("title");
				String region = (String) object.get("region");
				String period = (String) object.get("period");
				String category = (String) object.get("category");
				String url = (String) object.get("url");
				String place = (String) object.get("place");
				String way_to_come = (String) object.get("way_to_come");
				String fee = (String) object.get("fee");
				String age_limit = (String) object.get("age_limit");
				String time = (String) object.get("time");
				String host_org = (String) object.get("host_org");
				String inquire = (String) object.get("inquire");
				System.out.println(way_to_come);
				DataDTO dto = new DataDTO();
				dto.setTitle(title);
				dto.setAge_limit(age_limit);
				dto.setCategory(category);
				dto.setFee(fee);
				dto.setHost_org(host_org);
				dto.setInquire(inquire);
				dto.setPeriod(period);
				dto.setPlace(place);
				dto.setRegion(region);
				dto.setTime(time);
				dto.setUrl(url);
				dto.setWay_to_come(way_to_come);
				System.out.println(dto.getInquire());
				row += dataService.insert(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.printf("%d행 성공!!!!", row);
		return "home";
	}
	
	
	
}
