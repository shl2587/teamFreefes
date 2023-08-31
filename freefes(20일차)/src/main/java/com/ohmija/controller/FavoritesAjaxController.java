package com.ohmija.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.FavoritesDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.service.FavoritesService;

@RestController
@RequestMapping("/fes_board")
public class FavoritesAjaxController {

	@Autowired FavoritesService favoritesService;
	
	@GetMapping("/favorites/{idx}")
	public FavoritesDTO favorites_select(@PathVariable("idx") int board_idx, 
										HttpSession session) {
		
		MemberDTO member_dto = (MemberDTO)session.getAttribute("login");
		int login_idx = member_dto.getIdx();

		HashMap<String, Object> favorites_result = new HashMap<>(); 
		FavoritesDTO favorites_dto = favoritesService.add_favorites(board_idx, login_idx);
		System.out.println("추가각 : " + favorites_dto);
		favorites_result.put("favorites_dto", favorites_dto);
		
		return favorites_dto;
	}
	
	@GetMapping("/favorites_delete/{idx}")
	public FavoritesDTO favorites_delete(@PathVariable("idx") int board_idx,
											HttpSession session) {
		
		MemberDTO member_dto = (MemberDTO)session.getAttribute("login");
		int login_idx = member_dto.getIdx();
		
		HashMap<String, Object> favorites_delete = new HashMap<>(); 
		FavoritesDTO favorites_dto = favoritesService.remove_favorites(board_idx, login_idx);
		System.out.println("삭제각 : " + favorites_dto);
		favorites_delete.put("favorites_dto", favorites_dto);
	
		return favorites_dto;
	}
	
}
