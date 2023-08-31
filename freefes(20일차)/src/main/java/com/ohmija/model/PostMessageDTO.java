package com.ohmija.model;

//idx                 number                  generated always as identity primary key,
//writer              number                  not null,
//reciever            number                  not null,
//title               varchar2(50)            not null,
//content             varchar2(1000)          not null,
//category            varchar2(20)            not null,
//result              number                  default 0 check (result in (0, 1)),

public class PostMessageDTO {

	private int idx;
	private int writer;
	private int receiver;
	private String title;
	private String content;
	private String category;
	private int result;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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
