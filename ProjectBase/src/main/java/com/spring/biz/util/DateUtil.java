package com.spring.biz.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
	//현재 날짜 가져오는 메소드 (yyyy-MM-dd)
	public static String getNowDate() {
		//현재시간 세팅
		Calendar cal = Calendar.getInstance();
		//현재시간 가져오기 : cal.getTime();
		
		//시간 데이터의 포맷을 설정해주는 객체 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//현재날짜
		String toDate = dateFormat.format(cal.getTime());
		
		return toDate;
	}
	
	//두달 후 날짜 가져오는 메소드 (yyyy-MM-dd)
	public static String getBeforeDate() {
		//현재시간 세팅
		Calendar cal = Calendar.getInstance();
		//현재시간 가져오기 : cal.getTime();
		
		//시간 데이터의 포맷을 설정해주는 객체 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//두달 후 날짜
		cal.add(Calendar.MONTH, 2);
		String fromDate = dateFormat.format(cal.getTime());
		
		return fromDate;
	}
}
