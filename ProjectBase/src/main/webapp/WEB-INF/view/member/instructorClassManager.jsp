<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/instructorClassManager.css?ver=3"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
}
.nowClassNameTd:hover, .pastClassNameTd:hover {
	cursor: pointer;
	text-decoration: underline;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">수업목록</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<c:if test="${not empty nowClassList }">
			<div class="col-md-6">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● 이번달 수업목록
				</span>
				<div style="height: 10px;"></div>
			</div>
			<div>
				<table class="table instructorClassManagerTable" id="memberInfo" style="margin: 0 0 0 0;">
					<colgroup>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="*"></col>
					</colgroup>
					<thead>
						<tr>
							<th class="title" style="border-right: 1px solid #ddd;">과목</th>
							<th class="title" style="border-right: 1px solid #ddd;">시간</th>
							<th class="title" style="border-right: 1px solid #ddd;">수준</th>
							<th class="title" style="border-right: 1px solid #ddd;">수업진행월</th>
							<th class="title" style="border-right: 1px solid #ddd;">인원</th>
							<th class="title">요일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nowClassList }" var="myClass">
						<tr>
							<td class="content" style="border-right: 1px solid #ddd;"><span class='nowClassNameTd' data-classNum='${myClass.classNum }'>${myClass.classesName }</span></td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classTime }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.levelName }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classDate }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.regMemberCnt }</td>
							<td class="content">${myClass.classDay }</td>
						</tr>
						</c:forEach>
					</tbody>
					<%-- <c:if test="${not empty regclassList or not empty selectClassList }">
						<tr>
							<td>강습과목</td>
							<td colspan="2">
								<c:if test="${not empty regclassList }">
									<input type="button" value="수강신청목록" id="regClass">&nbsp;&nbsp;
								</c:if>
								<c:if test="${not empty selectClassList }">
									<input type="button" value="이전강습목록" id="pastClass">
								</c:if>
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty myBoard }">
						<tr>
							<td>게시판</td>
							<td colspan="2" id="myBoardTd">
								<input type="button" value="내가 쓴 글" id="myBoard">
							</td>
						</tr>
					</c:if> --%>
				</table>
			</div>
		<div style="height: 50px;"></div>
		</c:if>
		<c:if test="${not empty nextClassList }">
			<div class="col-md-6">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● 다음달 수업목록
				</span>
				<div style="height: 10px;"></div>
			</div>
			<div>
				<table class="table instructorClassManagerTable" id="memberInfo" style="margin: 0 0 0 0;">
					<colgroup>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="*"></col>
					</colgroup>
					<thead>
						<tr>
							<th class="title" style="border-right: 1px solid #ddd;">과목</th>
							<th class="title" style="border-right: 1px solid #ddd;">시간</th>
							<th class="title" style="border-right: 1px solid #ddd;">수준</th>
							<th class="title" style="border-right: 1px solid #ddd;">수업진행월</th>
							<th class="title" style="border-right: 1px solid #ddd;">인원</th>
							<th class="title">요일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nextClassList }" var="myClass">
						<tr>
							<td class="content" style="border-right: 1px solid #ddd;"><span class='nowClassNameTd' data-classNum='${myClass.classNum }'>${myClass.classesName }</span></td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classTime }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.levelName }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classDate }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.regMemberCnt }</td>
							<td class="content">${myClass.classDay }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<div style="height: 50px;"></div>
		</c:if>
		<c:if test="${not empty pastClassList }">
			<div class="col-md-6">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● 지난 수업목록
				</span>
				<div style="height: 10px;"></div>
			</div>
			<div>
				<table class="table instructorClassManagerTable" id="memberInfo" style="margin: 0 0 0 0;">
					<colgroup>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="17%"></col>
						<col width="*"></col>
					</colgroup>
					<thead>
						<tr>
							<th class="title" style="border-right: 1px solid #ddd;">과목</th>
							<th class="title" style="border-right: 1px solid #ddd;">시간</th>
							<th class="title" style="border-right: 1px solid #ddd;">수준</th>
							<th class="title" style="border-right: 1px solid #ddd;">수업진행월</th>
							<th class="title" style="border-right: 1px solid #ddd;">인원</th>
							<th class="title">요일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pastClassList }" var="myClass">
						<tr>
							<td class="content" style="border-right: 1px solid #ddd;"><span class='pastClassNameTd' data-classNum='${myClass.classNum }'>${myClass.classesName }</span></td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classTime }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.levelName }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.classDate }</td>
							<td class="content" style="border-right: 1px solid #ddd;">${myClass.regMemberCnt }</td>
							<td class="content">${myClass.classDay }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="height: 50px;"></div>
		</c:if>
	</div>
</div>
<div align="center">
	<!-- <input type="button" value="내정보관리" id="myInfoBtn"> -->
	<input type="button" value="뒤로가기" onclick="history.back();" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
	<input type="button" value="메인으로" id="goHomeBtn">
</div>
<script src="resources/js/instructorClassManager.js?ver=2"></script>
</body>
</html>