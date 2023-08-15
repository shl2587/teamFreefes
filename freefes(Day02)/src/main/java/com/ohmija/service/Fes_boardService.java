package com.ohmija.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.BoardDTO;
import com.ohmija.repository.Fes_boardDAO;

@Service
public class Fes_boardService {

	@Autowired private Fes_boardDAO dao;
	
	public int mainWrite(BoardDTO dto) {
		int row = 0;
		int member = 1;
		dto.setMember(member);
		row = dao.mainWrite(dto);
		return row;
	}

	
	
}
