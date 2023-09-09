package com.ohmija.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.BoardDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.Post_messageDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.service.Admin_boardService;
import com.ohmija.service.Post_messageService;
import com.ohmija.service.QnAService;

@Controller
@RequestMapping("/admin_board")
public class Admin_boardController {
	

	@Autowired
	private Admin_boardService admin_boardService;
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private Post_messageService post_messageService;
	
// 1)
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////사용자 공지사항 페이지 ////////////////////////////
///////////////////////////////////////////////////////////////////////////////
	
// 사용자 공지사항 홈 ------------------------------------------------------------------------------------------ request > get
	@GetMapping("/admin_board")
	public ModelAndView list(@RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView("/admin_board/admin_board");
		int board_page_count = admin_boardService.select_total_page();
		Festival_board_pagingDTO paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
		mav.addObject("paging_dto", paging_dto);
		List<Admin_boardDTO> list = admin_boardService.adminboard_selectAll(paging_dto);
		mav.addObject("list", list);
		
		return mav;
	}

	
// 사용자 공지사항 View ------------------------------------------------------------------------------------------
	@GetMapping("/admin_view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/admin_board/admin_view");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	
// 2)
///////////////////////////////////////////////////////////////////////////////
//////////////////////////////관리자 공지 페이지//////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
	
// 관리자 공지사항 목록 --------------------------------------------------------------- request > get
	@GetMapping("/management_page")
	public ModelAndView management_page(@RequestParam(value="request_page", defaultValue="1") int request_page) {
	    ModelAndView mav = new ModelAndView("/admin_board/management_page");
	    
	    int board_page_count = admin_boardService.select_total_page();
	    Festival_board_pagingDTO paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
	    mav.addObject("paging_dto", paging_dto);
	    List<Admin_boardDTO> list = admin_boardService.management_selectAll(paging_dto);
	    mav.addObject("list", list);
	    
	    return mav;
	}
		
	
// 관리자 공지사항 글 작성 ---------------------------------------------------------------
		@GetMapping("/management_notice_write")
		public String notice_write(HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberDTO dto = (MemberDTO)session.getAttribute("login");
		    int role = dto.getRole(); // 로그인 할 때 세션에 저장된 role번호 몇인지 판별
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
		    int row = admin_boardService.write(dto);
		    if(row > 0) {
		    	return "redirect:/admin_board/management_page";
		    } else {
		    	return "redirect:/admin_board/management_notice_write";
		    }
		}
		
		
// 관리자 공지사항 수정하기 ---------------------------------------------------------------
		 @GetMapping("/management_notice_modify/{idx}")
		    public ModelAndView management_modify(@PathVariable("idx") int idx) {
		        ModelAndView mav = new ModelAndView("admin_board/management_notice_modify");
		        Admin_boardDTO dto = admin_boardService.selectOne(idx);
		        mav.addObject("dto", dto);
		        return mav;
		    }

	    @PostMapping("/management_notice_modify/{idx}")
	    public String management_modify(Admin_boardDTO dto) {
	        dto.setWrite_date(new Date());  // 현재 날짜와 시간으로 설정
	        admin_boardService.modify(dto);
	        return "redirect:/admin_board/management_notice_view/" + dto.getIdx();
	    }
		    
		
// 관리자 1:1문의 리스트 페이지 ----------------------------------------------------
		@GetMapping("/management_qna_list")
		public ModelAndView management_qnaList(@RequestParam(value="request_page", defaultValue="1") int request_page) {
		    ModelAndView mav = new ModelAndView("/admin_board/management_qna_list");
		    
		    int total_page_count = admin_boardService.select_total_page();
		    Festival_board_pagingDTO paging_dto = new Festival_board_pagingDTO(request_page, total_page_count);
		    
		    mav.addObject("paging_dto", paging_dto);
		    
		    List<QnADTO> list = admin_boardService.qna_list_selectAll(paging_dto);
		    mav.addObject("list", list);
		    
		    return mav;
		}
		
		
// 관리자 1:1문의 View 답변 달기 -----------------------------------------------------------------------
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
		        return "redirect:/admin_board/management_qna_list";
		    } else {
		        redirectAttributes.addFlashAttribute("message", "등록 실패");
		        return "redirect:/admin_board/management_qna_view/" + dto.getIdx();
		    }
		}
		
		
// 관리자 공지사항 view 자세히 보기 ----------------------------------------------------------------
		@GetMapping("/management_notice_view/{idx}")
		public ModelAndView mng_notice_view(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_notice_view");
			Admin_boardDTO dto = admin_boardService.selectOne(idx);
			mav.addObject("dto", dto);
			return mav;
		}
		
		
// 3)
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////벤 처리/////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////		
				
// 벤 처리된 회원 목록 불러오기 ---------------------------------------------------------request > get
		@GetMapping("/exclude_list")
		public ModelAndView bannedMembers() {
		    ModelAndView mav = new ModelAndView("/admin_board/exclude_list");
		    List<MemberDTO> list = admin_boardService.getBannedMembers();
		    mav.addObject("list", list);
		    return mav;
		}
		
		
// 유저 벤 목록에 추가하기 -----------------------------------------------------------
		@GetMapping("/addExclude_member")
		public void addExcludeMember() {}
		
		@PostMapping("/addExclude_member")
		public String addExcludeMember(String nickname, RedirectAttributes redirectAttributes) {
		    MemberDTO member = admin_boardService.findMemberByNickname(nickname);
		    if (member != null) {
		        LocalDate banUntil = LocalDate.now().plusDays(3);
		        admin_boardService.banMember(member.getIdx(), banUntil);  // 벤 처리
		        redirectAttributes.addFlashAttribute("message", "회원이 3일 동안 벤 처리되었습니다.");
		    } else {
		        redirectAttributes.addFlashAttribute("message", "닉네임이 존재하지 않습니다. 다시 입력해주세요.");
		    }
		    return "redirect:/admin_board/exclude_list";
		}
    
		
// 4)
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////축제 게시글 승인 /////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
			
// 사용자 축제 게시글 신청 리스트 ------------------------------------------------------------------------request > get
    @GetMapping("/confirm_list")
    public ModelAndView confirm_list(@RequestParam(value="request_page", defaultValue="1") int request_page) {
        ModelAndView mav = new ModelAndView("/admin_board/confirm_list");

        int board_page_count = admin_boardService.select_total_page();
        Festival_board_pagingDTO paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
        mav.addObject("paging_dto", paging_dto);
        List<BoardDTO> list = admin_boardService.confirm_selectAll(paging_dto);
        mav.addObject("list", list);

        return mav;
    }

		
// 승인할 축제 게시글 자세히 보기 --------------------------------------------------------------------------------
	    @GetMapping("/confirm_list_view/{idx}")
		public ModelAndView confirm_lsit_view(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/confirm_list_view");
			BoardDTO dto = admin_boardService.confirm_selectOne(idx);
			mav.addObject("dto", dto);
			return mav;
		}

// 게시글 승인 하기 ------------------------------------------------------------------
		@PostMapping("/confirm_list_view/{idx}")
		public String insertConfirm(@PathVariable("idx")int idx, HttpServletRequest request, RedirectAttributes redirectAttributes) {
			HttpSession session = request.getSession();
		    BoardDTO dto = (BoardDTO)session.getAttribute("approve");
		    int approve = dto.getApprove();
		    
		    if(approve == 0) {
		        return "redirect:/admin_board/management_view";
		    }
	
			return "redirect:/admin_board/confirm_list";
		}
		
		
// 5)
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////관리자 쪽지함 ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
		
// 관리자 메세지 보내기 -------------------------------------------------------------
		@GetMapping("/management_send_message/{idx}")
		public ModelAndView sendMessage(@PathVariable("idx")int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_send_message");
			return mav;
		}
		
		@PostMapping("/management_send_message/{idx}")
		public String sendMessage(@PathVariable("idx")int idx, Post_messageDTO dtoP, String receiver_nickname) {
			post_messageService.sendMessage(dtoP, idx, receiver_nickname);
			return "redirect:/admin_board/management_message_list/{idx}";
		}
		
		
// 관리자 메세지 모아보기 -----------------------------------------------------------		
		@GetMapping("/management_message_list/{idx}")
		public ModelAndView receiverMessage(@PathVariable("idx")int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_message_list");
			List<Post_messageDTO> list = post_messageService.selectMessage(idx);
			mav.addObject("list", list);
			return mav;
		}
		
// 관리자 보낸 매세지 모아보기 --------------------------------------------------------
		@GetMapping("/management_sendMessage_list/{idx}")
		public ModelAndView sendMessage_List(@PathVariable("idx")int idx) {
			ModelAndView mav = new ModelAndView("admin_board/management_message_list");
			List<Post_messageDTO> list = post_messageService.select_SendMessage(idx);
			mav.addObject("list", list);
			return mav;
		}
		
// 관리자 받은 메세지 모아보기 ---------------------------------------------------------
		@GetMapping("/management_receivedMessage_list/{idx}")
		public ModelAndView receivedMessage_List(@PathVariable("idx")int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_receivedMessage_list");
			List<Post_messageDTO> list = post_messageService.receivedMessage_List(idx);
			mav.addObject("list", list);
			return mav;
		}
			
// 관리자 메세지 내용 보기 --------------------------------------------------------------
		@GetMapping("/management_message_view/{idx}")
		  public ModelAndView view_message(@PathVariable("idx") int idx) {
			ModelAndView mav = new ModelAndView("/admin_board/management_message_view"); 
		    Post_messageDTO dto = post_messageService.selectOne(idx);
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
