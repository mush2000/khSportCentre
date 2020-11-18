package com.spring.biz.vo;

import java.util.List;

public class ClassesVO implements Cloneable{
	private int classesCode;
    private String classesName;
    private int classesFee;
    private String classesDetail;
    private List<String> classesPic;
    private int minMember;
    private int maxMember;
    private int frontPlaceCode;
    private int frontDayCode;
    
	
	public int getFrontDayCode() {
		return frontDayCode;
	}
	public void setFrontDayCode(int frontDayCode) {
		this.frontDayCode = frontDayCode;
	}
	public int getFrontPlaceCode() {
		return frontPlaceCode;
	}
	public void setFrontPlaceCode(int frontPlaceCode) {
		this.frontPlaceCode = frontPlaceCode;
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
	public int getClassesFee() {
		return classesFee;
	}
	public void setClassesFee(int classesFee) {
		this.classesFee = classesFee;
	}
	public String getClassesDetail() {
		return classesDetail;
	}
	public void setClassesDetail(String classesDetail) {
		this.classesDetail = classesDetail;
	}
	public List<String> getClassesPic() {
		return classesPic;
	}
	public void setClassesPic(List<String> classesPic) {
		this.classesPic = classesPic;
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
	@Override
	public String toString() {
		return "ClassesVO [classesCode=" + classesCode + ", classesName=" + classesName + ", classesFee=" + classesFee
				+ ", classesDetail=" + classesDetail + ", classesPic=" + classesPic + ", minMember=" + minMember
				+ ", maxMember=" + maxMember + ", frontPlaceCode=" + frontPlaceCode + ", frontDayCode=" + frontDayCode
				+ "]";
	}
	
	public Object clone() {
		Object obj = null;
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) { }
		
		return obj;
	}
	
}
