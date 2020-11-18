<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/selectClassListByAdmin.css?ver=1"/>
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
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">이전수강정보</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<c:forEach items="${myClassList }" var="list">
			<table class="table selectClassListByAdminTable">
				<colgroup>
					<col width="7%"></col>
					<col width="13%"></col>
					<col width="7%"></col>
					<col width="13%"></col>
					<col width="13%"></col>
					<col width="13%"></col>
					<col width="13%"></col>
					<col width="13%"></col>
				</colgroup>
				<tr>
					<td class="title" style="border-right: 1px solid #ddd;">종목</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.classesName }</td>
					<td class="title" style="border-right: 1px solid #ddd;">요일</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.classDay }</td>
					<td class="title" style="border-right: 1px solid #ddd;">시간</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.classTime }시</td>
					<td class="title" style="border-right: 1px solid #ddd;">레벨</td>
					<td class="content">${list.levelName }</td>
				</tr>
				<tr>
					<td class="title" style="border-right: 1px solid #ddd;">강사</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.memberName }</td>
					<td class="title" style="border-right: 1px solid #ddd;">장소</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.placeName }</td>
					<td class="title" style="border-right: 1px solid #ddd;">수업진행월</td>
					<td class="content" style="border-right: 1px solid #ddd;">${list.classDate }</td>
 					<td class="title" style="border-right: 1px solid #ddd;">후기</td>
					<td class="content">
						<c:if test="${empty list.surveyNum || list.surveyNum eq ''}">
							<span style="color: red">후기 미작성</span>
						</c:if>
						<c:if test="${not empty list.surveyNum && list.surveyNum ne ''}">
							<input style="margin: 0 0 0 0;" type="button" value="후기확인" class="surveyContent" data-classNum="${list.classNum }" data-surveyNum="${list.surveyNum }">
						</c:if>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</div>
<div style="height: 20px;"></div>
<div align="center">
	<input type="button" value="회원정보가기" id="memberInfoBtn" data-mId="${memberId }" data-page="${page }"
			data-range="${range }" data-delYn="${delYn }" data-b4Page="${b4Page }"
			data-keyword="${keyword }"><%--  data-idKyword="${idKeyword }" data-nameKeyword="${nameKeyword }"> --%>
	<input type="button" value="메인으로" id="goHomeBtn">
</div>
<script src="resources/js/selectClassListByAdmin.js?ver=3"></script>
</body>
</html>