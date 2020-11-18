package com.spring.biz.vo;

public class ClassInfoVO {
	//CLASS_INFO 테이블
	private int classNum; 
	private int classesCode; 
	private String classTime; 
	private int classLv; 
	private String classDate; 
	private int locCode; 
	private int instNum; 
	private int regMemberCnt; 
	private int classInfoDayCode;
	private int classApplyStart;
	private int classApplyEnd;

	//CLASSES 테이블
	private String classesName;
	private int classesFee;
	private int minMember;
	private int maxMember;
	//CLASS_LEVEL 테이블
	private int levelCode;
	private String levelName;
	private String levelDetail;
	//CLASS_DAY 테이블
	private String classDay;
	private int classDayCode;
	//CLASS_TIME 테이블
	private int timeCode;
	//CLASS_PLACE 테이블
	private int placeCode;
	private String placeName;
	//INSTRUCTOR_INFO 테이블
	private String memberId;
	//MEMBER_INFO 테이블
	private String memberName;
	//SURVEY 테이블
	private int surveyNum;
	//REGISTER_CLASS
	private int regClassNum;
	
	public ClassInfoVO() {}
	public ClassInfoVO(int classesCode, String classTime, int classLv, String classDate, int instNum, int classDayCode, int placeCode) {
		super();
		this.classesCode = classesCode;
		this.classTime = classTime;
		this.classLv = classLv;
		this.classDate = classDate;
		this.instNum = instNum;
		this.classDayCode = classDayCode;
		this.placeCode = placeCode;
	}

	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getClassesCode() {
		return classesCode;
	}
	public void setClassesCode(int classesCode) {
		this.classesCode = classesCode;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public int getClassLv() {
		return classLv;
	}
	public void setClassLv(int classLv) {
		this.classLv = classLv;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public int getLocCode() {
		return locCode;
	}
	public void setLocCode(int locCode) {
		this.locCode = locCode;
	}
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public int getRegMemberCnt() {
		return regMemberCnt;
	}
	public void setRegMemberCnt(int regMemberCnt) {
		this.regMemberCnt = regMemberCnt;
	}
	public int getClassInfoDayCode() {
		return classInfoDayCode;
	}
	public void setClassInfoDayCode(int classInfoDayCode) {
		this.classInfoDayCode = classInfoDayCode;
	}
	public int getClassApplyStart() {
		return classApplyStart;
	}
	public void setClassApplyStart(int classApplyStart) {
		this.classApplyStart = classApplyStart;
	}
	public int getClassApplyEnd() {
		return classApplyEnd;
	}
	public void setClassApplyEnd(int classApplyEnd) {
		this.classApplyEnd = classApplyEnd;
	}
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
	public int getMinMember() {
		return minMember;
	}
	public void setMinMember(int minMember) {
		this.minMember = minMember;
	}
	public int getMaxMember() {
		return maxMember;
	}
	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}
	public int getLevelCode() {
		return levelCode;
	}
	public void setLevelCode(int levelCode) {
		this.levelCode = levelCode;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public String getLevelDetail() {
		return levelDetail;
	}
	public void setLevelDetail(String levelDetail) {
		this.levelDetail = levelDetail;
	}
	public String getClassDay() {
		return classDay;
	}
	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}
	public int getClassDayCode() {
		return classDayCode;
	}
	public void setClassDayCode(int classDayCode) {
		this.classDayCode = classDayCode;
	}
	public int getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(int timeCode) {
		this.timeCode = timeCode;
	}
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
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
	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public int getRegClassNum() {
		return regClassNum;
	}
	public void setRegClassNum(int regClassNum) {
		this.regClassNum = regClassNum;
	}
	
	@Override
	public String toString() {
		return "ClassInfoVO [classNum=" + classNum + ", classesCode=" + classesCode + ", classTime=" + classTime
				+ ", classLv=" + classLv + ", classDate=" + classDate + ", locCode=" + locCode + ", instNum=" + instNum
				+ ", regMemberCnt=" + regMemberCnt + ", classInfoDayCode=" + classInfoDayCode + ", classApplyStart="
				+ classApplyStart + ", classApplyEnd=" + classApplyEnd + ", classesName=" + classesName
				+ ", classesFee=" + classesFee + ", minMember=" + minMember + ", maxMember=" + maxMember
				+ ", levelCode=" + levelCode + ", levelName=" + levelName + ", levelDetail=" + levelDetail
				+ ", classDay=" + classDay + ", classDayCode=" + classDayCode + ", timeCode=" + timeCode
				+ ", placeCode=" + placeCode + ", placeName=" + placeName + ", memberId=" + memberId + ", memberName="
				+ memberName + ", surveyNum=" + surveyNum + ", regClassNum=" + regClassNum + "]";
	}
	
	
}
