package com.ohmija.model;

public class Favorites_pagingDTO {
	private int member;
	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	private int request_page;		// 사용자가 요청한 페이지 번호
	private int offset;				// idx 역순으로 정렬했을 때 시작지점에서 건너뛰는 개수
	private final int per_page = 10;
	private int board_page_count;	// 총 게시글의 개수 (select count(*) from board2)
	private int total_count;
	
	private final int per_section = 10;
	private int page_begin;
	private int page_end;
	private boolean prev;
	private boolean next;
	
	public Favorites_pagingDTO() {};

	public Favorites_pagingDTO(int request_page, int board_page_count) {
		this.request_page = request_page;
		this.board_page_count = board_page_count;
		
		total_count = board_page_count / per_page;
		
		if(board_page_count % per_page != 0) {
			total_count += 1;			
		}
		
		if (request_page > total_count) {
			request_page = total_count;
			this.request_page = request_page;
		}
		if (request_page < 1) {
			request_page = 1;
			this.request_page = request_page;
		}
		page_begin = ((request_page - 1) / per_section) * per_section + 1;
		page_end = page_begin + per_section - 1;
		if (page_end >= total_count) {
			page_end = total_count;
		}
		
		
		offset = (request_page - 1) * per_section;
		
		prev = false;
		next = false;
		
		if (request_page != 1 && request_page <= total_count) {
			prev = true;
		}
		if (request_page < total_count) {
			next = true;
		}
	}

	public int getRequest_page() {
		return request_page;
	}

	public void setRequest_page(int request_page) {
		this.request_page = request_page;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getBoard_page_count() {
		return board_page_count;
	}

	public void setBoard_page_count(int board_page_count) {
		this.board_page_count = board_page_count;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getPage_begin() {
		return page_begin;
	}

	public void setPage_begin(int page_begin) {
		this.page_begin = page_begin;
	}

	public int getPage_end() {
		return page_end;
	}

	public void setPage_end(int page_end) {
		this.page_end = page_end;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPer_page() {
		return per_page;
	}

	public int getPer_section() {
		return per_section;
	}
}
