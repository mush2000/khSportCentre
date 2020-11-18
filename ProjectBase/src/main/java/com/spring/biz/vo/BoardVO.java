package com.spring.biz.vo;

import java.util.List;

public class BoardVO {
	int boardNum;
	List<String> deleteBoardNumList; 
	int kindOfBoard;
	int kindCode;
	String kindName;
	String boardTitle;
	String boardContent;
	int viewCount;
	int originBoard;
	String createDate;
	String memberId;
	String isSecret;
	int replyCnt;
	int fileCnt;
	
	public BoardVO() {}
	public BoardVO(int kindOfBoard, String boardTitle, String boardContent, int originBoard, String memberId, String isSecret) {
		super();
		this.kindOfBoard = kindOfBoard;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.originBoard = originBoard;
		this.memberId = memberId;
		this.isSecret = isSecret;
	}

	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public List<String> getDeleteBoardNumList() {
		return deleteBoardNumList;
	}
	public void setDeleteBoardNumList(List<String> deleteBoardNumList) {
		this.deleteBoardNumList = deleteBoardNumList;
	}
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
	public int getKindCode() {
		return kindCode;
	}
	public void setKindCode(int kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getOriginBoard() {
		return originBoard;
	}
	public void setOriginBoard(int originBoard) {
		this.originBoard = originBoard;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getIsSecret() {
		return isSecret;
	}
	public void setIsSecret(String isSecret) {
		this.isSecret = isSecret;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", deleteBoardNumList=" + deleteBoardNumList + ", kindOfBoard="
				+ kindOfBoard + ", kindCode=" + kindCode + ", kindName=" + kindName + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", viewCount=" + viewCount + ", originBoard=" + originBoard
				+ ", createDate=" + createDate + ", memberId=" + memberId + ", isSecret=" + isSecret + ", replyCnt="
				+ replyCnt + ", fileCnt=" + fileCnt + "]";
	}
	
	
	
	
	
	

}
