package com.ohmija.service;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.repository.Fes_boardDAO;

@Service
public class Fes_boardService {

	@Autowired private Fes_boardDAO dao;
	private LocalDate now = LocalDate.now();
	
	// 동영 코드
	public ArrayList<BoardDTO> select_coming() {
		ArrayList<BoardDTO> list = dao.select_coming();
		for(BoardDTO dto:list) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String start = sdf.format(dto.getStart_date());
			String end = sdf.format(dto.getEnd_date());
			LocalDate local_start_date = LocalDate.parse(start);
			LocalDate local_end_date = LocalDate.parse(end);
			boolean is_hold = false;
			int remain = 0;
			
			// 개최 중 여부
			if(local_start_date.compareTo(now) <= 0 && local_end_date.compareTo(now) >= 0) {
				is_hold = true;
			}
			
			// D-DAY 계산
			remain = (int)ChronoUnit.DAYS.between(now, local_start_date);
			
			
			// dto에 저장
			dto.setIs_hold(is_hold);
			dto.setRemain("D-" + Integer.toString(remain));				

		}
		return list;
	}

	public ArrayList<BoardDTO> select_top10() {
		ArrayList<BoardDTO> list = dao.select_top10();
		for(BoardDTO dto:list) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String start = sdf.format(dto.getStart_date());
			String end = sdf.format(dto.getEnd_date());
			LocalDate local_start_date = LocalDate.parse(start);
			LocalDate local_end_date = LocalDate.parse(end);
			boolean is_hold = false;
			int remain = 0;
			
			// 개최 중 여부
			if(local_start_date.compareTo(now) <= 0 && local_end_date.compareTo(now) >= 0) {
				is_hold = true;
			}
			
			// D-DAY 계산
			remain = (int)ChronoUnit.DAYS.between(now, local_start_date);
			
			// dto에 저장
			dto.setIs_hold(is_hold);
			dto.setRemain("D-" + Integer.toString(remain));
		}
		return list;
	}

	// 전체 게시글 수를 불러오는 메서드
	public int select_total_page() {
		return dao.select_total_page();
	}
	
	// 전체 게시글을 불러오는 메서드
	public List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto) {
		return dao.fes_board_selectAll(fes_paging_dto);
	}
	

	// 해당 게시글을 불러오는 메서드
	public BoardDTO get_main_board(int idx, BoardDTO dto) {
		dto.setIdx(idx);
		int count = 0;
		dto.setCount(count++);
		return dao.select_main_board(dto);
	}

	
	 // 검색된 게시글의 수를 불러오는 메서드
	public int select_search_total(Fes_searchDTO fes_search) {
		if (fes_search.getSearch_method().equals("complex")) {
			return dao.search_complex_total(fes_search);
		}
		else {
			return dao.select_search_total(fes_search);
		}
	}

	public List<BoardDTO> fes_board_selectAll
		(Fes_searchDTO fes_search, Festival_board_pagingDTO fes_paging_dto) {
		Fes_searchDTO fes_search_dto = new Fes_searchDTO();
		
		Field[] fields = Fes_searchDTO.class.getDeclaredFields();
		for(Field field : fields) {
			field.setAccessible(true);
			
			try {
				Object value = field.get(fes_search);
				if(value != null && !value.toString().isEmpty()) {
					field.set(fes_search_dto, value);
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		fes_search_dto.setOffset(fes_paging_dto.getOffset());
		fes_search_dto.setPer_page(fes_paging_dto.getPer_page());
		
		if (fes_search.getSearch_method().equals("complex")) {
			return dao.select_search_complex(fes_search_dto);
			
		}
		else {
			return dao.select_search_All(fes_search_dto);
		}
	}



	
}
