package com.ohmija.model;




public class Fes_searchDTO {
	
	private String region;
	private String region_section;
	private String festival_category;
	private String search_method;
	private	int member;
	private String complex;	// 불특정 내용 검색
	
	private String start_date;
	private String end_date;
	
	private String fes_keyword;

	private int offset;
	private int per_page;
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getRegion_section() {
		return region_section;
	}
	public void setRegion_section(String region_section) {
		this.region_section = region_section;
	}
	public String getFestival_category() {
		return festival_category;
	}
	public void setFestival_category(String festival_category) {
		this.festival_category = festival_category;
	}
	public String getSearch_method() {
		return search_method;
	}
	public void setSearch_method(String search_method) {
		this.search_method = search_method;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public String getComplex() {
		return complex;
	}
	public void setComplex(String complex) {
		this.complex = complex;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getFes_keyword() {
		return fes_keyword;
	}
	public void setFes_keyword(String fes_keyword) {
		this.fes_keyword = fes_keyword;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getPer_page() {
		return per_page;
	}
	public void setPer_page(int per_page) {
		this.per_page = per_page;
	}
	
	
	
}
