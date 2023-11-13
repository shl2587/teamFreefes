package com.ohmija.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.FavoritesDTO;
import com.ohmija.model.Favorites_pagingDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.repository.FavoritesDAO;
import com.ohmija.repository.Fes_boardDAO;

@Service
public class Fes_boardService {

	@Autowired private Fes_boardDAO fes_boardDao;
	@Autowired private FavoritesDAO favoritesDao;
//	@Autowired private FesboardComponent fes_board_component;
	
	private LocalDate now = LocalDate.now();
	
	// 동영 코드
		// 다가오는 축제
		public ArrayList<BoardDTO> select_coming() {
			ArrayList<BoardDTO> list = fes_boardDao.select_coming();
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

		// 상위 5개
		public ArrayList<BoardDTO> select_top5(String rank) {
			return fes_boardDao.select_top5(rank);
		}
		
		public int mainWrite(BoardDTO dto) {
			
			
			int row = 0;
			List<MultipartFile> list = dto.getFile_list();
			String origin_path = "C:\\freefes_img\\" + dto.getTitle();		// 사진 저장 경로 (게시판 
			String file_path = "";
			int fileIdx = 0;
			
			for (MultipartFile f : list) {
				if(f.isEmpty()) {
					dto.setFile_path(null);
					break;
				}
				fileIdx++;
				String ext = f.getContentType().substring(f.getContentType().indexOf("/") + 1);		// 확장자
				
				File dest = new File(origin_path, fileIdx + "." + ext);
				file_path += fileIdx + "&";
				try {
					if(dest.exists() == false) {
						dest.mkdirs();
					}
					f.transferTo(dest);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			String posterExt = dto.getPoster().getContentType().substring(dto.getPoster().getContentType().indexOf("/") + 1);	// 포스터 확장자
			File destination = new File(origin_path, "poster." + posterExt);
			file_path += "poster." + posterExt;
			
			try {
				if(destination.exists() == false) {
					destination.mkdirs();
				}
				dto.getPoster().transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			dto.setFile_path(file_path);
			
			row = fes_boardDao.mainWrite(dto);
			return row;
		}

		public void grade_update(int boardIdx, float gradeAVG) {
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setIdx(boardIdx);
			boardDTO.setGrade(gradeAVG);
			fes_boardDao.grade_update(boardDTO);
		}
		
		public BoardDTO select_main_board(BoardDTO dto) {
			return fes_boardDao.select_main_board(dto);
		}

		
		public int mainModify(BoardDTO dto) {
			return fes_boardDao.mainModify(dto);
		}
		
		/* 임시 게시판 코드 */
		// 임시게시글 목록 불러오는 코드
		public ArrayList<BoardDTO> select_temp_board(int member) {
			return fes_boardDao.select_temp_board(member);
		}

		// 새로운 임시저장글을 저장하는 코드
		public BoardDTO temp_board_save(BoardDTO dto) {
			int row = fes_boardDao.temp_board_save(dto);
			return fes_boardDao.load_after_save(dto);
		}


		public BoardDTO load_temp_board(int idx) {
			return fes_boardDao.load_temp_board(idx);
		}

		public int temp_delete(int idx) {
			return fes_boardDao.temp_delete(idx);
		}
		
	
	
	
	// 승록
	// 전체 게시글 수를 불러오는 메서드
	public int select_total_page() {
		return fes_boardDao.select_total_page();
	}
	
	// 전체 게시글을 불러오는 메서드
	public List<BoardDTO> fes_board_selectAll(Festival_board_pagingDTO fes_paging_dto) {
		return fes_boardDao.fes_board_selectAll(fes_paging_dto);
	}
	

	// 해당 게시글을 불러오는 메서드
	@Transactional
	public BoardDTO get_main_board(BoardDTO board_dto) {
		int total_favorites = fes_boardDao.select_total_favorites(board_dto);
		board_dto.setFavorites(total_favorites);
		int row = fes_boardDao.update_total_favorites(board_dto);
		return fes_boardDao.select_main_board(board_dto);
	}

	public int update_board_count(BoardDTO board_dto) {
		return fes_boardDao.update_board_count(board_dto);
	}
	
	 // 검색된 게시글의 수를 불러오는 메서드
	public int select_search_total(String fes_page_href, Fes_searchDTO fes_search) {
		if ("complex".equals(fes_search.getSearch_method())) {
			if ("fes_board_list".equals(fes_page_href)) {
				return fes_boardDao.search_complex_total(fes_search);
			}
			else if ("fes_board_proceeding".equals(fes_page_href)) {
				return fes_boardDao.search_complex_proceeding(fes_search);
			}
			else if ("fes_board_finish".equals(fes_page_href)) {
				return fes_boardDao.search_complex_finish(fes_search);
			}
			else if ("fes_board_scheduled".equals(fes_page_href)) {
				return fes_boardDao.search_complex_scheduled(fes_search);
			}
		}
		else {
			if ("fes_board_list".equals(fes_page_href)) {
				return fes_boardDao.select_search_total(fes_search);
			}
			else if ("fes_board_proceeding".equals(fes_page_href)) {
				return fes_boardDao.count_search_proceeding(fes_search);
			}
			else if ("fes_board_finish".equals(fes_page_href)) {
				return fes_boardDao.count_search_finish(fes_search);
			}
			else if ("fes_board_scheduled".equals(fes_page_href)) {
				return fes_boardDao.count_search_scheduled(fes_search);
			}
		}
		return 0;
	}

	public List<BoardDTO> fes_search_selectAll
		(String fes_page_href, 
		 Fes_searchDTO fes_search,
		 Festival_board_pagingDTO fes_paging_dto) {
		
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
		
		if ("complex".equals(fes_search.getSearch_method())) {
			if ("fes_board_list".equals(fes_page_href)) {
				return fes_boardDao.select_search_complex(fes_search_dto);
			}
			else if ("fes_board_proceeding".equals(fes_page_href)) {
				return fes_boardDao.select_complex_proceeding(fes_search_dto);
			}
			else if ("fes_board_finish".equals(fes_page_href)) {
				return fes_boardDao.select_complex_finish(fes_search_dto);
			}
			else if ("fes_board_scheduled".equals(fes_page_href)) {
				return fes_boardDao.select_complex_scheduled(fes_search_dto);
			}
		}
		else {
			if ("fes_board_list".equals(fes_page_href)) {
				return fes_boardDao.select_search_All(fes_search_dto);
			}
			else if ("fes_board_proceeding".equals(fes_page_href)) {
				return fes_boardDao.select_search_proceeding(fes_search_dto);
			}
			else if ("fes_board_finish".equals(fes_page_href)) {
				return fes_boardDao.select_search_finish(fes_search_dto);
			}
			else if ("fes_board_scheduled".equals(fes_page_href)) {
				return fes_boardDao.select_search_scheduled(fes_search_dto);
			}
		}
		return null;
	}

	public int check_favorites_board(BoardDTO board_dto, HttpSession session) {
		FavoritesDTO favorites_dto = new FavoritesDTO();
		if(session.getAttribute("login") != null) {
			MemberDTO member_dto = (MemberDTO) session.getAttribute("login");
			favorites_dto.setMember(member_dto.getIdx());
			favorites_dto.setBoard(board_dto.getIdx());
			return favoritesDao.check_favorites_board(favorites_dto);			
		}
		else {
			return 0;
		}
	}

	// 진행중, 종료, 예정 페이징 및 불러오기
	public int select_total_sub_page(String page_href) {
		int count = 0;
		
		if ("fes_board_proceeding".equals(page_href)) {
			count = fes_boardDao.select_count_proceeding();
		}
		else if ("fes_board_finish".equals(page_href)) {
			count = fes_boardDao.select_count_finish();
		}
		else if ("fes_board_scheduled".equals(page_href)) {
			count = fes_boardDao.select_count_scheduled();
		}
		
		return count;
	}
	
	public List<BoardDTO> get_schedule_list(String fes_page_href, Festival_board_pagingDTO fes_paging_dto) {
		List<BoardDTO> board_list = null;
		
		if ("fes_board_proceeding".equals(fes_page_href)) {
			board_list = fes_boardDao.select_fes_proceeding(fes_paging_dto);
		}
		else if ("fes_board_finish".equals(fes_page_href)) {
			board_list = fes_boardDao.select_fes_finish(fes_paging_dto);
		}
		else if ("fes_board_scheduled".equals(fes_page_href)) {
			board_list = fes_boardDao.select_fes_scheduled(fes_paging_dto);
		}
		return board_list;
	}



	public int select_my_board_list(int idx) {
		return fes_boardDao.select_my_board_list(idx);
	}

	public List<BoardDTO> my_board_selectAll(Festival_board_pagingDTO fes_paging_dto) {
		return fes_boardDao.my_board_selectAll(fes_paging_dto);
	}



	
}
