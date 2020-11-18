<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/registerPage.css?ver=1"/>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">수강신청</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<table class="table registerTable">
			<colgroup>
				<col width="20%"></col>
				<col width="30%"></col>
				<col width="20%"></col>
				<col width="30%"></col>
			</colgroup>
			<tr>
				<td class="title">종목</td>
				<td>${registerInfo.classesName }</td>
				<td class="title">수강료</td>
				<td><fmt:formatNumber value="${registerInfo.classesFee }" type="currency"/></td>
			</tr>
			<tr>
				<td class="title">시간</td>
				<td>${registerInfo.classTime }</td>
				<td class="title">장소</td>
				<td>${registerInfo.placeName }</td>
			</tr>
			<tr>
				<td class="title">레벨</td>
				<td>${registerInfo.levelName }</td>
				<td class="title">요일</td>
				<td>${registerInfo.classDay }</td>
			</tr>
			<tr>
				<td class="title">강사</td>
				<td>${registerInfo.memberName }</td>
				<td class="title">강의진행월</td>
				<td>${registerInfo.classDate }</td>
			</tr>
			<tr>
				<td class="title">신청인원</td>
				<td colspan="3">${registerInfo.regMemberCnt } ( 최소인원 : ${registerInfo.minMember } , 최대인원 : ${registerInfo.maxMember } )</td>
			</tr>
		</table>
		<div style="height: 10px;"></div>
		<div align="center">
			<input type="button" value="뒤로가기" onclick="history.back()" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
			&nbsp;
			<input type="button" value="수강신청" id="regClass" data-classNum="${registerInfo.classNum }">
		</div>
	</div>
</div>
<script src="resources/js/registerPage.js?ver=1"></script>
</body>
</html>