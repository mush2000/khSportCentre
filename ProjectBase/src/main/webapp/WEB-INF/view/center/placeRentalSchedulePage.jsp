<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 웹폰트 : 데이즈원체 -->
<link href="https://fonts.googleapis.com/css2?family=Days+One&display=swap" rel="stylesheet">

<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/placeRentalSchedulePage.css?ver=33"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 카카오맵API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=666fc1250fa79f4d0446a9ec36e1e03a"></script>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div class="contentsTitle1"></div>
			<div class="contentsTitle2">
				<h1 class="contentsTitle">휴일대관일정</h1>
			</div>
			<div style="height: 30px;"></div>
			<div>
				<img src="resources/images/calendar.png" style="width: 35px; margin-top: -15px;">
				<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;대관예약상황</span>
			</div>
			<div style="height: 15px;"></div>
			<!-- 달력 테이블 -->
			<table class="table calendarTable">
				<colgroup>
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
					<col class="col-xs-1.7">
				</colgroup>
				<tr id="mainBar">
					<td id="prevMonth" colspan="1"><input type="button" id="prevMonthBtn" style="background: url('resources/images/previous.png');"></td>
					<td id="yearMonth" colspan="5" style="vertical-align: middle;">
						<span id="calTopYear"></span>년&nbsp;<span id="calTopMonth"></span>월
					</td>
					<td id="nextMonth" colspan="1"><input type="button" id="nextMonthBtn"style="background: url('resources/images/next.png');"></td>
				</tr>
				<tr id="dayBar" data-holiday="${holiday }">
					<td class="title">일요일</td>
					<td class="title">월요일</td>
					<td class="title">화요일</td>
					<td class="title">수요일</td>
					<td class="title">목요일</td>
					<td class="title">금요일</td>
					<td class="title" style="border-right: none;">토요일</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- 대관시설목록 모달 -->
<div id="wrap">
	<div id="mask"></div>
	<div id="modalLayer">
		<div class="modalContent">
			<p class="title">시설 예약 상황</p>
			<span class="glyphicon glyphicon-remove close"></span>
			<div class="content" align="center">
				<table class="table table-bordered dataValue" style="padding: 5px;">
				</table>
				<br>
				<input type="button" value=">&emsp;대관신청 페이지로 이동" onclick="location.href='placeRentalApplyPage.do';">
			</div>
		</div>
	</div>
</div>

</body>
<script src="resources/js/placeRentalSchedulePage.js?ver=95"></script>
</html>