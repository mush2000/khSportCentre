<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/instInfoManager.css?ver=2"/>
<script src="https://cdn.jsdelivr.net/npm/inko@1.1.1/inko.min.js"></script>
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
			<h1 id="contentsTitle" class="contentsTitle">강사관리</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8 text-right">
		<select name="instDel" id="instDel">
			<option <c:if test="${instDel eq 'N' }">selected</c:if> value="N">강사</option>
			<option <c:if test="${instDel eq 'Y' }">selected</c:if> value="Y">그만둔강사</option>
			<option <c:if test="${instDel eq 'A' }">selected</c:if> value="A">강사지원자</option>
		</select>
		<input type="text" id="keyword" value="${keyword }">&nbsp;<input type="button" id="searchBtn" value="검색">
	</div>
</div>
<div class="col-md-offset-2 col-md-8">
	<div style="height: 10px"></div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8" id="list">
		<input id="nowPage" type="hidden" value="${pagination.page }">
		<input id="nowRange" type="hidden" value="${pagination.range }">
		<input id="nowKeyword" type="hidden" value="${keyword }">
		<table class="table instInfoManagerTable">
			<colgroup>
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="13%">
				<col width="7%">
				<col width="*">
				<col width="13%">
				<col width="13%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th class="title" style="border-right: 1px solid #ddd;">아이디</th>
					<th class="title" style="border-right: 1px solid #ddd;">이름</th>
					<th class="title" style="border-right: 1px solid #ddd;">성별</th>
					<th class="title" style="border-right: 1px solid #ddd;">주민등록번호</th>
					<th class="title" style="border-right: 1px solid #ddd;">경력</th>
					<th class="title" style="border-right: 1px solid #ddd;">자격증</th>
					<th class="title" style="border-right: 1px solid #ddd;">전화번호</th>
					<th class="title" style="border-right: 1px solid #ddd;">과목명</th>
					<th class="title">관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${instInfoList }" var="instInfo">
					<tr>
						<td class="content" style="border-right: 1px solid #ddd;">
							<span class="memberIdTd">${instInfo.memberId }</span>
						</td>
						<td class="content" style="border-right: 1px solid #ddd;">${instInfo.memberName }</td>
						<c:if test="${instInfo.memberGender eq 'M' }"><td class="content" style="border-right: 1px solid #ddd;">남자</td></c:if>
						<c:if test="${instInfo.memberGender eq 'F' }"><td class="content" style="border-right: 1px solid #ddd;">여자</td></c:if>
						<td class="content" style="border-right: 1px solid #ddd;">${instInfo.regNum }</td>
						<td class="content" style="border-right: 1px solid #ddd;">${instInfo.career }</td>
						<td class="content2" style="border-right: 1px solid #ddd;">${instInfo.license }</td>
						<td class="content" style="border-right: 1px solid #ddd;">${instInfo.memberTel }</td>
						<td class="content" style="border-right: 1px solid #ddd;">${instInfo.classesName }</td>
						<td class="content">
							<c:if test="${instDel eq 'N' }">
								<input style="margin: 0 0 0 0; background: red; border: 1px solid red;" type="button" value="삭제" class="deleteInstInfo" data-instNum="${instInfo.instNum }">
							</c:if>
							<c:if test="${instDel eq 'Y' }">
								<input style="margin: 0 0 0 0;" type="button" value="복귀" class="returnInstInfo" data-instNum="${instInfo.instNum }">
							</c:if>
							<c:if test="${instDel eq 'A' }">
								<input style="margin: 0 0 0 0;" type="button" value="추가" class="insertInstInfo" data-instNum="${instInfo.instNum }">
								<div style="height: 5px;"></div>
								<input style="margin: 0 0 0 0; background: red; border: 1px solid red;" type="button" value="탈락" class="rejectInstInfo" data-instNum="${instInfo.instNum }">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- pagination{s} -->
		<div id="paginationBox" align="center">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item">
						<span class="pagePrev" data-page="${pagination.range}" data-range="${pagination.range}" data-rangeSize="${pagination.rangeSize}">Prev</span>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class='page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/>'>    
						<span class="pageNum" data-page="${idx}" data-range="${pagination.range}" data-rangeSize="${pagination.rangeSize}"> ${idx} </span>
					</li>
				</c:forEach>  
				<c:if test="${pagination.next}">
					<li class="page-item">
						<span class="pageNext" data-page="${pagination.range}" data-range="${pagination.range}" data-rangeSize="${pagination.rangeSize}">Next</span>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->
	</div>
</div>
<script src="resources/js/instInfoManager.js?ver=1"></script>
</body>
</html>