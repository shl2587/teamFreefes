package com.ohmija.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.DataDTO;
import com.ohmija.model.Festival_statusDTO;
import com.ohmija.repository.DataDAO;

@Service
public class DataService {

	@Autowired private DataDAO dao;


	public int insert(DataDTO dto) {
		return dao.insert(dto);
	}


	public List<Festival_statusDTO> getData() {
		return dao.selectAll();
	}


	public int data_move(List<Festival_statusDTO> list) throws ParseException {
		int row = 0;
		for (Festival_statusDTO status : list) {
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setTitle(status.getTitle());
			boardDTO.setRegion(status.getRegion());
			boardDTO.setAge_limit(status.getAge_limit());
			boardDTO.setFee(status.getFee());
			boardDTO.setHost_org(status.getHost_org());
			boardDTO.setInquire(status.getInquire());
			boardDTO.setTime(status.getTime());
			boardDTO.setUrl(status.getUrl());
			boardDTO.setPlace(status.getPlace());
			boardDTO.setWay_to_come(status.getWay_to_come());
			boardDTO.setMember(1);
			
			// 시작날짜와 종료 날짜 추출과정
			String period = status.getPeriod();
	
			// 기간의 period를 yyyy-MM-dd형태로 변환 
			if(period != null) {
				period = period.replace(".", "-");
				period = period.replaceAll(" ", "");
			}
			
			int start_idx = 0;
			int end_idx = period.indexOf("-/");
			period = period.substring(0, end_idx);
			
			String start = period;
			String end = "";
			System.out.println(start);
			
			if(period.contains("-~")) {
				start_idx = period.indexOf("-~");	
				start = period.substring(0, start_idx);
				end = period.substring(start_idx + 2, end_idx);
			}
			
			
			// string 날짜로 변경해주는 과정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date st_date = sdf.parse(start);
			boardDTO.setStart_date(st_date);
			
			// 당일 축제일 경우 end에 값이 없으므로 해당 조건문 실행
			if (!end.contentEquals("")) {
				Date e_date = sdf.parse(end);
				boardDTO.setEnd_date(e_date);				
			}
			else {
				boardDTO.setEnd_date(st_date);
			}
			
			String content = "축제 설명";
			boardDTO.setContent(content);
			
			row += dao.board_insert(boardDTO);
		}
		return row;
	}

	
}
