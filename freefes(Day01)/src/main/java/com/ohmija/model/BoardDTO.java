package com.ohmija.model;

import java.util.Date;

//		IDX               NOT NULL NUMBER         
//		MEMBER            NOT NULL NUMBER         
//		WRITE_DATE                 DATE           
//		START_DATE        NOT NULL DATE           
//		END_DATE          NOT NULL DATE           
//		TITLE             NOT NULL VARCHAR2(50)   
//		CONTENT           NOT NULL VARCHAR2(2000) 
//		COUNT                      NUMBER         
//		FAVORITES                  NUMBER         
//		GRADE                      NUMBER         
//		REGION                     VARCHAR2(2000) 
//		FILE_NAME                  VARCHAR2(50)   
//		FILE_PATH                  VARCHAR2(255)  
//		FESTIVAL_CATEGORY          VARCHAR2(20) 

public class BoardDTO {
	
	private int idx;
	private int member;
	private Date write_date;
	private Date start_date;
	private Date end_date;
	private String title;
	private String content;
	private int count;
	private int favorites;
	private int grade;
	private String region;
	private String file_name;
	private String file_path;
	
	
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
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getFavorites() {
		return favorites;
	}
	public void setFavorites(int favorites) {
		this.favorites = favorites;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	
	
	
	

}
