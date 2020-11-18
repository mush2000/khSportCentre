<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/menu.css?ver=50">
<!-- smaple.js를 사용하기 위한 태그 -->
<script src="resources/js/menu.js?ver=46"></script>
</head>
<body>
<input type="hidden" id="menuMemId" value="${sessionScope.loginInfo.memberId }">
<input type="hidden" id="menuMemName" value="${sessionScope.loginInfo.memberName }">
<div class="col-md-12" style="background-color: #0034a9; height: 100px;">
	<div style="height: 23px;"></div>
	<div class="row">
		<div class="col-md-offset-2 titleNameDiv">
			<img class="titleName" style="width: 200px;" src="resources/images/logo2.png" onclick="location.href='mainPage.do';">
		</div>
		<div class="col-md-offset-10" style="position: relative; top: -60px;">
			<c:if test="${empty sessionScope.loginInfo.memberId }">
				<div class="col-md-12">
					<div class="col-md-8" style="font-family: 'S-CoreDream-4Regular';">
						<a href="loginPage.do" class="loginA">LOGIN</a>&nbsp;<font style="color: #ffcc00; font-family: 'S-CoreDream-4Regular';">│</font>&nbsp;<a href="joinPage.do" class="joinA">JOIN</a>
					</div>
				</div>
			</c:if>						
			<c:choose>
				<c:when test="${not empty sessionScope.loginInfo.memberId and sessionScope.loginInfo.instNum ne 0}">
					<div class="row" id="welcomeLogin" style="font-family: 'S-CoreDream-4Regular';">
						<span style="font-weight: bold; color: white;">${sessionScope.loginInfo.memberName }</span><span style="color: white;">님(강사) 반갑습니다.</span>
						<br>
						<input type="button" class="myInfoBtn" value="내정보관리" onclick="location.href='memberInformation.do';">
						<input type="button" class="logoutBtn" value="로그아웃" onclick="location.href='logout.do';">
					</div>
				</c:when>
				<c:otherwise>
					<c:if test="${not empty sessionScope.loginInfo.memberId }">
						<div class="row" style="font-family: 'S-CoreDream-4Regular';">
							<span style="font-weight: bold; color: white;">${sessionScope.loginInfo.memberName }</span><span style="color: white;">님 반갑습니다.</span>
							<br>
							<input type="button" class="myInfoBtn" value="내정보관리" onclick="location.href='memberInformation.do';">
							<input type="button" class="logoutBtn" value="로그아웃" onclick="location.href='logout.do';">
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="height: 10px;"></div>
</div>
<!-- <div class="col-md-12">
	<div class="col-md-offset-4 col-md-6 titleNameDiv">
		<img class="titleName" src="resources/images/title_name.png" onclick="location.href='mainPage.do';">
	</div>
</div>
<div style="height: 145px;"></div> -->
<div style="width:100%; font-size: 16px; font-family: 'S-CoreDream-5Medium';" class="col-md-12 text-center" align="center">
	<div style="height: 10px;"></div>
	<div class="dd">
		<a href="mainPage.do" class="db">MAIN</a>
	</div>
	<div class="dd">
		<a href="centerIntroPage.do?introTab=centerIntro" class="db">센터안내</a>
		<div class="dd-content">
			<a href="centerIntroPage.do?introTab=centerIntro">센터소개</a>
			<a href="centerIntroPage.do?introTab=centerInfo">시설현황</a>
			<a href="centerIntroPage.do?introTab=centerLoc">위치안내</a>
		</div>
	</div>
	<div class="dd">
		<a href="lectureInfo.do" class="db">강의안내</a>
		<div class="dd-content" id="lectureInfo">
			<a href="#">수영</a>
		</div>
	</div>
	<div class="dd">
		<a href="instList.do" class="db">강사안내</a>
		<div class="dd-content" id="instructorInfo">
			<a href="#">수영강사</a>
		</div>
	</div>
	<div class="dd">
		<a href="placeRentalIntroPage.do" class="db">대관안내</a>
		<div class="dd-content">
			<a href="placeRentalIntroPage.do">대관소개</a>
			<a href="placeRentalApplyPage.do">대관신청</a>
			<a href="placeRentalSchedulePage.do">대관일정</a>
		</div>
	</div>
	<div class="dd">
		<a href="board.do" class="db">커뮤니티</a>
		<div class="dd-content" id="boardKindInfo">
			<a href="placeRentalIntroPage.do">대관소개</a>
			<a href="placeRentalApplyPage.do">대관신청</a>
			<a href="placeRentalSchedulePage.do">대관일정</a>
		</div>
	</div>
	<c:if test="${sessionScope.loginInfo.memberId eq 'admin' }">
	<div class="dd">
		<a href="#" class="db" style="color: #ffcc00"><span class="glyphicon glyphicon-wrench"></span>&nbsp;관리자</a>
		<div class="dd-content">
			<a href="memberListManager.do">회원관리</a>
			<a href="adminB.do">강사관리</a>
			<a href="lectureListManager.do" class="subMenuA">강의관리</a>
			<a href="placeRentalManager.do" class="subMenuA">대관관리</a>
		</div>
	</div>
	</c:if>
	<div style="height: 10px;"></div>
</div>
</body>
</html>