<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/registerClassList.css?ver=1"/>

<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
}
.choiceAddr, .pageNum:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">수강신청정보</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<c:forEach items="${thisMonthRegClassList }" var="list">
			<table class="table registerClassListTable">
				<colgroup>
					<col width="15%"></col>
					<col width="35%"></col>
					<col width="15%"></col>
					<col width="35%"></col>
				</colgroup>
				<tr>
					<td class="title">종목</td>
					<td>
						${list.classesName }
					</td>
					<td class="title">요일</td>
					<td>${list.classDay }</td>
				</tr>
				<tr>
					<td class="title">시간</td>
					<td >${list.classTime }시</td>
					<td class="title">수준</td>
					<td>${list.levelName }</td>
				</tr>
				<tr>
					<td class="title">강사</td>
					<td>${list.memberName }</td>
					<td class="title">장소</td>
					<td>${list.placeName }</td>
				</tr>
				<tr>
					<td class="title">강습진행월</td>
					<td>${list.classDate }</td>
					<td class="title">신청인원</td>
					<td>${list.regMemberCnt }명</td>
				</tr>
			</table>
			<div style="height: 10px;"></div>
		</c:forEach>
		<c:forEach items="${nextMonthRegClassList }" var="list">
			<table class="table registerClassListTable">
				<colgroup>
					<col width="15%"></col>
					<col width="35%"></col>
					<col width="15%"></col>
					<col width="35%"></col>
				</colgroup>
				<tr>
					<td class="title">종목</td>
					<td>
						${list.classesName }
						&emsp;
						<input type="button" value="수강취소" class="cancelClassBtn" data-regClassNum="${list.regClassNum }" data-listSize="${nextMonthRegClassList.size() }">
					</td>
					<td class="title">요일</td>
					<td>${list.classDay }</td>
				</tr>
				<tr>
					<td class="title">시간</td>
					<td >${list.classTime }시</td>
					<td class="title">수준</td>
					<td>${list.levelName }</td>
				</tr>
				<tr>
					<td class="title">강사</td>
					<td>${list.memberName }</td>
					<td class="title">장소</td>
					<td>${list.placeName }</td>
				</tr>
				<tr>
					<td class="title">강습진행월</td>
					<td>${list.classDate }</td>
					<td class="title">신청인원</td>
					<td>${list.regMemberCnt }명</td>
				</tr>
			</table>
			<div style="height: 10px;"></div>
		</c:forEach>
		<div style="height: 5px;"></div>
		<div align="center">
			<!-- <input type="button" value="내정보관리" id="myInfoBtn"> -->
			<input type="button" value="뒤로가기" onclick="history.back();" style="background: #ffcc00; border: 1px solid #ffcc00;">
			<input type="button" value="메인으로" id="goHomeBtn">
		</div>	
	</div>
</div>
<script src="resources/js/registerClassList.js?ver=3"></script>
</body>
</html>