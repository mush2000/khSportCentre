package com.spring.biz.vo;

public class SearchClassVO {
	private String classesName;
	private int classesFee;
	private String placeName;
	private int classesCode;
	private String classDay;
	private int placeCode;
	private int classDayCode;
	private int classNum;
	private String classDate;
	private String classStartDate;
	private int maxMember;
	private int regMemberCnt;
	private int minMember;
	private String classApplyStart;
	private String classApplyEnd;
	public String getClassesName() {
		return classesName;
	}
	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}
	public int getClassesFee() {
		return classesFee;
	}
	public void setClassesFee(int classesFee) {
		this.classesFee = classesFee;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public int getClassesCode() {
		return classesCode;
	}
	public void setClassesCode(int classesCode) {
		this.classesCode = classesCode;
	}
	public String getClassDay() {
		return classDay;
	}
	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public int getClassDayCode() {
		return classDayCode;
	}
	public void setClassDayCode(int classDayCode) {
		this.classDayCode = classDayCode;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public String getClassStartDate() {
		return classStartDate;
	}
	public void setClassStartDate(String classStartDate) {
		this.classStartDate = classStartDate;
	}
	public int getMaxMember() {
		return maxMember;
	}
	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}
	public int getRegMemberCnt() {
		return regMemberCnt;
	}
	public void setRegMemberCnt(int regMemberCnt) {
		this.regMemberCnt = regMemberCnt;
	}
	public int getMinMember() {
		return minMember;
	}
	public void setMinMember(int minMember) {
		this.minMember = minMember;
	}
	public String getClassApplyStart() {
		return classApplyStart;
	}
	public void setClassApplyStart(String classApplyStart) {
		this.classApplyStart = classApplyStart;
	}
	public String getClassApplyEnd() {
		return classApplyEnd;
	}
	public void setClassApplyEnd(String classApplyEnd) {
		this.classApplyEnd = classApplyEnd;
	}
	@Override
	public String toString() {
		return "SearchClassVO [classesName=" + classesName + ", classesFee=" + classesFee + ", placeName=" + placeName
				+ ", classesCode=" + classesCode + ", classDay=" + classDay + ", placeCode=" + placeCode
				+ ", classDayCode=" + classDayCode + ", classNum=" + classNum + ", classDate=" + classDate
				+ ", classStartDate=" + classStartDate + ", maxMember=" + maxMember + ", regMemberCnt=" + regMemberCnt
				+ ", minMember=" + minMember + ", classApplyStart=" + classApplyStart + ", classApplyEnd="
				+ classApplyEnd + "]";
	}
	
	
}
