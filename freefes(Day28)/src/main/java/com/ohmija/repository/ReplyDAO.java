package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.ReplyDTO;

@Repository
public interface ReplyDAO {

	List<ReplyDTO> selectfav(int idx);

	int reply_write(ReplyDTO dto);

	List<ReplyDTO> selectOnBoard(int board);

	ReplyDTO selectMyReply(ReplyDTO replyDTO);

	int reply_delete(int idx);

	int selectByIdx(int idx);

	float get_gradeAVG(int boardIdx);

}
