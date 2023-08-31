package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.Post_messageDTO;

import com.ohmija.model.MemberDTO;
import com.ohmija.repository.MemberDAO;
import com.ohmija.repository.PostMessageDAO;

@Service
public class Post_messageService {


	@Autowired private PostMessageDAO dao;
	@Autowired private MemberDAO daoM;
	
	@Transactional
	public int sendMessage (Post_messageDTO dtoP, int idx, String reciever_nickname) {
		System.out.println("idx : "+idx+"reciever_nickname : "+reciever_nickname);
		MemberDTO row1 = daoM.findReciever(reciever_nickname);
		System.out.println("row1 :"+row1);
		int recieverIdx = row1.getIdx();
		System.out.println("recieverIdx : " + recieverIdx);
		dtoP.setReciever(recieverIdx);
		dtoP.setWriter(idx);
		System.out.println("row1의 idx : "+ recieverIdx);
		int row2 = 0;
			if(row1.getIdx() != 0) {
				row2 = dao.sendMessage(dtoP);
				System.out.println("row2 : " + row2);
				return row2;
			}
		return row2;
	}

	public List<Post_messageDTO> selectMessage(int idx) {
		return dao.selectMessage(idx);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public List<Post_messageDTO> select_SendMessage(int idx) {
		return dao.select_SendMessage(idx);
	}

	public List<Post_messageDTO> recievedMessage_List(int idx) {
		return dao.select_recievedMessage(idx);
	}

	public int reciever_nicknameCheck(String reciever_nickname) {
		return daoM.reciever_nicknameCheck(reciever_nickname);
	}

//	public int titleCheck(String titleInput) {
//	    if (titleInput != null && titleInput.trim().length() <= 20) {
//	        return 1;
//	    } else {
//	        return 0;
//	    }
//	}
//
//	public int contentCheck(String content) {
//		   if (content != null && content.trim().length() <= 300) {
//		        return 1;
//		    } else {
//		        return 0;
//		    }
//	}


	

}
