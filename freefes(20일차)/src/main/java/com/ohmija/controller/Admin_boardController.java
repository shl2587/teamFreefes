package com.ohmija.controller;

import java.time.LocalDate;
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

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.service.Admin_boardService;
import com.ohmija.service.MemberService;
import com.ohmija.service.QnAService;

@Controller
@RequestMapping("/admin_board")
public class Admin_boardController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private Admin_boardService admin_boardService;
	
	@Autowired
	private QnAService qnaService;
	
	@RequestMapping("/admin_board")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/admin_board/admin_board");
		List<Admin_boardDTO> list = admin_boardService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	
	@GetMapping("/admin_view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/admin_board/admin_view");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
//	 공지사항 작성
	@GetMapping("/admin_write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
	    int role = dto.getRole(); // 로그인 할 때 세션에 저장된 role번호 몇인지 판별
	    System.out.println(role);
	    if(role != 0) {
	        return "redirect:/";
	    }
	    return "/admin_board/admin_write";
	}

	
	@PostMapping("/admin_write")
	public String write(Admin_boardDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberIdx = (MemberDTO)session.getAttribute("login");
	    int idx = memberIdx.getIdx();
	    dto.setMember(idx);
	    System.out.println(idx);
	    int row = admin_boardService.write(dto);
	    if(row > 0) {
	    	System.out.println(row + "행 추가");
	    	return "redirect:/admin_board/admin_board";
	    } else {
	    	System.out.println("추가 실패");
	    	return "redirect:/admin_board/admin_write";
	    }
	}
	
	// 공지사항 수정
	@GetMapping("/admin_modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("admin_board/admin_modify");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/admin_modify/{idx}")
	public String modify(Admin_boardDTO dto) {
		int row = admin_boardService.modify(dto);
		System.out.println(row + "행이 수정");
		return "redirect:/admin_board/admin_view/" + dto.getIdx();
	}
	
	////////////////////////////////////////////////////////////////////////////////
	//////////////////////// 관리자 페이지 //////////////////////
	
	// 관리자 메인페이지
		@RequestMapping("/management_page")
		public ModelAndView management_page() {
			ModelAndView mav = new ModelAndView("/admin_board/management_page");
			List<Admin_boardDTO> list = admin_boardService.selectAll();
			mav.addObject("list", list);
			return mav;
		}
		
	// 관리자 공지사항 작성 
		@GetMapping("/management_notice_write")
		public String notice_write(HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDTO dto = (MemberDTO)session.getAttribute("login");
		    int role = dto.getRole(); // 로그인 할 때 세션에 저장된 role번호 몇인지 판별
		    System.out.println(role);
		    if(role != 0) {
		        return "redirect:/";
		    }
		    return "/admin_board/management_notice_write";
		}

		
		@PostMapping("/management_notice_write")
		public String notice_write(Admin_boardDTO dto, HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDTO memberIdx = (MemberDTO)session.getAttribute("login");
		    int idx = memberIdx.getIdx();
		    dto.setMember(idx);
		    System.out.println(idx);
		    int row = admin_boardService.write(dto);
		    if(row > 0) {
		    	System.out.println(row + "행 추가");
		    	return "redirect:/admin_board/management_page";
		    } else {
		    	System.out.println("추가 실패");
		    	return "redirect:/admin_board/management_notice_write";
		    }
		}
		
		// 관리자 공지사항 수정
		@GetMapping("/management_notice_modify/{idx}")
		public ModelAndView management_modify(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("admin_board/management_notice_modify");
			Admin_boardDTO dto = admin_boardService.selectOne(idx);
			mav.addObject("dto", dto);
			return mav;
		}
		
		@PostMapping("/management_notice_modify/{idx}")
		public String management_modify(Admin_boardDTO dto) {
			int row = admin_boardService.modify(dto);
			System.out.println(row + "행이 수정");
			return "redirect:/admin_board/management_view/" + dto.getIdx();
		}
		
	// 관리자 1:1문의 목록 페이지
		@GetMapping("/management_qnaList")
		public ModelAndView management_qnaList() {
			ModelAndView mav = new ModelAndView("/admin_board/management_qnaList");
			List<QnADTO> list = qnaService.selectAll();
			mav.addObject("list", list);
			return mav;
		}
		
	// 관리자 1:1문의 답변 달기
		@GetMapping("/management_qna_view/{idx}")
		public ModelAndView mng_qna_view(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_qna_view");
			QnADTO dto = qnaService.selectOne(idx);
			mav.addObject("dto", dto);
			return mav;
		}
		
		@PostMapping("/management_qna_view/{idx}")
		public String insertAnswer(@PathVariable("idx") int idx, String answer, HttpServletRequest request, RedirectAttributes redirectAttributes) {
			HttpSession session = request.getSession();
		    MemberDTO dto = (MemberDTO)session.getAttribute("login");
		    int role = dto.getRole();
		    
		    if(role != 0) {
		        return "redirect:/admin_board/management_qna_view";
		    }
		    
		    int result = qnaService.answer(idx, answer);
		    
		    if(result > 0) {
		        redirectAttributes.addFlashAttribute("message", "답변 등록");
		        return "redirect:/admin_board/management_qnaList";
		    } else {
		        redirectAttributes.addFlashAttribute("message", "등록 실패");
		        return "redirect:/admin_board/management_qna_view/" + idx;
		    }
		}
		
		
		// 관리자 공지사항 보기
		@GetMapping("/management_notice_view/{idx}")
		public ModelAndView mng_notice_view(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_notice_view");
			Admin_boardDTO dto = admin_boardService.selectOne(idx);
			mav.addObject("dto", dto);
			return mav;
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
		case "management_page":
			mav.setViewName("admin_board/management_page");
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
