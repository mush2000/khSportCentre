<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/searchPw.css?ver=2"/>
<!-- Jquey를 사용을 위한 태그 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle !important;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">비밀번호 찾기</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-4 col-md-4">
			<form action="searchPw.do" method="post" id="searchPwForm">
				<div align="center">
					<table class="table searchPwTable">
						<colgroup>
							<col width="20%"></col>
							<col width="*"></col>
						</colgroup>
						<tr>
							<td class="title">아이디</td>
							<td><input type="text" name="memberId" id="memberId" autocomplete="off"></td>
						</tr>
						<tr>
							<td class="title">이름</td>
							<td><input type="text" name="memberName" id="memberName" autocomplete="off"></td>
						</tr>
						<tr>
							<td class="title">이메일</td>
							<td>
								<input type="hidden" name="memberEmail" id="memberEmail">
								<input type="text" name="memberEmailId" id="memberEmail1" style="width: 150px;" autocomplete="off">
								&nbsp;@&nbsp;
								<input type="text" name="memberEmailUri" id="memberEmail2" style="width: 150px;" autocomplete="off">
								&nbsp;
								<select id="emailUri" style="width: 100px;">
									<option value="inputUri" selected>직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="nate.com">네이트</option>
									<option value="gmail.com">구글</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div align="center">
					<input type="submit" id="submitBtn" value="비밀번호 찾기">
				</div>
			</form>
		</div>
	</div>
</div>
<div style="height: 10px;"></div>
<div align="center">
	<span id="searchId" style="color: gray;">아이디찾기</span>&nbsp;│&nbsp;<span id="login" style="color: gray;">로그인</span>
</div>
<script src="resources/js/searchPw.js?ver=6"></script>
</body>
</html>