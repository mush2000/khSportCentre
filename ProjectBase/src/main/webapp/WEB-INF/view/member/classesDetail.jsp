<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/classesDetail.css?ver=5"/>
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
			<h1 id="contentsTitle" class="contentsTitle">${classesDetail.classesName }강의안내</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div align="center">
				<table class="table classesDetailTable">
					<colgroup>
						<col width="20%"></col>
						<col width="30%"></col>
						<col width="20%"></col>
						<col width="30%"></col>
					</colgroup>
					<tr>
						<td class="title" style="border-right: 1px solid #ddd;">최소인원</td>
						<td class="title2" style="border-right: 1px solid #ddd;">${classesDetail.minMember }명</td>
						<td class="title" style="border-right: 1px solid #ddd;">정원</td>
						<td class="title2" >${classesDetail.maxMember }명</td>
					</tr>
					<tr>
						<td class="title" style="border-right: 1px solid #ddd;">수강료</td>
						<td class="title2" colspan="3" id="classFeeTd" data-session="${sessionScope.loginInfo }">
							<fmt:formatNumber value="${classesDetail.classesFee }" type="currency"/>
							<input type="hidden" value="${classesDetail.classesCode }" id="classesCode">
						</td>
					</tr>
				</table>
			</div>
			<div class="left">
				<p style="padding: 5px; line-height: 30px;">
					${classesDetail.classesDetail }
				</p>
			</div>
			<div class="right">
				<p style="padding: 5px;">
					<c:forEach items="${classesDetail.classesPic }" var="pic">
						<img src="resources/images/classes/${pic }" alt="" width="100%" class="thumbnail">
					</c:forEach>
				</p>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/classesDetail.js?ver=2"></script>
</body>
</html>