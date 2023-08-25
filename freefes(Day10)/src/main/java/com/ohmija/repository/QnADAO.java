package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.QnADTO;

@Repository
public interface QnADAO {

	QnADTO selectOne(int idx);

	int write(QnADTO dto);

	QnADTO answer(int idx, String answer);

	List<QnADTO> selectAll();
	
}
