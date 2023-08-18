package com.ohmija.model;

//		이름          널?       유형             
//		----------- -------- -------------- 
//		IDX         NOT NULL NUMBER         
//		REGION      NOT NULL VARCHAR2(20)   
//		PERIOD      NOT NULL VARCHAR2(20)   
//		CATEGORY    NOT NULL VARCHAR2(200)  
//		URL         NOT NULL VARCHAR2(50)   
//		PLACE       NOT NULL VARCHAR2(1000) 
//		WAY_TO_COME          VARCHAR2(500)  
//		FEE         NOT NULL VARCHAR2(50)   
//		AGE_LIMIT            VARCHAR2(100)  
//		TIME                 VARCHAR2(100)  
//		HOST_ORG    NOT NULL VARCHAR2(50)   
//		INQUIRE     NOT NULL VARCHAR2(100)  


public class DataDTO {

	private int idx;
	private String title;
	private String region;
	private String period;
	private String category;
	private String url;
	private String place;
	private String way_to_come;
	private String fee;
	private String age_limit;
	private String time;
	private String host_org;
	private String inquire;
	
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	
	
}