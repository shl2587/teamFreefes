package com.ohmija.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Admin_boardService;

@RestController
public class Admin_boardRestController {

	@Autowired
	private Admin_boardService admin_boardService;
	
	
	
// 공지사항 전체 삭제 -----------------------------------
	@Transactional
	@GetMapping("/notice_delete/{idx}")
	public String delete(@PathVariable("idx") int idx, RedirectAttributes redirectAttributes) {
	    int row = admin_boardService.delete(idx);
	    if (row > 0) {
	        redirectAttributes.addFlashAttribute("message", "삭제 성공");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "삭제 실패");
	    }
	    return "redirect:/admin_board/management_page";
	}
	
	
	
// 수락, 거절 approve 변환 -------------------------------
	@PostMapping("/admin_board/approve")
	public String approve(BoardDTO boardDTO) {
	    admin_boardService.approve(boardDTO);
	    return "redirect:/admin_board/confirm_list";
	}
	
}



