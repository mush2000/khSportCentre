<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/loginMember.css?ver=14"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/inko@1.1.1/inko.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
<div align="center">
	<div style="height: 100px;"></div>
	<div>
		<img src="resources/images/logo3.png" style="width: 150px;">
	</div>
	<div style="height: 30px;"></div>
	<form action="loginMember.do" id="loginForm" method="post">
		<input type="text" name="memberId" id="memberId" placeholder="User ID" autocomplete="off">
		<div style="height: 10px; text-align: left; color: red;" id="idDiv"></div>
		<div></div>
		<input type="password" name="memberPw" id="inputPassword" placeholder="Password" data-toggle="popover" title="<Caps Lock>이 켜져있습니다." data-placement="right">
		<div style="height: 10px; text-align: left; color: red;" id="pwDiv"></div>
		<div></div>
		<input type="submit" id="submitBtn" value="로그인">
		<input type="button" class="joinBtn" value="회원가입" onclick="location.href='joinPage.do';">
	</form>
	<div style="height: 10px;"></div>
	<span id="searchPw" style="color: gray;">비밀번호찾기</span>&nbsp;│&nbsp;<span id="searchId" style="color: gray;">아이디찾기</span>
</div>
<div style="height: 40px;"></div>
<div class="col-md-12">
	<div class="col-md-offset-4">
		<ul class="common" style="position: relative; left: 110px; font-size: 14px;">
			<li style="padding: 5px;"><span style="color: #ffcc00;">●</span><span style="color: gray;"> 회원으로 <strong>로그인</strong> 하시면 다양한 서비스를 편리하게 이용하실 수 있습니다.</span></li>
			<li style="padding: 5px;"><span style="color: #0034A9;">●</span><span style="color: gray;"> 온라인 수강신청은 <strong>회원</strong>에 한하여 이용가능합니다.</span></li>
			<li style="padding: 5px;"><span style="color: #ffcc00;">●</span><span style="color: gray;"> 온라인 수강신청을 원하시는 분께서는 <strong>회원가입</strong>을 하신 후 이용바랍니다.</span></li>
		</ul>
	</div>
</div>
<script src="resources/js/loginMember.js?ver=1"></script>
</body>
</html>