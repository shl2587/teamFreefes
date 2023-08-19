package com.ohmija.service;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.bouncycastle.crypto.params.Argon2Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_statusDTO;
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
			SimpleDateFormat sdf = new SimpleDateFormat();
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
			SimpleDateFormat sdf = new SimpleDateFormat();
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

	// 기존의 목록에서 필요한 데이터만 추출하는 과정
	@Transactional
	public List<BoardDTO> selectAll() throws ParseException {
		List<Festival_statusDTO> fes_list = dao.festival_List();
		for (Festival_statusDTO status : fes_list) {
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setTitle(status.getTitle());
			boardDTO.setRegion(status.getRegion());
			boardDTO.setFestival_category(status.getCategory());
			
			// 시작날짜와 종료 날짜 추출과정
			String period = status.getPeriod();
			period = period.replace(".", "-");
			int start_idx = period.indexOf(" ~");
			int end_idx = period.indexOf(" /");
			String start = period.substring(start_idx);
			String end = period.substring(period.indexOf(start_idx, end_idx));
			
			// string 날짜로 변경해주는 과정
			SimpleDateFormat sdf = new SimpleDateFormat();
			Date st_date = sdf.parse(start);
			Date e_date = sdf.parse(end);
			boardDTO.setStart_date(st_date);
			boardDTO.setEnd_date(e_date);
			
			String content = "";
			content += status.getUrl() + "\n";
			content += status.getPlace() + "\n";
			content += status.getWay_to_come() + "\n";
			content += status.getFee() + "\n";
			content += status.getAge_limit() + "\n";
			content += status.getTime() + "\n";
			content += status.getHost_org() + "\n";
			content += status.getInquire() + "\n";
			boardDTO.setContent(content);
			
			int row = dao.board_insert(boardDTO);
		}
		return dao.selectAll();
	}

	
	
}
