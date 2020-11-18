<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/menu.css?ver=43">
<!-- smaple.js를 사용하기 위한 태그 -->
<script src="resources/js/menu.js?ver=44"></script>
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
<div style="width:100%; height:100%;" class="col-md-12 text-center" align="center">
	<div style="height: 10px;"></div>
	<nav style="font-size: 16px; font-family: 'S-CoreDream-5Medium';">
		<ul class="mainMenu" style="margin-bottom: 8px; text-align: center;">
			<li>
				<a href="mainPage.do" class="mainMenuA">MAIN</a>
			</li>&emsp;&emsp;&emsp;&emsp;
			<li>
				<a href="centerIntroPage.do?introTab=centerIntro" class="mainMenuA">센터안내</a>
				<ul class="subMenu">
					<li><a href="centerIntroPage.do?introTab=centerIntro" class="subMenuA">센터소개</a></li>
					<li><a href="centerIntroPage.do?introTab=centerInfo" class="subMenuA">시설현황</a></li>
					<li><a href="centerIntroPage.do?introTab=centerLoc" class="subMenuA">위치안내</a></li>
				</ul>	
			</li>&emsp;&emsp;&emsp;&emsp;
			<li>
				<a href="lectureInfo.do" class="mainMenuA">강의안내</a>
				<ul class="subMenu" id="lectureInfo">
					<li><a href="swimmingLectureInfo.do" class="subMenuA">수영</a></li>
				</ul>
			</li>&emsp;&emsp;&emsp;&emsp;
			<li>
				<a href="instList.do" class="mainMenuA">강사안내</a>
				<ul class="subMenu" id="instructorInfo">
				</ul>
			</li>&emsp;&emsp;&emsp;&emsp;
			<li>
				<a href="placeRentalIntroPage.do" class="mainMenuA">대관안내</a>
				<ul class="subMenu">
					<li><a href="placeRentalIntroPage.do" class="subMenuA">대관소개</a></li>
					<li><a href="placeRentalApplyPage.do" class="subMenuA">대관신청</a></li>
					<li><a href="placeRentalSchedulePage.do" class="subMenuA">대관일정</a></li>
				</ul>	
			</li>&emsp;&emsp;&emsp;&emsp;
			<li>
				<a href="board.do" class="mainMenuA">커뮤니티</a>
				<ul class="subMenu" id="boardKindInfo">
				</ul>	
			</li>&emsp;&emsp;&emsp;&emsp;
			<%-- <c:if test="${sessionScope.loginInfo.memberId eq 'admin' }"> --%>
				<li>
					<a href="#" class="mainMenuA" style="color: #ffcc00"><span class="glyphicon glyphicon-wrench"></span>&nbsp;관리자</a>
					<ul class="subMenu">
						<li><a href="memberListManager.do" class="subMenuA">회원관리</a></li>
						<li><a href="adminB.do" class="subMenuA">강사관리</a></li>
						<li><a href="lectureListManager.do" class="subMenuA">강의관리</a></li>
						<li><a href="placeRentalManager.do" class="subMenuA">대관관리</a></li>
						<li><a href="adminE.do" class="subMenuA">게시판관리</a></li>
					</ul>	
				</li>
			<%-- </c:if> --%>
		</ul>
	</nav>
	<div style="height: 2px;"></div>
</div>
</body>
</html>