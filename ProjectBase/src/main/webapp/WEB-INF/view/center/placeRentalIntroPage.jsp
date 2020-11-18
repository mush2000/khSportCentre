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
<link rel="stylesheet" type="text/css" href="resources/css/placeRentalIntroPage.css?ver=6"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script src="resources/js/placeRentalIntroPage.js?ver=12"></script> -->

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
				<h1 class="contentsTitle">휴일대관안내</h1>
			</div>
			<div style="height: 30px;"></div>
			<div>
				<img src="resources/images/rent.png" style="width: 35px; margin-top: -15px;">
				<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;대관정보</span>
			</div>
			<div style="height: 15px;"></div>
			<!-- 대관이용요금 테이블 -->
			<table class="table rentalInfoTable">
				<colgroup>
					<col class="col-xs-4">
					<col class="col-xs-4">
					<col class="col-xs-4">
				</colgroup>
				<tr>
					<td class="title" style="border-right: 1px solid #ddd;">시설명</td>
					<td class="title" style="border-right: 1px solid #ddd;">종일 시설이용료</td>
					<td class="title">반나절 시설이용료(오전/오후)</td>
				</tr>
				<c:forEach items="${classPlaceList }" var="classPlace">
					<tr>
						<td style="text-align: center; border-right: 1px solid #ddd;">${classPlace.placeName }</td>
						<td style="text-align: center; border-right: 1px solid #ddd;"><fmt:formatNumber value="${classPlace.rentalAlltimeCharge }" type="currency"/></td>
						<td style="text-align: center;"><fmt:formatNumber value="${classPlace.rentalHalftimeCharge}" type="currency"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" style="text-align: center;">각종 대관 및 클럽 등 자세한 협의 문의처 :  052-200-0000</td>
				</tr>
			</table>
			<div style="height: 50px;"></div>
			<div>
				<img src="resources/images/rent.png" style="width: 35px; margin-top: -15px;">
				<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;환불유의사항</span>
			</div>
			<div style="height: 30px;"></div>
			<!-- 대관유의사항 테이블 -->
			<table class="table rentalInfoTable">
				<colgroup>
					<col class="col-xs-3">
					<col class="col-xs-3">
					<col class="col-xs-6">
				</colgroup>
				<tr>
					<td class="title" style="border-right: 1px solid #dddddd;">환불규정</td>
					<td class="title" style="border-right: 1px solid #dddddd;">환불금액</td>
					<td class="title">비고</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #dddddd; text-align: center;">20일 전 취소</td>
					<td style="border-right: 1px solid #dddddd; text-align: center;">전액환불</td>
					<td rowspan="4" style="vertical-align: middle;">
						계약 후 3일이내(주말제외) 계약금 미 지불시 대관 취소로 간주<br>
						행사일에 발생한 추가 요금은 행사 후 3일 이내 지불<br>
						환불금은 온라인에서 결제하신 카드 본 센터(오프라인) 지참 후 취소 적용<br>
						(카드 환불은 카드사에 따라 주말제외 최대 7일 소요)<br>
					</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #dddddd; text-align: center;">10~19일 전 취소</td>
					<td style="border-right: 1px solid #dddddd; text-align: center;">80% 환불</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #dddddd; text-align: center;">1~9일 전 취소</td>
					<td style="border-right: 1px solid #dddddd; text-align: center;">50% 환불</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #dddddd; text-align: center;">당일 취소</td>
					<td style="border-right: 1px solid #dddddd; text-align: center;">전액환불</td>
				</tr>
			</table>
		</div>
	</div>
</div>	
</body>
</html>