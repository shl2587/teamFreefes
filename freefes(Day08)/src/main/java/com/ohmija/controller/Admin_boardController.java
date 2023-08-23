package com.ohmija.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.service.Admin_boardService;

@Controller
@RequestMapping("/admin_board")
public class Admin_boardController {

	@Autowired
	private Admin_boardService admin_boardService;
	
	@RequestMapping()
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/admin_board/admin_board");
		List<Admin_boardDTO> list = admin_boardService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/admin_board/view");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	// 공지사항 작성
//	@GetMapping("/admin_write")
//	public String write(HttpSession session) {
//	    int role = (int)session.getAttribute("role"); // 로그인 할 때 세션에 저장된 role번호 몇인지 판별
//	    if(role != 0) {
//	        return "redirect:/";
//	    }
//	    return "admin_board/admin_write";
//	}
//
//	@PostMapping("/admin_write")
//	public String write(Admin_boardDTO dto, HttpSession session) {
//	    int role = (int)session.getAttribute("role");
//
//	    if(role != 0) {
//	        return "redirect:/";
//	    }
//	    int memberIdx = (int)session.getAttribute("memberIdx");
//	    dto.setMember(memberIdx);
//	    int row = admin_boardService.write(dto);
//	    System.out.println(row + " 행 추가");
//	    return "redirect:/admin_board";
//	}
	
	
	// 임시 함수
	@GetMapping("/admin_write")
	public String write() {
		return "admin_board/admin_write";
	}
	
	@PostMapping("/admin_write")
	public String write(Admin_boardDTO dto) {
		int memberIdx = 0;	// 더미 role 인덱스(관리자 공지사항 등록용)
		dto.setMember(memberIdx);//
		int row = admin_boardService.write(dto);
		System.out.println(row + " 행이 추가");
		return "redirect:/admin_board";
	}
	
	
	@GetMapping("/{choice}")
	public ModelAndView choice_menu(@PathVariable("choice") String choice) {
		ModelAndView mav = new ModelAndView();
		
		switch(choice) {
		case "admin_board":
			mav.setViewName("admin_board/admin_board");
			break;
		case "admin_board_ask":
			mav.setViewName("admin_board/admin_board_ask");
			break;
		case "surround":
			mav.setViewName("admin_board/surround");
			break;
		case "qna_board":
			mav.setViewName("admin_board/qna_board");
			break;
		default:
			mav.setViewName("redirect:/admin_board");
			break;
		}
		return mav;
		
	}
	
}
