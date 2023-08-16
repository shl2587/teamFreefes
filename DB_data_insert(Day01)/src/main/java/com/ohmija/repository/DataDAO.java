package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.DataDTO;

@Repository
public interface DataDAO {

	void saveData(DataDTO dto);

	int insert(DataDTO dto);

}
