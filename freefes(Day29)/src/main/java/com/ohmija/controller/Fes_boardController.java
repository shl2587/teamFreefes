package com.ohmija.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.ReplyDTO;
import com.ohmija.service.Fes_boardService;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	@Autowired Fes_boardService fes_boardService;
	@Autowired HttpSession session;
	@Autowired ReplyService replyService;
	
	
	// 동영 코드
	// 임시 저장 선택
	@GetMapping("/mainboardWrite")
	public ModelAndView select_temp_board(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		int member = memberDTO.getIdx();
		ModelAndView mav = new ModelAndView("fes_board/mainboardWrite");
		// 임시저장글 목록 불러오기
		ArrayList<BoardDTO> list = fes_boardService.select_temp_board(member);
		mav.addObject("list", list);
		return mav;
	}
	
	// 게시글 작성
	@PostMapping("/mainboardWrite")
	public String mainWrite(BoardDTO board_dto, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		// 작성자 설정
		int member = memberDTO.getIdx();
		board_dto.setMember(member);
		
		// 지역 풀네임 저장
		String region = board_dto.getRegion();
		String region_section = board_dto.getRegion_section();
		String full_region = region + " " + region_section;
		board_dto.setRegion(full_region);
		
		int row = 0;
		row = fes_boardService.mainWrite(board_dto);
		if (row != 0) {
			System.out.println("게시글 추가 성공");
		}
		return "redirect:/fes_board/fes_board_list";
	}
	

	
	
	
	// 승록
	@GetMapping("/fes_board_list")
	public ModelAndView main_board_list(@RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView();
		
		
		// 페이징 코드
		int board_page_count = fes_boardService.select_total_page();
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		
		// board에 저장된 모든 게시글을 불러오는 코드
		List<BoardDTO> fes_boardList = fes_boardService.fes_board_selectAll(fes_paging_dto);
		
		mav.addObject("fes_paging_dto", fes_paging_dto);
		mav.addObject("fes_boardList", fes_boardList);
		
		return mav;
	}
	
	@Transactional
	@GetMapping("/mainboard/{idx}")
	public ModelAndView main_board(BoardDTO board_dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("/fes_board/mainboard");
		
        int boardId = board_dto.getIdx();

        // 세션에 이미 조회한 게시글 ID 목록을 저장하고 있는지 확인
        Object viewed_boards = session.getAttribute("viewed_boards");
        if (viewed_boards == null) {
        	viewed_boards = new HashSet<Integer>();
            session.setAttribute("viewed_boards", viewed_boards);
        }
        else {
        	
        }
        
        // 댓글 불러오기
     	List<ReplyDTO> reply_list = replyService.selectOnBoard(board_dto.getIdx());
     	mav.addObject("reply_list", reply_list);
     		
     		// 자신의 댓글만 불러오기
     		MemberDTO member = (MemberDTO)session.getAttribute("login");
     		if(member != null) {
     			ReplyDTO replyDTO = new ReplyDTO();
     			
     			replyDTO.setBoard(board_dto.getIdx());
     			replyDTO.setMember(member.getIdx());
     			replyDTO = replyService.selectMyReply(replyDTO);
     			
     			mav.addObject("my_reply", replyDTO);
     		}
        
        // 조회한 게시글 ID 목록에서 현재 게시글 ID를 확인하여 이미 조회한 게시글인지 판단
        @SuppressWarnings("unchecked")
		Set<Integer> viewedBoardIds = (Set<Integer>) viewed_boards;
        BoardDTO board_view = fes_boardService.get_main_board(board_dto);
        int row = 0;
        
        if (!viewedBoardIds.contains(boardId)) {
        	int count = board_view.getCount();
        	board_dto.setCount(++count);
        	row = fes_boardService.update_board_count(board_dto);
    		// 조회수 증가 처리 후, 조회한 게시글 ID를 세션에 추가
            viewedBoardIds.add(boardId);
        }
		if (row != 0) {
			board_view = fes_boardService.get_main_board(board_dto);
		}
		else {
			board_view = fes_boardService.get_main_board(board_view);
		}
		int check_favorites = fes_boardService.check_favorites_board(board_dto, session);
		mav.addObject("board_view", board_view);
		mav.addObject("check_favorites", check_favorites);
		return mav;
	}
	
	@GetMapping("/{fes_page_href}")
	public ModelAndView festival_schedule_list(@PathVariable String fes_page_href, 
											   @RequestParam(value="request_page", defaultValue="1") int request_page) {
		
		ModelAndView mav = new ModelAndView("/fes_board/fes_board_list");
		if ("fes_board_proceeding".equals(fes_page_href)) {
			mav = new ModelAndView("/fes_board/" + fes_page_href);
		}
		else if ("fes_board_finish".equals(fes_page_href)) {
			mav = new ModelAndView("/fes_board/" + fes_page_href);
		}
		else if ("fes_board_scheduled".equals(fes_page_href)) {
			mav = new ModelAndView("/fes_board/" + fes_page_href);
		}
		
		int board_page_count = fes_boardService.select_total_sub_page(fes_page_href);
		
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		List<BoardDTO> fes_schedule_list = fes_boardService.get_schedule_list(fes_page_href, fes_paging_dto);
		
		mav.addObject("fes_schedule_list", fes_schedule_list);
		mav.addObject("fes_paging_dto", fes_paging_dto);
		return mav;
	}
	
	
}
