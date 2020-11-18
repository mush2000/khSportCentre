<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/joinMember.css?ver=3"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle;
}
.addrTable > tbody > tr{
	padding: 5px;
	border: none;
}
.addrTable > tbody > tr > td{
	padding: 5px;
	vertical-align: middle;
	border: none;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">회원가입</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<form action="insertMember.do" id="joinForm" method="post">
			<div align="center">
				<table class="table joinMemberTable">
					<colgroup>
						<col width="20%"></col>
						<col width="*"></col>
					</colgroup>
					<tr>
						<td class="title">아이디</td>
						<td>
							<input type="text" name="memberId" id="memberId">
							&nbsp;
							<input type="button" value="아이디중복확인" name="chkId" id="existId" data-click="false">
						</td>
					</tr>
					<tr>
						<td class="title">비밀번호</td>
						<td><input type="password" name="memberPw" id="inputPassword" data-toggle="popover" title="<Caps Lock>이 켜져있습니다." data-placement="bottom"></td>
					</tr>
					<tr>
						<td class="title">비밀번호확인</td>
						<td><input type="password" name="memberRepeatPw"></td>
					</tr>
					<tr>
						<td class="title">이름</td>
						<td><input type="text" name="memberName"></td>
					</tr>
					<tr>
						<td class="title">생년월일</td>
						<td><input type="date" name="memberBirthday" value="2000-01-01"></td>
					</tr>
					<tr>
						<td class="title">주소</td>
						<td>
							<input type="hidden" name="currentPage" id="currentPage" value="1">
							<input type="text" id="tKeyword" value="" onkeydown="enterSearch();">
							<input type="hidden" name="keyword" id="keyword">
							&nbsp;
							<input type="checkbox" id="area" style="position: relative; top: 2px;">&nbsp;전지역
							&nbsp;
							<input type="button" onClick="getAddrLoc();" value="주소검색하기">
							<div id="list"></div>
						</td>
					</tr>
					<tr>
						<td class="title">연락처1</td>
						<td>
							<select id="memberTel1_1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							&nbsp;-&nbsp;
							<input type="hidden" name="memberTel" id="memberTel">
							<input type="text" name="memberTel1_2" id="memberTel1_2" class="inputTel" style="width: 100px;">
							&nbsp;-&nbsp;
							<input type="text" name="memberTel1_3" id="memberTel1_3" class="inputTel" style="width: 100px;">
						</td>
					</tr>
					<tr>
						<td class="title">연락처2</td>
						<td>
							<select id="memberTel2_1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							&nbsp;-&nbsp;	
							<input type="hidden" name="memberTel2" id="memberTel2">
							<input type="text" name="memberTel2_2" id="memberTel2_2" class="inputTel" style="width: 100px;">
							&nbsp;-&nbsp;
							<input type="text" name="memberTel2_3" id="memberTel2_3" class="inputTel" style="width: 100px;">
						</td>
					</tr>
					<tr>
						<td class="title">이메일</td>
						<td>
							<input type="hidden" name="memberEmail" id="memberEmail">
							<input type="text" name="memberEmailId" id="memberEmail1" style="width: 150px;">
							&nbsp;@&nbsp;
							<input type="text" name="memberEmailUri" id="memberEmail2" style="width: 150px;">
							&nbsp;
							<select id="emailUri">
								<option value="inputUri" selected>직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
								<option value="nate.com">네이트</option>
								<option value="gmail.com">구글</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="title">성별</td>
						<td>
							<input type="radio" name="memberGender" value="M" checked style="position: relative; top: 1px;">&nbsp;남
							&emsp;
							<input type="radio" name="memberGender" value="F" style="position: relative; top: 1px;">&nbsp;여
						</td>
					</tr>
				</table>
			</div>
			<div align="center">
				<input type="button" value="뒤로가기" onclick="history.back()" style="background-color: #ffcc00; border: #ffcc00;">
				<input type="submit" id="submitBtn" value="회원가입">
			</div>
			</form>
		</div>
	</div>
</div>
<script src="resources/js/joinMember.js?ver=1"></script>
</body>
</html>