<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/joinSuccess.css?ver=3"/>
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
			<img src="resources/images/joinChecked.png" style="width: 200px;">
			<h1 id="contentsTitle" class="contentsTitle">
				회원가입이 <span style="color: #ffcc00; font-weight: bold;">완료</span> 되었습니다.
			</h1>
			<h4>울산KH스포츠센터에 오신 것을 환영합니다.</h4>
			<h4>로그인 후 다양한 서비스를 이용하실 수 있습니다.</h4>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 30px;"></div>
</div>
<div class="col-md-12">
	<div align="center">
		<input type="button" value="메인으로" onclick="location.href='mainPage.do';" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
		<input type="button" value="로그인" onclick="location.href='loginPage.do';">
	</div>
</div>
</body>
</html>