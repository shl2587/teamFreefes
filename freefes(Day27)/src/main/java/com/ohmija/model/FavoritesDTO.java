package com.ohmija.model;

//		IDX    NOT NULL NUMBER 
//		BOARD  NOT NULL NUMBER 
//		MEMBER NOT NULL NUMBER 

public class FavoritesDTO {

	private int idx;
	private int board;
	private int member;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoard() {
		return board;
	}

	public void setBoard(int board) {
		this.board = board;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

}
