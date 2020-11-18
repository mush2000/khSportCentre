package com.spring.biz.vo;

public class ClassLevelVO {
	private int levelCode;
	private int classesCode;
	private String levelName;
	private String levelDetail;
	
	
	public int getLevelCode() {
		return levelCode;
	}
	public void setLevelCode(int levelCode) {
		this.levelCode = levelCode;
	}
	public int getClassesCode() {
		return classesCode;
	}
	public void setClassesCode(int classesCode) {
		this.classesCode = classesCode;
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
	@Override
	public String toString() {
		return "ClassLevelVO [levelCode=" + levelCode + ", classesCode=" + classesCode + ", levelName=" + levelName
				+ ", levelDetail=" + levelDetail + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
