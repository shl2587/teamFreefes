package com.ohmija.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;


@Repository
public interface Admin_boardDAO {
	

	List<Admin_boardDTO> selectAll();

	Admin_boardDTO selectOne(int idx);

	int admin_write(Admin_boardDTO dto);

	int modify(QnADTO dto);

	int modify(Admin_boardDTO dto);

	MemberDTO findMemberByNickname(String nickname);

	void banMember(int idx, LocalDate banUntil);

	List<MemberDTO> getBannedMembers();

	List<BoardDTO> confirm_selectAll();


}
