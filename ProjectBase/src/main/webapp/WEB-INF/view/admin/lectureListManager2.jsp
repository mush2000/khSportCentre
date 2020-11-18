<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/lectureListManager.css?ver=2"/>
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
			<h1 id="contentsTitle" class="contentsTitle">강의관리</h1>
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
				● 강의추가/삭제
			</span>
		</div>
		<div class="col-md-6 text-right">
			<form action="lectureListManager.do" method="post">
				<span>${year }년 ${month }월</span>
				<select name="classesCode" id="classesCode">
				<c:forEach items="${classesList }" var="classes">
					<c:if test="${classes.classesCode ne 61 }">
						<option value="${classes.classesCode }" <c:if test="${classInfoVO.classesCode eq classes.classesCode }">selected</c:if>>${classes.classesName }</option>
					</c:if>
				</c:forEach>
				</select>
				<select name="classTime" id="classTime">
				<c:forEach begin="6" end="21" var="time">
					<option value="${time }" <c:if test="${classInfoVO.classTime eq time}">selected</c:if>>${time }</option>
				</c:forEach>
				</select>
				<span><input type="submit" value="조회"></span>
			</form>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 10px;"></div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6 list">
		<form action="registerNewNextMonthClass.do" method="post">
			<input name="nextPage" id="nowNextPage" type="hidden" value="${nextPagination.page }">
			<input name="nextRange" id="nowNextRange" type="hidden" value="${nextPagination.range }">
			<input name="page" id="nowPage" type="hidden" value="${pagination.page }">
			<input name="range" id="nowRange" type="hidden" value="${pagination.range }">
			<input name="classesCode" id="classesCode" type="hidden" value="${classInfoVO.classesCode }">
			<input name="classTime" id="classTime" type="hidden" value="${classInfoVO.classTime }">
			<input name="classDate" id="classDate" type="hidden" value="${year }-${month + 1 }-01">
			<table class="table lectureListManagerTable">
				<thead>
					<tr>
						<th class="title"><input type="checkbox" id="allChkbox"></th>
						<th class="title">요일</th>
						<th class="title">시간</th>
						<th class="title">레벨</th>
						<th class="title">장소</th>
						<th class="title">강사</th>
						<th class="title">관리</th>
					</tr>
				</thead>
				<tbody id="nextTbody">
					<c:forEach items="${nextClassInfoList1 }" var="classInfo">
						<tr>
							<td class="content"><input type="checkbox" class="chkbox"></td>
							<td class="content">${classInfo.classDay }</td>
							<td class="content">${classInfo.classTime }</td>
							<td class="content">${classInfo.levelName }</td>
							<td class="content">${classInfo.placeName }</td>
							<td class="content">${classInfo.memberName } (${classInfo.memberId })</td>
							<td class="content">
								<input type="button" value="삭제" class="deleteClassInfo" data-classNum="${classInfo.classNum }" style="background: red; border: 1px solid red;">
							</td>
						</tr>
					</c:forEach>
					<c:forEach items="${nextClassInfoList2 }" var="classInfo">
						<tr>
							<td class="content"></td>
							<td class="content">${classInfo.classDay }</td>
							<td class="content">${classInfo.classTime }</td>
							<td class="content">${classInfo.levelName }</td>
							<td class="content">${classInfo.placeName }</td>
							<td class="content">${classInfo.memberName } (${classInfo.memberId })</td>
							<td class="content"></td>
						</tr>
					</c:forEach>
					<tr>
						<td class="content" style="border-bottom: 0px !important;">
							<input type="button" value="선택삭제" id="deleteClassInfo" data-classNum="${classInfo.classNum }" >
						</td>
						<td class="content" style="border-bottom: 0px !important;">
							<c:if test="${classDayList.size() eq 1 }">
								<input type="hidden" name="classDayCode" value="${classDayList[0].classDayCode }">
								${classDayList[0].classDay }
							</c:if>
							<c:if test="${classDayList.size() gt 1 }">
								<select name="classDayCode" id="classDay">
									<c:forEach items="${classDayList }" var="cDay">
										<option value="${cDay.classDayCode }">${cDay.classDay }</option>
									</c:forEach>
								</select>
							</c:if>
						</td>
						<td class="content" style="border-bottom: 0px !important;">${classInfoVO.classTime }</td>
						<td class="content" style="border-bottom: 0px !important;">
							<%-- <c:if test="${classLevelList.size eq 1 }">${classLevelList[0].levelName }</c:if> --%>
							<%-- <c:if test="${classLevelList.length eq 1 }">${classLevelList[0].levelName }</c:if> --%>
							<c:if test="${classLevelList[0].classesCode eq 1 }">
								<input type="hidden" name="classLv" value="${classLevelList[0].levelCode }">
								${classLevelList[0].levelName }
							</c:if>
							<c:if test="${classLevelList[0].classesCode ne 1 }">
								<select name="classLv" id="classLv">
									<c:forEach items="${classLevelList }" var="classLevel">
										<option value="${classLevel.levelCode }">${classLevel.levelName }</option>
									</c:forEach>
								</select>
							</c:if>
						</td>
						<td class="content" style="border-bottom: 0px !important;">
							<c:if test="${classPlaceList.size() eq 1 }">
								<input type="hidden" name="placeCode" value="${classPlaceList[0].placeCode }">
								${classPlaceList[0].placeName }
							</c:if>
							<c:if test="${classPlaceList.size() gt 1 }">
								<select name="placeCode" id="classPlace">
									<c:forEach items="${classPlaceList }" var="classPlace">
										<option value="${classPlace.placeCode }">${classPlace.placeName }</option>
									</c:forEach>
								</select>
							</c:if>
						</td>
						<td class="content" style="border-bottom: 0px !important;">
							<c:if test="${instructorInfoList.size() eq 1 }">
								<input type="hidden" name="instNum" value="${instructorInfoList[0].instNum }">
								${instructorInfoList[0].memberName }
							</c:if>
							<c:if test="${instructorInfoList.size() gt 1 }">
								<select name="instNum" id="instNum">
									<c:forEach items="${instructorInfoList }" var="instInfo">
										<option value="${instInfo.instNum }">${instInfo.memberName }</option>
									</c:forEach>
								</select>
							</c:if>
						</td>
						<td class="content" style="border-bottom: 0px !important;"><input type="submit" value="추가" class="insertClassInfo"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="col-md-12">
		<!-- pagination{s} -->
		<div id="paginationBox" align="center">
			<ul class="pagination">
				<c:if test="${nextPagination.prev}">
					<li class="page-item">
						<span class="nextPagePrev" data-page="${nextPagination.range}" data-range="${nextPagination.range}" data-rangeSize="${nextPagination.rangeSize}">Prev</span>
					</li>
				</c:if>
				<c:forEach begin="${nextPagination.startPage}" end="${nextPagination.endPage}" var="idx">
					<li class='page-item <c:out value="${nextPagination.page == idx ? 'active' : ''}"/>'>    
						<span class="nextPageNum" data-page="${idx}" data-range="${nextPagination.range}" data-rangeSize="${nextPagination.rangeSize}"> ${idx} </span>
					</li>
				</c:forEach>
				<c:if test="${nextPagination.next}">
					<li class="page-item">
						<span class="nextPageNext" data-page="${nextPagination.range}" data-range="${nextPagination.range}" data-rangeSize="${nextPagination.rangeSize}">Next</span>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->
	</div>
</div>


<div class="col-md-12">
	<div style="height: 50px"></div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="col-md-12">
			<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
				● 지난달강의
			</span>
			<div style="height: 10px;"></div>
		</div>
		<div>
			<%-- <input name="page" id="nowPage" type="hidden" value="${pagination.page }">
			<input name="range" id="nowRange" type="hidden" value="${pagination.range }"> --%>
			<table class="table lectureListManagerTable">
				<thead>
					<tr>
						<th class="title"><input type="checkbox" id="allChkbox2"></th>
						<th class="title">요일</th>
						<th class="title">시간</th>
						<th class="title">레벨</th>
						<th class="title">장소</th>
						<th class="title">강사</th>
						<th class="title">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${classInfoList }" var="classInfo">
						<tr>
							<td class="content"><input type="checkbox" class="chkbox2"></td>
							<td class="content">${classInfo.classDay }</td>
							<td class="content">${classInfo.classTime }</td>
							<td class="content">${classInfo.levelName }</td>
							<td class="content">${classInfo.placeName }</td>
							<td class="content">${classInfo.memberName } (${classInfo.memberId })</td>
							<td class="content"><input type="button" value="등록" class="registerClass" data-classNum="${classInfo.classNum }" ></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-md-12 text-left">
				<input type="button" value="선택등록" id="registerClassList" data-classNum="${classInfo.classNum }" style="position: relative; left: 5px;">
			</div>
		</div>
	</div>
	<div class="col-md-12">
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
<script src="resources/js/lectureListManager2.js?ver=3"></script>
</body>
</html>