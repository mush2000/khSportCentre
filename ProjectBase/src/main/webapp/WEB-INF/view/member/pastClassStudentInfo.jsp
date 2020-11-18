<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/pastClassStudentInfo.css?ver=1"/>
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
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">수강생정보조회</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="col-md-6">
			<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
				● 수강생후기
			</span>
			<div style="height: 10px;"></div>
		</div>
		<div>
			<table class="table pastClassStudentInfoTable">
				<colgroup>
					<col width="16%">
					<col width="17%">
					<col width="16%">
					<col width="17%">
					<col width="16%">
					<col width="*">
				</colgroup>
				<thead>
					<tr>
						<th class="title">강습내용</th>
						<th>${myClassScore.teachingSkill / 100} / 5.0</th>
						<th class="title">진행속도</th>
						<th>${myClassScore.classProgress / 100} / 5.0</th>
						<th class="title">강사태도</th>
						<th>${myClassScore.instKindness / 100} / 5.0</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="title">상세후기</td>
						<td colspan="5">
						<c:forEach items="${myClassOpinionList }" var="myClassOpinion" varStatus="vs">
							<div style="height: 5px;"></div>
							<pre>${myClassOpinion.opinion }</pre>
							<div style="height: 5px;"></div>
							<c:if test="${vs.index % 3 eq 2 }"></c:if>
						</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 50px;"></div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="col-md-6">
			<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
				● 수강생정보
			</span>
			<div style="height: 10px;"></div>
		</div>
		<div>
			<table class="table pastClassStudentInfoTable">
				<colgroup>
					<col width="8%">
					<col width="8%">
					<col width="13%">
					<col width="15%">
					<col width="15%">
					<col width="*">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th class="title" style="border-right: 1px solid #ddd;">이름</th>
						<th class="title" style="border-right: 1px solid #ddd;">성별</th>
						<th class="title" style="border-right: 1px solid #ddd;">생년월일</th>
						<th class="title" style="border-right: 1px solid #ddd;">연락처1</th>
						<th class="title" style="border-right: 1px solid #ddd;">연락처2</th>
						<th class="title" style="border-right: 1px solid #ddd;">주소</th>
						<th class="title">이메일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberInfoList }" var="memberInfo">
						<tr>
							<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberName }</td>
							<c:if test="${memberInfo.memberGender eq 'M' }"><td class="content" style="border-right: 1px solid #ddd;">남자</td></c:if>
							<c:if test="${memberInfo.memberGender eq 'F' }"><td class="content" style="border-right: 1px solid #ddd;">여자</td></c:if>
							<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberBirthday }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberTel }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberTel2 }</td>
							<td class="content2" style="border-right: 1px solid #ddd;">${memberInfo.memberAddr }</td>
							<td class="content2">${memberInfo.memberEmail }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<input type="button" value="뒤로가기" onclick="history.back();" style="background: #ffcc00; border: 1px solid #ffcc00;">
			</div>
		</div>
	</div>
</div>
</body>
</html>