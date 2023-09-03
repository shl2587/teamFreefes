package com.ohmija.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
//	idx                 number                  generated always as identity primary key,
//    role                number                  not null check(role in (0, 1, 2)), -- role을 0(관리자), 1(회원), 2(가게 주인)
//    userid              varchar2(50)            unique not null,
//    userpw              varchar2(50)            not null,
//    verify1             varchar2(200)           not null,
//    verify2             varchar2(200)           not null,
//    answer1             varchar2(100)           not null,
//    answer2             varchar2(100)           not null,
//    email               varchar2(50)            unique not null,
//    gender              char                    check(gender in ('남', '여')) not null,
//    birth               date                    not null,
//    name                varchar2(50)            not null,
//    nickname            varchar2(50)            unique not null,
//    profile_img         varchar2(255)           default 'https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTgy/MDAxNjA0MjI4ODc1NDMw.Ex906Mv9nnPEZGCh4SREknadZvzMO8LyDzGOHMKPdwAg.ZAmE6pU5lhEdeOUsPdxg8-gOuZrq_ipJ5VhqaViubI4g.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_%ED%95%98%EB%8A%98%EC%83%89.jpg?type=w800',
//    mileage             number                  not null,
//    address             varchar2(50)            not null,
//    phonenumber         varchar2(20)            not null,
//    attend              number                  default 0 check (attend >= 0),
//    productlist         number             
	
	
	private int idx;
	private int role;
	private String userid;
	private String userpw;
	private String verify1;
	private String verify2;
	private String answer1;
	private String answer2;
	private String email;
	private char gender;
	private Date birth;
	private String name;
	private String nickname;
	private String address;
	private String phonenumber;
	private int attend;
	
	private String loggedInUserId;
	private String userpwNew;
	private String profile_img;		// DB에 저장된 파일 경로를 문자열로 받아오기 위한 필드
	private MultipartFile upload;	// <form>으로 전송되는 파일을 저장하기 위한 필드
	
	private Date ban_until;
	
	public String getUserpwNew() {
		return userpwNew;
	}
	public void setUserpwNew(String userpwNew) {
		this.userpwNew = userpwNew;
	}
	public String getLoggedInUserId() {
		return loggedInUserId;
	}
	public void setLoggedInUserId(String loggedInUserId) {
		this.loggedInUserId = loggedInUserId;
	}

	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getVerify1() {
		return verify1;
	}
	public void setVerify1(String verify1) {
		this.verify1 = verify1;
	}
	public String getVerify2() {
		return verify2;
	}
	public void setVerify2(String verify2) {
		this.verify2 = verify2;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getAttend() {
		return attend;
	}
	public void setAttend(int attend) {
		this.attend = attend;
	}
	
	public Date getBan_until() {
		return ban_until;
	}
	public void setBan_until(Date ban_until) {
		this.ban_until = ban_until;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", profile_img=" + profile_img + "]";
	}
} 