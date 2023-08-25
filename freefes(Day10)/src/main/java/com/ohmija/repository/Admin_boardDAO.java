package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.Admin_boardDTO;

@Repository
public interface Admin_boardDAO {

	List<Admin_boardDTO> selectAll();

	Admin_boardDTO selectOne(int idx);

	int admin_write(Admin_boardDTO dto);

}
