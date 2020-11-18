<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/placeRentalApplyPage.css?ver=26"/>

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
				<h1 id="contentsTitle" class="contentsTitle">휴일대관신청</h1>
			</div>
		</div>
		<div class="col-md-12" style="height: 30px;"></div>
		<div class="col-md-offset-2 col-md-9">
			<span style="font-family: 'S-CoreDream-5Medium';">
				&emsp;&emsp;* 평일은 강의를 위해 주말과 공휴일만 대관을 진행 합니다.
				<br>
				&emsp;&emsp;* 이미 지난 날짜와 당일은 예약이 불가능하므로 유의 바랍니다.
			</span>
		</div>
		<div class="col-md-offset-2 col-md-10">
			<div style="height: 30px;"></div>
			<div class="bookingBox col-md-12" align="center">
				<div class="step1" style="border-bottom: 1px solid #ddd;">
					<div class="step1titleDiv">
						<h3>Step1. 날짜선택</h3>
					</div>
					<div class="step1contentDiv">
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
								<td class="title">일</td>
								<td class="title">월</td>
								<td class="title">화</td>
								<td class="title">수</td>
								<td class="title">목</td>
								<td class="title">금</td>
								<td class="title" style="border-right: none;">토</td>
							</tr>
						</table>
					</div>
				</div>		
				<div class="step2">
					<div class="step2titleDiv" style="background: url('resources/images/next-arrow1.png') no-repeat #0244D9;">
						<h3>Step2. 시설선택</h3>
					</div>
					<!-- 스크롤바 시작-->		
					<div class="one" style="background: white; margin: 0px; padding: 0; overflow: auto;">
						<div class="two" style="background: white; margin: 0px; padding: 0; overflow: auto;">
							<div class="step2contentDiv" align="left">
								<div>예약하실 날짜를 선택해주세요.</div>
							</div>
							<div class="cover-bar">
							</div>
						</div>
					</div>
					<!-- 스크롤바 끝 -->
				</div>
				<div class="step3">
					<div class="step3titleDiv" style="background: url('resources/images/next-arrow2.png') no-repeat #145CFF;">
						<h3>Step3. 시간선택</h3>
					</div>
					<div class="step3contentDiv">
						<div>예약하실 날짜와 시설을 선택해주세요.</div>
					</div>
				</div>	
			</div>		
		</div>
		<div class="col-md-offset-3 col-md-6">
			<div style="height: 30px;"></div>
			<div class="btnDiv" align="center">
				<input id="reloadBtn" type="button" value="다시선택하기">
				<input id="reserveBtn" type="button" value="선택예약하기">
				<input type="hidden" value="${sessionScope.loginInfo.memberId }" id="memberId">
			</div>
		</div>
	</div>
</div>
<script src="resources/js/placeRentalApplyPage.js?ver=118"></script>
</body>
</html>