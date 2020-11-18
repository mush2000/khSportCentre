<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/displayMemberId.css?ver=2"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div style="height: 50px;"></div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2" align="center">
			<div style="height: 30px;"></div>
			<img src="resources/images/searching.png" style="width: 200px;">
			<h1 id="contentsTitle" class="contentsTitle">
				아이디 <span style="color: #ffcc00; font-weight: bold;">찾기</span> 결과입니다.
			</h1>
			<h4>회원님의 아이디는 <strong>${memberId }</strong>입니다.</h4>
			<h4>개인정보보호를 위해 아이디의 일부만 표시됩니다.</h4>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 30px;"></div>
</div>
<div class="col-md-12">
	<div align="center">
		<input type="button" value="비밀번호찾기" id="searchPw" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
		<input type="button" value="로그인" id="login">
	</div>
</div>
<script src="resources/js/displayMemberId.js?ver=1"></script>
</body>
</html>