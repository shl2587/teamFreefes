package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.DataDTO;

@Repository
public interface DataDAO {


	int insert(DataDTO dto);

}
