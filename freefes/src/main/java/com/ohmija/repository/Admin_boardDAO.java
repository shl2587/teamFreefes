package com.ohmija.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;


@Repository
public interface Admin_boardDAO {

	Admin_boardDTO selectOne(int idx);

	int admin_write(Admin_boardDTO dto);

	int modify(QnADTO dto);

	int modify(Admin_boardDTO dto);

	MemberDTO findMemberByNickname(String nickname);

	void banMember(int idx, LocalDate banUntil);

	List<MemberDTO> getBannedMembers();

	List<BoardDTO> confirm_selectAll(Festival_board_pagingDTO fes_paging_dto);

	List<Admin_boardDTO> notice_selectAll(HashMap<String, Integer> params);

	List<Admin_boardDTO> management_selectAll(HashMap<String, Integer> params);

	int select_total_page();

	BoardDTO confirm_selectOne(int idx);

	List<QnADTO> qna_list_selectAll(Festival_board_pagingDTO paging_dto);

	int approve(BoardDTO boardDTO);

	int delete(int idx);

	void deleteSchedule(LocalDateTime threeDays);


}
