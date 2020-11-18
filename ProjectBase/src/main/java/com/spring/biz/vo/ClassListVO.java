package com.spring.biz.vo;

public class ClassListVO {
	private int classListNum;
	private int classNum;
	private String memberId;
	private String regDate;
	
	public int getClassListNum() {
		return classListNum;
	}
	public void setClassListNum(int classListNum) {
		this.classListNum = classListNum;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ClassListVO [classListNum=" + classListNum + ", classNum=" + classNum + ", memberId=" + memberId
				+ ", regDate=" + regDate + "]";
	}
	

}
