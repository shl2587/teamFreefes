package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Favorites_pagingDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.service.FavoritesService;
import com.ohmija.service.Fes_boardService;
import com.ohmija.service.MemberService;

@Controller
@RequestMapping("/member/mypage")
public class MypageController {
	
	@Autowired private MemberService memberService;
	@Autowired private FavoritesService favoritesService;
	@Autowired private Fes_boardService fes_boardService;
	
	
	@GetMapping("/mypage/{idx}")
	public ModelAndView mypage(@PathVariable("idx")int idx) {
		ModelAndView mav =new ModelAndView("/member/mypage/mypage");
		 MemberDTO tmp = memberService.selectOne(idx);
		 mav.addObject("login", tmp);
		return mav;
	}
	
	@RequestMapping("/jusoPopup")
	public void jusoPopup() {}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/modify");
		 MemberDTO tmp = memberService.selectOne(idx);
		 mav.addObject("login", tmp);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(@PathVariable("idx")int idx, MemberDTO dto) {
		dto.setIdx(idx);
		System.out.println("인덱스 저장됨 : " + dto.getIdx());
		int row = memberService.update(dto);
		System.out.println("업데이트 서비스 : ");
		return "redirect:/member/mypage/mypage/{idx}";
	}

	@GetMapping("/changeProfile")
	public void changeProfile() {}
	
	@GetMapping("/favorites/{idx}")
	public ModelAndView Favorites_list(@PathVariable("idx")int idx, @RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView("/member/mypage/favorites");
		System.out.println("앞");
		
		int board_page_count = favoritesService.select_fav_total_page(idx);
		Favorites_pagingDTO favorites_pagingdto = new Favorites_pagingDTO(request_page, board_page_count);
		
		favorites_pagingdto.setMember(idx);
		
		System.out.println("좋아요 : "+ favorites_pagingdto.getMember());
		
		List<BoardDTO> fav = favoritesService.selectfav(favorites_pagingdto);
		
		System.out.println("뒤");
		mav.addObject("favorites_pagingdto", favorites_pagingdto);
		mav.addObject("fav", fav);
		return mav;
	}
	
	
	@GetMapping("/board_list/{idx}")
	public ModelAndView main_board_list(@PathVariable("idx")int idx, @RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView("/member/mypage/board_list");
		System.out.println("앞");
		
		int board_page_count = fes_boardService.select_my_board_list(idx);
		Festival_board_pagingDTO fes_my_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		
		fes_my_paging_dto.setMember(idx);;
		System.out.println("나의 게시글 목록 : "+ fes_my_paging_dto.getMember());
	
		// board에 저장된 모든 게시글을 불러오는 코드
		List<BoardDTO> my_boardList = fes_boardService.my_board_selectAll(fes_my_paging_dto);
		
		mav.addObject("fes_my_paging_dto", fes_my_paging_dto);
		mav.addObject("my_boardList", my_boardList);
		
		return mav;
	}
	
	@GetMapping("/fes_board_modify/{idx}")
	public ModelAndView mainModify(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/fes_board_modify");
		
		BoardDTO fes_board_dto = new BoardDTO();
		fes_board_dto.setIdx(idx);
		fes_board_dto = fes_boardService.select_main_board(fes_board_dto);
		mav.addObject("fes_board_dto", fes_board_dto);
		return mav;
	}
	
	@PostMapping("/fes_board_modify/{idx}")
	public String mainModify(BoardDTO board_dto) {
		
		// 지역 풀네임 저장
		String region = board_dto.getRegion();
		String region_section = board_dto.getRegion_section();
		String full_region = region + " " + region_section;
		board_dto.setRegion(full_region);
		
		int row = 0;
		row = fes_boardService.mainModify(board_dto);
		if (row != 0) {
			System.out.println("게시글 수정 성공");
		}
		return "redirect:/member/mypage";
	}

}
