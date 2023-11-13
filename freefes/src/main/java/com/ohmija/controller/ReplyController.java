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
import com.ohmija.model.ReplyDTO;
import com.ohmija.model.Reply_pagingDTO;
import com.ohmija.service.Fes_boardService;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/member/mypage")
public class ReplyController {
	
	@Autowired private ReplyService replyService;
	@Autowired private Fes_boardService boardService;
	
	@GetMapping("/reply_list/{idx}")
	public ModelAndView Reply_list(@PathVariable("idx")int idx, @RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView("/member/mypage/reply_list");
		
		int board_page_count = replyService.select_total_page(idx);
		Reply_pagingDTO reply_pagingdto = new Reply_pagingDTO(request_page, board_page_count);
		reply_pagingdto.setMember(idx);
		System.out.println("reply : "+ reply_pagingdto.getMember());
		
		// board에 저장된 모든 게시글을 불러오는 코드
		List<ReplyDTO> Rep = replyService.select_reply(reply_pagingdto);
		mav.addObject("reply_pagingdto", reply_pagingdto);
		mav.addObject("Rep", Rep);
		return mav;
	}
	
	// 동영 코드
	@PostMapping("/reply_write")
	public String reply_write(ReplyDTO dto) {
		int row = replyService.reply_write(dto);
		System.out.println(row + "행이 댓글 테이블에 추가되었습니다");
		int boardIdx = dto.getBoard();
		float gradeAVG = replyService.get_gradeAVG(boardIdx);
		boardService.grade_update(boardIdx, gradeAVG);
		return "redirect:/fes_board/mainboard/" + dto.getBoard();
	}
	
	@GetMapping("/reply_delete/{idx}")
	public String reply_delete(@PathVariable("idx") int idx) {
		int boardIdx = replyService.selectByIdx(idx);
		int row = replyService.reply_delete(idx);
		System.out.println(row + "행이 삭제되었습니다");
		return "redirect:/fes_board/mainboard/" + boardIdx;
	}
}
