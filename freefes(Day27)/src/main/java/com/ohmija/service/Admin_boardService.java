package com.ohmija.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.repository.Admin_boardDAO;

@Service
public class Admin_boardService {
	
	@Autowired
	private SqlSession session;

	@Autowired
	private Admin_boardDAO dao;
	
	public List<Admin_boardDTO> selectAll() {
		return dao.selectAll();
	}

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

	public void banMember(int idx, LocalDate banUntil) {
	    HashMap<String, Object> params = new HashMap<>();
	    params.put("idx", idx);
	    System.out.println(idx);
	    params.put("banUntil", banUntil);
	    session.update("com.ohmija.repository.Admin_boardDAO.banMember", params);
	    System.out.println("벤 처리 됐나");
	}

    public List<MemberDTO> getBannedMembers() {
        return dao.getBannedMembers();
    }

	public List<BoardDTO> confirm_selectAll() {
		return dao.confirm_selectAll();
	}
	

}

