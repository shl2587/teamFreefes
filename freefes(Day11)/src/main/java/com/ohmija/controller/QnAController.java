package com.ohmija.controller;

import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.mail.MailComponent;
import com.ohmija.model.PostMessageDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.service.PostMessageService;
import com.ohmija.service.QnAService;


@Controller
@RequestMapping("/qna")
public class QnAController {

	@Autowired
	private QnAService qnaService;
	
	//-----------------쪽지 알람 기능 연결
	@Autowired
	private PostMessageService postMessageService;
	
	// ----------------메일 발송 기능 연결
	@Autowired 
	private MailComponent mailComponent;
	
	
	
	// ---------- 1:1 문의목록
	@GetMapping("/qna_list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/qna/qna_list");
		List<QnADTO> list = qnaService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	
	// ----------- 1:1 문의글 보기
	@GetMapping("/view/{idx}")
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
	public String write(QnADTO dto) {
		int row = qnaService.write(dto);
		if (row > 0) {
			System.out.println(row + "행 추가");
			return "redirect:/qna/qna_list";
		} else {
			System.out.println("작성 실패");
			return "redirect:/qna/qna_write";
		}
	}

	
	// ------------- 쪽지 알람 함수
	@PostMapping("/answer")
	@ResponseBody
	public String answer(@RequestBody QnADTO qnaDTO) {
	    QnADTO qna = qnaService.answer(qnaDTO.getIdx(), qnaDTO.getAnswer());

	    PostMessageDTO message = new PostMessageDTO();
        message.setWriter(0); // 관리자 role 0
        message.setReceiver(qna.getMember()); // 질문 작성 회원
        message.setTitle("1:1 문의 답변");
        message.setContent("1:1 문의에 답변이 등록되었습니다.");
        message.setCategory("알림");
        postMessageService.sendMessage(message); // 메시지 전송

	    return "ggeut";
	}

	// ------------- 메일 발송 함수
	@GetMapping("/mailTest")
	public void mailTest() {}
	
	@PostMapping("/mailTest")
	public String mailTest(String email, String content) throws IOException {
		int row = mailComponent.sendMail(email, content);
		System.out.println(row);
		return "redirect:/mailTest";
	}

				
}
