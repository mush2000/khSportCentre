package com.spring.biz.vo;

public class FileVO {
	
	private int fileNum;
	private int boardNum;
	private String originFileName;
	private String storedFileName;
	private String fileSize;
	private String delYn;
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	@Override
	public String toString() {
		return "FileVO [fileNum=" + fileNum + ", boardNum=" + boardNum + ", originFileName=" + originFileName
				+ ", storedFileName=" + storedFileName + ", fileSize=" + fileSize + ", delYn=" + delYn + "]";
	}
	
	

}
