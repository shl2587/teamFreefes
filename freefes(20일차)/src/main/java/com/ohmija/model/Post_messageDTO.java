package com.ohmija.model;

import java.sql.Date;

public class Post_messageDTO {
//    idx                 number                  generated always as identity primary key,
//    writer              number                  not null,   -- 보내는 사람
//    reciever            number                  not null,   -- 받는 사람 (닉네임)
//    title               varchar2(50)            not null,   -- 제목
//    content             varchar2(1000)          not null,   -- 내용
//    category            varchar2(20)            not null,   -- 관리자 or 사적 내용
//    result              number                  default 0 check (result in (0, 1)), -- 알람
	private int idx;
	private int writer;
	private int reciever;
	private String title;
	private String content;
	private String category;
	private int result;
	private int recieverIdx;
	private Date date_column;
	
	public Date getDate_column() {
		return date_column;
	}
	public void setDate_column(Date date_column) {
		this.date_column = date_column;
	}
	private String writer_nickname;
	private String reciever_nickname;
	
	public String getWriter_nickname() {
		return writer_nickname;
	}
	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}
	public String getReciever_nickname() {
		return reciever_nickname;
	}
	public void setReciever_nickname(String reciever_nickname) {
		this.reciever_nickname = reciever_nickname;
	}
	
	public int getRecieverIdx() {
		return recieverIdx;
	}
	public void setRecieverIdx(int recieverIdx) {
		this.recieverIdx = recieverIdx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getReciever() {
		return reciever;
	}
	public void setReciever(int reciever) {
		this.reciever = reciever;
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
