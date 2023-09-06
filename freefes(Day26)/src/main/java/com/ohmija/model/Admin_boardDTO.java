package com.ohmija.model;

import java.sql.Date;

//idx                 number                  generated always as identity primary key,
//member              number                  not null,
//title               varchar2(100)           not null,
//write_date          date                    default sysdate,
//content             varchar2(2000)          not null,

public class Admin_boardDTO {

	private int idx;
	private int member;
	private String title;
	private Date write_date;
	private String content;
	

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
