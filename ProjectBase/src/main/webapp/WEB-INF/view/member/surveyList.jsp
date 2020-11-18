<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/surveyList.css?ver=2"/>
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
			<h1 id="contentsTitle" class="contentsTitle">수강후기목록</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<c:forEach items="${surveyList }" var="survey">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div class="row col-md-12" style="margin: 0 0 0 0; padding: 0 15px 0 15px;">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● ${survey.classesName } : ${survey.classDate }&nbsp;/&nbsp;${survey.classTime }시&nbsp;/&nbsp;${survey.levelName }
				</span>
				<div style="height: 10px;"></div>
			</div>
			<div>
				<table class="table surveyListTable">
					<colgroup>
						<col width="20%"></col>
						<col width="*"></col>
					</colgroup>
						<tr>
							<td class="title">강의내용</td>
							<td>
								<c:choose>
									<c:when test="${survey.teachingSkill eq 1}">매우불만족 / 매우느림</c:when>
									<c:when test="${survey.teachingSkill eq 2}">불만족 / 느림</c:when>
									<c:when test="${survey.teachingSkill eq 3}">보통</c:when>
									<c:when test="${survey.teachingSkill eq 4}">만족 / 빠름</c:when>
									<c:otherwise>매우만족 / 매우빠름</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="title">강의진행속도</td>
							<td>
								<c:choose>
									<c:when test="${survey.classProgress eq 1}">매우불만족 / 매우느림</c:when>
									<c:when test="${survey.classProgress eq 2}">불만족 / 느림</c:when>
									<c:when test="${survey.classProgress eq 3}">보통</c:when>
									<c:when test="${survey.classProgress eq 4}">만족 / 빠름</c:when>
									<c:otherwise>매우만족 / 매우빠름</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="title">강사태도</td>
							<td>
								<c:choose>
									<c:when test="${survey.instKindness eq 1}">매우불만족 / 매우느림</c:when>
									<c:when test="${survey.instKindness eq 2}">불만족 / 느림</c:when>
									<c:when test="${survey.instKindness eq 3}">보통</c:when>
									<c:when test="${survey.instKindness eq 4}">만족 / 빠름</c:when>
									<c:otherwise>매우만족 / 매우빠름</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td class="title">기타의견</td>
							<td>
								<textarea rows="10" style="width: 100%; resize: none; border-radius: 5px;" name="opinion" readonly>${survey.opinion }</textarea>
								<input type="hidden" name="classNum" value="${survey.surveyNum }">
							</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</c:forEach>
<div align="center">
	<input type="button" value="뒤로가기" onclick="history.back();" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
	<input type="button" value="내정보관리" id="myInfoBtn">
	<input type="button" value="메인화면" id="mainPageBtn">
</div>
<script src="resources/js/selectSurvey.js?ver=1"></script>
</body>
</html>