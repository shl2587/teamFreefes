package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.ReplyDTO;
import com.ohmija.repository.ReplyDAO;

@Service
public class ReplyService {
	
	@Autowired private ReplyDAO dao;

	public List<ReplyDTO> selectfav(int idx) {
		return dao.selectfav(idx);
	}

	public int reply_write(ReplyDTO dto) {
		return dao.reply_write(dto);
	}
	
	public List<ReplyDTO> selectOnBoard(int board) {
		return dao.selectOnBoard(board);
	}

	public ReplyDTO selectMyReply(ReplyDTO replyDTO) {
		return dao.selectMyReply(replyDTO);
	}

	public int reply_delete(int idx) {
		return dao.reply_delete(idx);
	}

	public int selectByIdx(int idx) {
		return dao.selectByIdx(idx);
	}

	@Transactional
	public float get_gradeAVG(int boardIdx) {
		return dao.get_gradeAVG(boardIdx);
	}

}
