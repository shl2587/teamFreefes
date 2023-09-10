package com.ohmija.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.Post_messageDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.repository.QnADAO;

@Service
@Transactional
public class QnAService {

	@Autowired
	private QnADAO dao;
	
	//1:1 문의 고객센터 관련
	public QnADTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(QnADTO dto) {
		return dao.write(dto);
	}

	public List<QnADTO> myList(int idx) {
		return dao.myList(idx);
	}

	public int answer(int idx, String answer) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("answer", answer);
		return dao.answer(map);
	}

	public int modify(QnADTO dto) {
		return dao.modify(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

}
