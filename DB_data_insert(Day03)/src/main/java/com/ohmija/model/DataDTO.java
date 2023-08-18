package com.ohmija.model;

//		이름                      널?       유형             

//		----------------------- -------- -------------- 
//		IDX                     NOT NULL NUMBER         
//		REGION                  NOT NULL VARCHAR2(20)   
//		BASIC_ORGANIZATION_NAME          VARCHAR2(20)   
//		FES_NAME           		NOT NULL VARCHAR2(200)  
//		FES_CATEGORY       		NOT NULL VARCHAR2(50)   
//		FES_DATE           		NOT NULL VARCHAR2(1000) 
//		FES_PLACE          		NOT NULL VARCHAR2(500)  
//		HOSTING_METHOD                   VARCHAR2(50)   
//		FIRST_HOSTING_YEAR               VARCHAR2(50)   
//		VISITOR_COUNT           NOT NULL VARCHAR2(100)  
//		FORIEGNER_COUNT         NOT NULL VARCHAR2(100)  
//		DEDICATED_ORGANIZATION  NOT NULL VARCHAR2(100)  
//		ORGANIZATION_TYPE       NOT NULL VARCHAR2(50)   

public class DataDTO {

	private int idx;
	private String region;
	private String basic_organization_name;
	private String fes_name;
	private String fes_category;
	private String fes_date;
	private String fes_place;
	private String hosting_method;
	private String first_hosting_year;
	private String visitor_count;
	private String foriengner_count;
	private String dedicated_organization;
	private String oranization_type;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getBasic_organization_name() {
		return basic_organization_name;
	}

	public void setBasic_organization_name(String basic_organization_name) {
		this.basic_organization_name = basic_organization_name;
	}

	public String getFes_name() {
		return fes_name;
	}

	public void setFes_name(String fes_name) {
		this.fes_name = fes_name;
	}

	public String getFes_category() {
		return fes_category;
	}

	public void setFes_category(String fes_category) {
		this.fes_category = fes_category;
	}

	public String getFes_date() {
		return fes_date;
	}

	public void setFes_date(String fes_date) {
		this.fes_date = fes_date;
	}

	public String getFes_place() {
		return fes_place;
	}

	public void setFes_place(String fes_place) {
		this.fes_place = fes_place;
	}

	public String getHosting_method() {
		return hosting_method;
	}

	public void setHosting_method(String hosting_method) {
		this.hosting_method = hosting_method;
	}

	public String getFirst_hosting_year() {
		return first_hosting_year;
	}

	public void setFirst_hosting_year(String first_hosting_year) {
		this.first_hosting_year = first_hosting_year;
	}

	public String getVisitor_count() {
		return visitor_count;
	}

	public void setVisitor_count(String visitor_count) {
		this.visitor_count = visitor_count;
	}

	public String getForiengner_count() {
		return foriengner_count;
	}

	public void setForiengner_count(String foriengner_count) {
		this.foriengner_count = foriengner_count;
	}

	public String getDedicated_organization() {
		return dedicated_organization;
	}

	public void setDedicated_organization(String dedicated_organization) {
		this.dedicated_organization = dedicated_organization;
	}

	public String getOranization_type() {
		return oranization_type;
	}

	public void setOranization_type(String oranization_type) {
		this.oranization_type = oranization_type;
	}

}
