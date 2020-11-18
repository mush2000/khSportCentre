<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/memberInfoManager2.css?ver=1"/>
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
			<h1 id="contentsTitle" class="contentsTitle">회원관리</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12 text-right">
	<div class="col-md-offset-2 col-md-8">
		<select name="delYn" id="delYn">
			<option <c:if test="${delYn eq 'all' }">selected</c:if> value="all">모든 회원</option>
			<option <c:if test="${delYn eq 'N' }">selected</c:if> value="N">회원</option>
			<option <c:if test="${delYn eq 'Y' }">selected</c:if> value="Y">탈퇴한 회원</option>
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
		<table class="table memberInfoManager2Table">
			<colgroup>
				<col width="7%">
				<col width="7%">
				<col width="6%">
				<col width="10%">
				<col width="*">
				<col width="15%">
				<col width="10%">
				<col width="10%">
				<col width="8%">
				<col width="8%">
			</colgroup>
			<thead>
				<tr>
					<th class="title" style="border-right: 1px solid #ddd;">아이디</th>
					<th class="title" style="border-right: 1px solid #ddd;">이름</th>
					<th class="title" style="border-right: 1px solid #ddd;">성별</th>
					<th class="title" style="border-right: 1px solid #ddd;">생년월일</th>
					<th class="title" style="border-right: 1px solid #ddd;">주소</th>
					<th class="title" style="border-right: 1px solid #ddd;">이메일</th>
					<th class="title" style="border-right: 1px solid #ddd;">전화번호</th>
					<th class="title" style="border-right: 1px solid #ddd;">전화번호2</th>
					<th class="title" style="border-right: 1px solid #ddd;">가입일</th>
					<th class="title">관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberInfoList }" var="memberInfo">
							<tr <c:if test="${memberInfo.delYn eq 'Y' }">style="color: red;"</c:if>>
								<td class="content" style="border-right: 1px solid #ddd;">
									<span class="memberIdTd">${memberInfo.memberId }</span>
									<c:if test="${memberInfo.delYn eq 'Y' }">(탈퇴)</c:if>
								</td>
								<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberName }</td>
								<c:if test="${memberInfo.memberGender eq 'M' }"><td class="content" style="border-right: 1px solid #ddd;">남자</td></c:if>
								<c:if test="${memberInfo.memberGender eq 'F' }"><td class="content" style="border-right: 1px solid #ddd;">여자</td></c:if>
								<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberBirthday }</td>
								<td class="content2" style="border-right: 1px solid #ddd;">${memberInfo.memberAddr }</td>
								<td class="content2" style="border-right: 1px solid #ddd;">${memberInfo.memberEmail }</td>
								<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberTel }</td>
								<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.memberTel2 }</td>
								<td class="content" style="border-right: 1px solid #ddd;">${memberInfo.joinDate }</td> 
								<td class="content">
									<c:choose>
										<c:when test="${memberInfo.delYn ne 'Y' }">
											<input style="margin: 0 0 0 0;" type="button" value="삭제" class="deleteMemberInfo" data-memberId="${memberInfo.memberId }">
										</c:when>
										<c:otherwise>
											<input style="margin: 0 0 0 0; background-color: red; border: 1px solid red;" type="button" value="복구" class="restoreMemberInfo" data-memberId="${memberInfo.memberId }">
										</c:otherwise>
									</c:choose>
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
<script src="resources/js/memberInfoManager2.js?ver=2"></script>
</body>
</html>