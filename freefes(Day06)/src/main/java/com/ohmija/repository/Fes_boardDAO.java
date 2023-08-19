package com.ohmija.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_statusDTO;

@Repository
public interface Fes_boardDAO {

	int mainWrite(BoardDTO dto);

	ArrayList<BoardDTO> select_coming();

	ArrayList<BoardDTO> select_top10();

	List<BoardDTO> selectAll();
	
	List<Festival_statusDTO> festival_List();

	int board_insert(BoardDTO boardDTO);
	
	
	
}
