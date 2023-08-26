package com.ohmija.model;

import java.util.Date;


public class Fes_searchDTO {
	
	private String region;
	private String region_section;
	private String festival_category;
	private String search_method;
	
	private Date start_date;
	private Date end_date;
	
	private String fes_keyword;
	
	
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
	public String getFes_keyword() {
		return fes_keyword;
	}
	public void setFes_keyword(String fes_keyword) {
		this.fes_keyword = fes_keyword;
	}
	
	
	
}
