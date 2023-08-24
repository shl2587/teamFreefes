package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.DataDTO;
import com.ohmija.model.Festival_statusDTO;

@Repository
public interface DataDAO {


	int insert(DataDTO dto);

	List<Festival_statusDTO> selectAll();

	int board_insert(BoardDTO boardDTO);

}
