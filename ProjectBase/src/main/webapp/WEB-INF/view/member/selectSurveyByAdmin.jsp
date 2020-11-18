<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/selectSurveyByAdmin.css?ver=1"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle;
	text-align: center;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">작성후기조회</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="row col-md-12" style="margin: 0 0 0 0; padding: 0 15px 0 15px;">
			<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
				● ${classInfoVO.classesName } : ${classInfoVO.classDate }&nbsp;/&nbsp;${classInfoVO.classDay }&nbsp;/&nbsp;${classInfoVO.classTime }&nbsp;/&nbsp;${classInfoVO.levelName }&nbsp;/&nbsp;${classInfoVO.memberName }
			</span>
			<div style="height: 10px;"></div>
		</div>
		<div>
			<table class="table selectSurveyByAdminTable">
				<colgroup>
					<col width="*"></col>
					<col width="16%"></col>
					<col width="13%"></col>
					<col width="10%"></col>
					<col width="13%"></col>
					<col width="16%"></col>
				</colgroup>
				<thead>
					<tr>
						<th class="title" style="border-right: 1px solid #ddd;">설문내용</th>
						<th class="title">매우불만족 / 매우느림</th>
						<th class="title">불만족 / 느림</th>
						<th class="title">보통</th>
						<th class="title">만족 / 빠름</th>
						<th class="title">매우만족 / 매우빠름</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left; border-right: 1px solid #ddd;">강의내용은 적절했습니까?</td>
							<c:forEach begin="1" end="5" var="num">
								<td><input type="radio" name="teachingSkill" value="${num }" <c:if test="${num eq surveyVO.teachingSkill }"> checked</c:if> <c:if test="${num ne surveyVO.teachingSkill }"> onclick="return(false);"</c:if>></td>
							</c:forEach>
					</tr>
					<tr>
						<td style="text-align: left; border-right: 1px solid #ddd;">강의진행속도는 만족하십니까?</td>
						<c:forEach begin="1" end="5" var="num">
							<td><input type="radio" name="classProgress" value="${num }" <c:if test="${num eq surveyVO.classProgress }"> checked</c:if> <c:if test="${num ne surveyVO.classProgress }"> onclick="return(false);"</c:if>></td>
						</c:forEach>
					</tr>
					<tr>
						<td style="text-align: left; border-right: 1px solid #ddd;">강사의 태도는 친절했습니까?</td>
						<c:forEach begin="1" end="5" var="num">
							<td><input type="radio" name="instKindness" value="${num }" <c:if test="${num eq surveyVO.instKindness }"> checked</c:if> <c:if test="${num ne surveyVO.instKindness }"> onclick="return(false);"</c:if>></td>
						</c:forEach>
					</tr>
					<tr>
						<td style="text-align: left; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd !important;">기타의견</td>
						<td colspan="5" style="text-align: left; border-bottom: 1px solid #ddd !important;">
							<pre name="opinion">${surveyVO.opinion }</pre>
							<input type="hidden" name="classNum" value="${classInfoVO.classNum }">
						</td>
					</tr>
				</tbody>
			</table>
			<div align="center">
				<input type="button" value="이전수강내역" id="memberClassListBtn" data-mId="${memberId }" data-page="${page }" data-range="${range }" data-delYn="${delYn }"
						data-b4Page="${b4Page }" data-keyword="${keyword }">
				<input type="button" value="회원정보가기" id="memberInfoBtn" data-mId="${memberId }" data-page="${page }" data-range="${range }" data-delYn="${delYn }"
						data-b4Page="${b4Page }" data-keyword="${keyword }">
				<input type="button" value="메인으로" id="mainPageBtn">
			</div>
		</div>
	</div>
</div>
<script src="resources/js/selectSurveyByAdmin.js?ver=2"></script>
</body>
</html>