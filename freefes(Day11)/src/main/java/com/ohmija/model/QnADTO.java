package com.ohmija.model;

//idx                 number                  generated always as identity primary key,
//member              number                  not null,
//category            varchar2(20)            not null,
//title               varchar2(50)            not null,
//question            varchar2(600)           not null,
//answer              varchar2(600)           ,

public class QnADTO {

	private int idx;
	private int member;
	private String category;
	private String title;
	private String question;
	private String answer;

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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
