package com.ohmija.model;

import java.sql.Date;

public class ReplyDTO {
//	 idx                 number                  generated always as identity primary key,
//	    member              number                  not null,
//	    board               number                  not null,
//	    content             varchar2(1000)          not null,
//	    grade               number                  default 0 check (grade between 0 and 5),
//	    write_date          date                    default sysdate,
	
	private int idx;
	private int member;
	private int board;
	private String content;
	private int number;
	private Date write_date;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getBoard() {
		return board;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
}
