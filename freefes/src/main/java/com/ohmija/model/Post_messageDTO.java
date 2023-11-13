package com.ohmija.model;

import java.sql.Date;

public class Post_messageDTO {
//    idx                 number                  generated always as identity primary key,
//    writer              number                  not null,   -- 보내는 사람
//    receiver            number                  not null,   -- 받는 사람 (닉네임)
//    title               varchar2(50)            not null,   -- 제목
//    content             varchar2(1000)          not null,   -- 내용
//    category            varchar2(20)            not null,   -- 관리자 or 사적 내용
//    result              number                  default 0 check (result in (0, 1)), -- 알람
	private int idx;
	private int writer;
	private int receiver;
	private String title;
	private String content;
	private String category;
	private int result;
	private int receiverIdx;
	private Date date_column;
	
	private String writer_nickname;
	private String receiver_nickname;
	
	public Date getDate_column() {
		return date_column;
	}
	public void setDate_column(Date date_column) {
		this.date_column = date_column;
	}
	
	public String getWriter_nickname() {
		return writer_nickname;
	}
	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}
	public String getReceiver_nickname() {
		return receiver_nickname;
	}
	public void setReceiver_nickname(String receiver_nickname) {
		this.receiver_nickname = receiver_nickname;
	}
	
	public int getReceiverIdx() {
		return receiverIdx;
	}
	public void setReceiverIdx(int receiverIdx) {
		this.receiverIdx = receiverIdx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	
	

}
