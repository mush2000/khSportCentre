<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/pastRentalList.css?ver=1"/>
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
			<h1 id="contentsTitle" class="contentsTitle">지난대관내역</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">	
		<table class="table pastRentalListTable">
			<colgroup>
				<col width="33%"></col>
				<col width="33%"></col>
				<col width="*"></col>
			</colgroup>
			<thead>
				<tr>
					<th class="title" style="border-right: 1px solid #ddd;">장소</th>
					<th class="title" style="border-right: 1px solid #ddd;">날짜</th>
					<th class="title">시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pastRentalList }" var="rental">
				<tr>
					<td class="content" style="border-right: 1px solid #ddd;">${rental.placeName }</td>
					<td class="content" style="border-right: 1px solid #ddd;">${rental.rentalDate }</td>
					<td class="content">
						<c:choose>
							<c:when test="${rental.rentalTime eq 'D'}">08:00 ~ 18:00</c:when>
							<c:when test="${rental.rentalTime eq 'A'}">08:00 ~ 13:00</c:when>
							<c:otherwise>14:00 ~ 19:00</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 10px;"></div>
</div>
<div align="center">
	<!-- <input type="button" value="내정보관리" id="myInfoBtn"> -->
	<input type="button" value="뒤로가기" onclick="history.back();" style="background: #ffcc00; border: 1px solid #ffcc00;">
	<input type="button" value="메인으로" id="goHomeBtn">
</div>
<script src="resources/js/pastRentalList.js?ver=1"></script>
</body>
</html>