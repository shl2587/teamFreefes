package com.ohmija.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;



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

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end_date;
	
	private String title;
	private String content;
	private int count;
	private int favorites;
	private int grade;
	private String region;
	private String festival_category;
	private String period;
	private String url;
	private String place;
	private String way_to_come;
	private String fee; 
	private String age_limit;
	private String time;
	private String host_org;
	private String inquire;
	private String file_name;
	private String file_path;
	private List<MultipartFile> file_list;
	
	// 동영 추가
	private boolean is_hold;
	private String remain;
	private int rank;
	
	
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
	public String getFestival_category() {
		return festival_category;
	}
	public void setFestival_category(String festival_category) {
		this.festival_category = festival_category;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getWay_to_come() {
		return way_to_come;
	}
	public void setWay_to_come(String way_to_come) {
		this.way_to_come = way_to_come;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getAge_limit() {
		return age_limit;
	}
	public void setAge_limit(String age_limit) {
		this.age_limit = age_limit;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHost_org() {
		return host_org;
	}
	public void setHost_org(String host_org) {
		this.host_org = host_org;
	}
	public String getInquire() {
		return inquire;
	}
	public void setInquire(String inquire) {
		this.inquire = inquire;
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
	public List<MultipartFile> getFile_list() {
		return file_list;
	}
	public void setFile_list(List<MultipartFile> file_list) {
		this.file_list = file_list;
	}
	
	// 동영 추가
	public boolean isIs_hold() {
		return is_hold;
	}
	public void setIs_hold(boolean is_hold) {
		this.is_hold = is_hold;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
	
	
	

}
