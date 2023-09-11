package com.ohmija.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.service.QnAService;


@Controller
@RequestMapping("/qna")
public class QnAController {

	@Autowired
	private QnAService qnaService;
	
	
///////////////////////////////////////////////////////////////////////////////
//////////////////////////////사용자 고객센터 내용////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// 클라이언트 1:1 문의 목록 ------------------------------------------------------
	@GetMapping("/qna_board")
	public ModelAndView myList(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView("/qna/qna_board");
	    HttpSession session = request.getSession();
	    MemberDTO dto = (MemberDTO)session.getAttribute("login");
	    int idx = dto.getIdx();
	    List<QnADTO> myList = qnaService.myList(idx); 
	    mav.addObject("myList", myList);
	    return mav;
	}
	
// 사용자 1:1 문의 자세히 보기 -----------------------------------------------------
	@GetMapping("/qna_view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/qna/qna_view");
		QnADTO dto = qnaService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	

// 사용자 1:1 문의글 작성 -----------------------------------------------------------
	@GetMapping("/qna_write")
	public void write() {
	}
	
	@PostMapping("/qna_write")
	public String write(QnADTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberIdx = (MemberDTO)session.getAttribute("login");
		int idx = memberIdx.getIdx();
		dto.setMember(idx);
		int row = qnaService.write(dto);
		if (row > 0) {
			return "redirect:/qna/qna_board";
		} else {
			return "redirect:/qna/qna_write";
		}
	}
	
	
// 1:1 문의 글 자세히 보기 -------------------------------------------------------------------
	@PostMapping("/qna_view/{idx}")
	public String insertAnswer(@PathVariable("idx") int idx, String answer, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
	    MemberDTO dto = (MemberDTO)session.getAttribute("login");
	    int role = dto.getRole();
	    
	    if(role != 0) {
	        return "redirect:/admin_board/management_qna_list";
	    }
	    
	    int result = qnaService.answer(idx, answer);
	    
	    if(result > 0) {
	        redirectAttributes.addFlashAttribute("message", "답변 등록");
	        return "redirect:/qna/qna_board";
	    } else {
	        redirectAttributes.addFlashAttribute("message", "등록 실패");
	        return "redirect:/qna/qna_view/" + idx;
	    }
	}
	
	
// 사용자 1:1 문의글 수정 --------------------------------------------------------------
	@GetMapping("/qna_modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("qna/qna_modify");
		QnADTO dto = qnaService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/qna_modify/{idx}")
	public String modify(QnADTO dto) {
		qnaService.modify(dto);
		return "redirect:/qna/qna_board";
	}
	
	
}
