package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohmija.service.QnAService;

@RestController
public class QnARestController {

	@Autowired
	private QnAService qnaService;
	

// 1:1문의 전체 삭제 ----------------------------------------------	
	@Transactional
	@GetMapping("/qna_delete/{idx}")
	public String delete(@PathVariable("idx") int idx, RedirectAttributes redirectAttributes) {
	    int row = qnaService.delete(idx);
	    if (row > 0) {
	        redirectAttributes.addFlashAttribute("message", "삭제 성공");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "삭제 실패");
	    }
	    return "redirect:/qna/qna_board";
	}
   
}
