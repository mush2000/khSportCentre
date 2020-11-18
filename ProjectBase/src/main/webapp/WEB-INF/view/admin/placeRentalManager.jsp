<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 웹폰트 : 데이즈원체 -->
<link href="https://fonts.googleapis.com/css2?family=Days+One&display=swap" rel="stylesheet">

<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/placeRentalManager.css?ver=5"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="resources/js/placeRentalManager.js?ver=51"></script>

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
				<h1 class="contentsTitle">휴일대관관리</h1>
			</div>
		</div>
		<div class="col-md-offset-2 col-md-8">
			<div style="height: 30px;"></div>
			<div>
				<img src="resources/images/rent.png" style="width: 35px; margin-top: -15px;">
				<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;예약내역</span>
			</div>
			<div style="height: 15px;"></div>
			<!-- 검색창시작 -->
			<form action="placeRentalManager.do" method="post" class="form">
				<table class="searchTable">
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="30%">
						<col width="*">
						<col width="10%">
					</colgroup>
					<tr>
						<td colspan="4">
							<select name="searchKeyword" class="searchKeywordSelect" style="width: 120px; height: 28px; border-top-left-radius: 4px; border-bottom-left-radius: 4px;">
								<option value="1" selected disabled>검색조건</option>
								<option value="RENTAL_CODE" <c:if test="${searchVO.searchKeyword eq 'RENTAL_CODE' }">selected</c:if>>예약번호</option>
								<option value="RENTAL_MEMBER_ID" <c:if test="${searchVO.searchKeyword eq 'RENTAL_MEMBER_ID' }">selected</c:if>>예약자ID</option>
								<option value="PLACE_NAME" <c:if test="${searchVO.searchKeyword eq 'PLACE_NAME' }">selected</c:if>>대관장소</option>
							</select>
							&nbsp;<input style="width: 500px; height: 28px;" type="text" name="searchValue" id="searchValue" value="${searchVO.searchValue }">
						</td>
						<td rowspan="2" style="vertical-align: middle;">
							<input type="button" value="검색" style="height: 65px; width: 50px; padding: 0px; margin: 0px 0px 0px 5px;" id="searchBtn">
						</td>
						</tr>
					<tr>
						<td colspan="3" style="vertical-align: bottom;">
							<span style="font-weight: bold; color: #0034a9;">From.</span> <input type="date" style="height: 28px;" name="fromDate" value="${fromDate }">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-weight: bold; color: #0034a9;">To.</span> <input type="date" style="height: 28px;" name="toDate" value="${toDate }">
						</td>
						<td style="vertical-align: middle;">
							<span class="label label-danger">예약상태</span>&nbsp;&nbsp;
							<input type="radio" name="rentalApprovalYN" value="N" style="position: relative; top: 2.2px;" <c:if test="${searchVO.rentalApprovalYN eq 'N' or searchVO.rentalApprovalYN eq 'Y' or empty searchVO.rentalApprovalYN}">checked</c:if>>
								<span style="position: relative; top: 1.2px;">전체&nbsp;&nbsp;</span>
							<input type="radio" name="rentalApprovalYN" value="Y" style="position: relative; top: 2.2px;" <c:if test="${searchVO.rentalApprovalYN eq 'Y' }">checked</c:if>>
								<span style="position: relative; top: 1.2px;">예약완료</span>
						</td>
					</tr>
				</table>
			</form>			
			<!-- 검색창끝 -->
			<div style="height: 15px;"></div>
			<table class="table rentalManageTable">
				<colgroup>
					<col width="5%"></col>
					<col width="17%"></col>
					<col width="12%"></col>
					<col width="15%"></col>
					<col width="12%"></col>
					<col width="12%"></col>
					<col width="12%"></col>
					<col width="*"></col>
				</colgroup>
				<tr>
					<td class="title" style="border-right: 1px solid #ddd;">
						<input type="checkbox" checked id="checkAll">
					</td>
					<td class="title" style="border-right: 1px solid #ddd;">예약번호</td>
					<td class="title" style="border-right: 1px solid #ddd;">대관일</td>
					<td class="title" style="border-right: 1px solid #ddd;">대관시간</td>
					<td class="title" style="border-right: 1px solid #ddd;">대관장소</td>
					<td class="title" style="border-right: 1px solid #ddd;">예약자아이디</td>
					<td class="title" style="border-right: 1px solid #ddd;">예약자이름</td>
					<td class="title">예약상태</td>
				</tr>
				<c:forEach items="${selectRentalList }" var="rentalInfo">
					<tr onmouseover="this.style.background='#FAFAFA';" onmouseleave="this.style.background='white';">
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							<c:choose>
								<c:when test="${rentalInfo.rentalApprovalYN eq 'N' }">
									<input type="checkbox" checked class="chk" value="${rentalInfo.rentalCode }">
								</c:when>
								<c:when test="${rentalInfo.rentalApprovalYN eq 'Y' }">
									<input type="checkbox" disabled class="noChk" value="${rentalInfo.rentalCode }">
								</c:when>
							</c:choose>
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							${rentalInfo.rentalCode }
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							${rentalInfo.rentalDate }
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							<c:choose>
								<c:when test="${rentalInfo.rentalTime eq 'A'}">오전(08:00 ~ 13:00)</c:when>
								<c:when test="${rentalInfo.rentalTime eq 'P'}">오후(14:00 ~ 19:00)</c:when>
								<c:otherwise>종일(08:00 ~ 18:00)</c:otherwise>
							</c:choose>
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							${rentalInfo.placeName }
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							${rentalInfo.rentalMemberId }
						</td>
						<td style="vertical-align:middle; text-align: center; border-right: 1px solid #ddd;">
							${rentalInfo.rentalMemberName }
						</td>
						<td style="vertical-align:middle; text-align: center;">
							<div class="row text-center">
							<c:choose>
								<c:when test="${rentalInfo.rentalApprovalYN eq 'N' }">
									<input type="button" class="approvalBtn" style="width: 70px; padding: 0px; margin: 0px;" value="예약승인" data-approvalCode="${rentalInfo.rentalCode }">
									&nbsp;
									<input type="button" class="cancelBtn" style="width: 70px; padding: 0px; margin: 0px; background-color: red; border: 1px solid red;" value="예약취소" data-cancelCode="${rentalInfo.rentalCode }">
								</c:when>
								<c:otherwise>
									<span style="color: blue; font-weight: bold;">예약완료</span>
								</c:otherwise>
							</c:choose>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div style="height: 20px;"></div>
			<div align="center">
				<input type="button" id="selectApproval" value="선택예약승인">
				&nbsp;
				<input type="button" id="selectCancel" style="background-color: red; border: 1px solid red;" value="선택예약취소">			
			</div>
		</div>
	</div>
</div>
</body>
</html>