package com.spring.biz.vo;

public class MainBoardVO {
	private int boardNum;
	private int kindOfBoard;
	private String boardTitle;
	private String createDate;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getKindOfBoard() {
		return kindOfBoard;
	}
	public void setKindOfBoard(int kindOfBoard) {
		this.kindOfBoard = kindOfBoard;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "MainBoardVO [boardNum=" + boardNum + ", kindOfBoard=" + kindOfBoard + ", boardTitle=" + boardTitle
				+ ", createDate=" + createDate + "]";
	}

	
}
