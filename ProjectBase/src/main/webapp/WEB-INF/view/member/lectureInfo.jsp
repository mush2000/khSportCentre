<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/lectureInfo.css?ver=4"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle;
}
a, a:hover{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">전체강의안내</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="row">
			<div class="col-md-6">
			</div>
			<div id="displayNotice" align="right" class="col-md-6">
			</div>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<c:forEach items="${classList }" var="classes">
			<table class="table lectureInfoTable">
				<colgroup>
					<col width="*"></col>
					<col width="12%"></col>
					<col width="12%"></col>
					<col width="12%"></col>
				</colgroup>
				<tbody id="classTbody" data-session="${sessionScope.loginInfo }">
					<tr>
						<td class="title" style="border-right: 1px solid #ddd;">
							<a href="classesDetail.do?classesCode=${classes.classesCode }">${classes.classesName}</a>
						</td>
						<td class="title" style="border-right: 1px solid #ddd;">최소인원</td>
						<td class="title" style="border-right: 1px solid #ddd;">최대인원</td>
						<td class="title">수강료</td>
					</tr>
					<tr>
						<%-- <td><span class="className" data-classCode="${classes.classesCode }">${classes.classesName}</span></td> --%>
						<td class="content" style="border-right: 1px solid #ddd; vertical-align: middle !important;">
							<a href="classesDetail.do?classesCode=${classes.classesCode }" style="vertical-align: middle !important">
								<img src="resources/images/classes/${classes.classesDetail }" alt="${classes.classesName}" width="100%" class="thumbnail">
							</a>
							<div class="fee">
							</div>
						</td>
						<td class="content" style="border-right: 1px solid #ddd;">${classes.minMember}명</td>
						<td class="content" style="border-right: 1px solid #ddd;">${classes.maxMember}명</td>
						<td class="content" data-classCode="${classes.classesCode }" style="text-align: center;">
							<fmt:formatNumber value="${classes.classesFee}" type="currency"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="height: 30px"></div>
		</c:forEach>
	</div>
</div>
<script src="resources/js/lectureInfo.js?ver=1"></script>
</body>
</html>