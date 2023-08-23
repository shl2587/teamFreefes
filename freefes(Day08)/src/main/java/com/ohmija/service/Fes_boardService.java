package com.ohmija.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.repository.Fes_boardDAO;

@Service
public class Fes_boardService {

	@Autowired private Fes_boardDAO dao;
	private LocalDate now = LocalDate.now();
	
	public int mainWrite(BoardDTO dto) {
		int member = 1;
		dto.setMember(member);
		
		int row = 0;
		List<MultipartFile> list = dto.getFile_list();
		ArrayList<String> path = new ArrayList<>();
		
		String origin_path="";
		if (!list.contains("@")) {			
			for (MultipartFile f : list) {
				String origin_file_name = f.getOriginalFilename();
				path.add(origin_file_name);
				
				String f_name = origin_file_name.substring(0, origin_file_name.indexOf("."));
				String real_name = (f_name + ".");
				origin_path += real_name;
				dto.setFile_path(origin_path);
			}
		}
		else {
			dto.setFile_path(null);
		}
		
		row = dao.mainWrite(dto);
		return row;
	}
	
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

	// 전체 게시글을 불러오는 코드
	public List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto) {
		return dao.fes_board_selectAll(fes_paging_dto);
	}
	
	// 전체 게시글 수를 불러오는 코드
	public int select_total_page() {
		return dao.select_total_page();
	}

//	public List<Festival_board_pagingDTO> fes_board_page_number(int request_page,
//													int board_page_number) {
//		
//		Festival_board_pagingDTO fes_board_page = new Festival_board_pagingDTO(request_page, board_page_number);
//		return dao.fes_board_page_number();
//	}

	
}
