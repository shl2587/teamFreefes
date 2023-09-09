package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.ReplyDTO;
import com.ohmija.service.Fes_boardService;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/member/mypage")
public class ReplyController {
	
	@Autowired private ReplyService replyService;
	@Autowired private Fes_boardService boardService;
	
	// 계립 코드
	@GetMapping("/reply_list/{idx}")
	public ModelAndView Favorites(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/reply_list");
		List<ReplyDTO> Rep = replyService.selectfav(idx);
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
