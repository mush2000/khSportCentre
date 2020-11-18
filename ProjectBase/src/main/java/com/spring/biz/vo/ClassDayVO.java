package com.spring.biz.vo;

public class ClassDayVO {
	
	private int classDayCode;
	private String classDay;
	
	
	public int getClassDayCode() {
		return classDayCode;
	}
	public void setClassDayCode(int classDayCode) {
		this.classDayCode = classDayCode;
	}
	public String getClassDay() {
		return classDay;
	}
	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}
	@Override
	public String toString() {
		return "ClassDayVO [classDayCode=" + classDayCode + ", classDay=" + classDay + "]";
	}
	

}
