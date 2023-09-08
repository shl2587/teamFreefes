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
	

	// ---------- 운영진이 볼 1:1 문의목록 
	@GetMapping("/qna_list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/qna/qna_list");
		List<QnADTO> list = qnaService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	// 클라이언트가 볼 내 1:1 문의글 목록
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
	
	// ----------- 1:1 문의글 보기
	@GetMapping("/qna_view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/qna/qna_view");
		QnADTO dto = qnaService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	

	// ----------- 1:1문의글 작성
	@GetMapping("/qna_write")
	public void write() {
	}
	
	@PostMapping("/qna_write")
	public String write(QnADTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberIdx = (MemberDTO)session.getAttribute("login");
		int idx = memberIdx.getIdx();
		System.out.println(idx);
		dto.setMember(idx);
		int row = qnaService.write(dto);
		if (row > 0) {
			System.out.println(row + "행 추가");
			return "redirect:/qna/qna_board";
		} else {
			System.out.println("작성 실패");
			return "redirect:/qna/qna_write";
		}
	}
	
	
	// view에서 답글 달기
	@PostMapping("/qna_view/{idx}")
	public String insertAnswer(@PathVariable("idx") int idx, String answer, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
	    MemberDTO dto = (MemberDTO)session.getAttribute("login");
	    int role = dto.getRole();
	    
	    if(role != 0) {
	        return "redirect:/qna/qna_list";
	    }
	    
	    int result = qnaService.answer(idx, answer);
	    
	    if(result > 0) {
	        redirectAttributes.addFlashAttribute("message", "답변 등록");
	        return "redirect:/qna/qna_list";
	    } else {
	        redirectAttributes.addFlashAttribute("message", "등록 실패");
	        return "redirect:/qna/qna_view/" + idx;
	    }
	}
	
	
	// 문의글 board에서 수정버튼 눌러 이동하기
	@GetMapping("/qna_modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("qna/qna_modify");
		QnADTO dto = qnaService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/qna_modify/{idx}")
	public String modify(QnADTO dto) {
		int row = qnaService.modify(dto);
		System.out.println(row + "행이 수정");
		return "redirect:/qna/qna_view/" + dto.getIdx();
	}
	
	
}
