package com.ohmija.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohmija.model.DataDTO;
import com.ohmija.service.DataService;

@Controller
@RequestMapping("/")
public class DataController {

	@Autowired private DataService dataService;
	
	@PostMapping("/saveFestivals")
	public void insert() {
		// String은 고정값에 가깝기 때문에 StringBuffer를 사용
		StringBuffer result = new StringBuffer();
		File festival = new File("E:/취업지원반/팀 프로젝트/개발자료/crawling/festival.json");
		int row = 0;
		
			try {
				BufferedReader br = new BufferedReader(new FileReader(festival));
				
				for (int i = 0; i < 5766; i++) {
					result.append(br.readLine()+"\n");
				}
				System.out.println(result);
				
				// JSON simple이라는 라이브러리를 추가하여 해당 코드 작성
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject)parser.parse(result.toString());
				JSONArray jsonArray = (JSONArray)jsonObject.get("data");
				
				// 만들어둔 dto에 전부 삽입
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
					
					row += dataService.insert(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		System.out.printf("%d행 성공!!!!", row);
	}
	
	
	
	
}
