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
	private Date write_date;
	private float grade;
	
	// 동영 추가
	private String nickname;
	private int starPoint;
	
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
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
		float tmp = this.grade * 2;
		starPoint = (int)tmp;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStarPoint() {
		return starPoint;
	}

	
}
