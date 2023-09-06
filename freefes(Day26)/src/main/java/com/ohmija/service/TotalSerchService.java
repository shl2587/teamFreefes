package com.ohmija.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.repository.Admin_boardDAO;
import com.ohmija.repository.Fes_boardDAO;
import com.ohmija.repository.MypageDAO;
import com.ohmija.repository.QnADAO;

@Service
public class TotalSerchService {
	
	@Autowired Admin_boardDAO admin_boardDao;
	@Autowired Fes_boardDAO fes_boardDao;
	@Autowired MypageDAO mypageDao;
	@Autowired QnADAO qnaDao;
	

	public Map<String, Object> get_total_search(String total_search) {
		Map<String,Object> map = new HashMap<>();
		
		// 축제게시판 검색
		Fes_searchDTO fes_search = new Fes_searchDTO();
		fes_search.setFes_keyword(total_search);
		List<BoardDTO> total_search_fes_list = null;
		total_search_fes_list = fes_boardDao.select_search_All(fes_search);
		map.put("select_search_All", total_search_fes_list);
		if (total_search_fes_list == null) {
			total_search_fes_list = (fes_boardDao.select_search_complex(fes_search));
			map.put("select_search_complex", total_search_fes_list);
		}
		
		
		return map;
	}

}
