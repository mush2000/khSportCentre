package com.spring.biz.vo;

public class SurveyVO {
	private int surveyNum;
	private int classNum;
	private int teachingSkill;
	private int classProgress;
	private int instKindness;
	private String opinion;
	private String memberId;
	private String classesName;
	private String classTime;
	private String classDate;
	private String levelName;
	
	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getTeachingSkill() {
		return teachingSkill;
	}
	public void setTeachingSkill(int teachingSkill) {
		this.teachingSkill = teachingSkill;
	}
	public int getClassProgress() {
		return classProgress;
	}
	public void setClassProgress(int classProgress) {
		this.classProgress = classProgress;
	}
	public int getInstKindness() {
		return instKindness;
	}
	public void setInstKindness(int instKindness) {
		this.instKindness = instKindness;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getClassesName() {
		return classesName;
	}
	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	
	@Override
	public String toString() {
		return "SurveyVO [surveyNum=" + surveyNum + ", classNum=" + classNum + ", teachingSkill=" + teachingSkill
				+ ", classProgress=" + classProgress + ", instKindness=" + instKindness + ", opinion=" + opinion
				+ ", memberId=" + memberId + ", classesName=" + classesName + ", classTime=" + classTime
				+ ", classDate=" + classDate + ", levelName=" + levelName + "]";
	}
	
	
}
