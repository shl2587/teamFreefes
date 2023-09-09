package com.ohmija.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.repository.Admin_boardDAO;

@Service
public class Admin_boardService {
	
	@Autowired
	private SqlSession session;

	@Autowired
	private Admin_boardDAO dao;
	

	// 목록에 페이지 추가
	public List<Admin_boardDTO> adminboard_selectAll(Festival_board_pagingDTO fes_paging_dto) {
	    HashMap<String, Integer> params = new HashMap<>();
	    params.put("offset", fes_paging_dto.getOffset());
	    params.put("per_page", fes_paging_dto.getPer_page());
	    return dao.notice_selectAll(params);
	}
	
	public List<Admin_boardDTO> management_selectAll(Festival_board_pagingDTO fes_paging_dto) {
	    HashMap<String, Integer> params = new HashMap<>();
	    params.put("offset", fes_paging_dto.getOffset());
	    params.put("per_page", fes_paging_dto.getPer_page());
	    return dao.management_selectAll(params);
	}
	
	public List<QnADTO> qna_list_selectAll(Festival_board_pagingDTO paging_dto) {
		return dao.qna_list_selectAll(paging_dto);
	}
	
	public int select_total_page() {
		return dao.select_total_page();
	}
	
	
	// 공지사항 관련
	public Admin_boardDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(Admin_boardDTO dto) {
		return dao.admin_write(dto);
	}

	public int modify(Admin_boardDTO dto) {
		return dao.modify(dto);
	}

	public MemberDTO findMemberByNickname(String nickname) {
        return dao.findMemberByNickname(nickname);
    }

	
	// 유저 벤 관련
	public void banMember(int idx, LocalDate banUntil) {
	    HashMap<String, Object> params = new HashMap<>();
	    params.put("idx", idx);
	    params.put("banUntil", banUntil);
	    session.update("com.ohmija.repository.Admin_boardDAO.banMember", params);
	}

    public List<MemberDTO> getBannedMembers() {
        return dao.getBannedMembers();
    }

    
    // 관리자 페이지 관련
	public List<BoardDTO> confirm_selectAll(Festival_board_pagingDTO paging_dto) {
		return dao.confirm_selectAll(paging_dto);
	}

	public BoardDTO confirm_selectOne(int idx) {
		return dao.confirm_selectOne(idx);
	}

	public int approve(BoardDTO boardDTO) {
	    return dao.approve(boardDTO);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}
	
	// 스케줄링 삭제
	public void deleteSchedule(LocalDateTime threeDays) {
        dao.deleteSchedule(threeDays);
    }
}


