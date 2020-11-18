package com.spring.biz.vo;

public class InstructorInfoVO {
	private int instNum;
	private String memberId;
	private String memberName;
	private String memberGender;
	private String regNum;
	private String career;
	private String license;
	private String memberTel;
	private String picture;
	private int classesCode;
	private String classesName;
	private String instDel;
	
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getRegNum() {
		return regNum;
	}
	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getClassesCode() {
		return classesCode;
	}
	public void setClassesCode(int classesCode) {
		this.classesCode = classesCode;
	}
	public String getClassesName() {
		return classesName;
	}
	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}
	public String getInstDel() {
		return instDel;
	}
	public void setInstDel(String instDel) {
		this.instDel = instDel;
	}
	
	@Override
	public String toString() {
		return "InstructorInfoVO [instNum=" + instNum + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberGender=" + memberGender + ", regNum=" + regNum + ", career=" + career + ", license="
				+ license + ", memberTel=" + memberTel + ", picture=" + picture + ", classesCode=" + classesCode
				+ ", classesName=" + classesName + ", instDel=" + instDel + "]";
	}
	
	
}
