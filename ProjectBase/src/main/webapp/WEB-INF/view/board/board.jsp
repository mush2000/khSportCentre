<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/board.css?ver=1"/>
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
			<h1 id="contentsTitle" class="contentsTitle">커뮤니티</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
	<div style="height: 30px"></div> 
		<div class="row">
			<div class="col-md-6">
				<img src="resources/images/list.png" style="width: 35px; margin-top: -15px;">
				<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;${kindInfo.kindName }</span>
			</div>
			<div id="search" align="right" class="col-md-6">
				<form action="board.do" method="post"> 
					<input type="hidden" name="kindCode" id="kindCode" value="${kindInfo.kindCode }">
					<select name="searchType">
						<option value="all"    <c:if test="${searchType eq 'all' }">selected</c:if>>전체검색</option>
						<option value="id"     <c:if test="${searchType eq 'id' }">selected</c:if>>아이디</option>
						<option value="title"  <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
						<option value="content"<c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
					</select>
					<input type="text" placeholder="검색어 입력" name="keyword" value="${keyword }">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
		<div style="height: 20px"></div> 
		<!-- 리스트 시작 -->
		<div id="list" >
			<div id="board" >
			<table class="table boardTable">
				<colgroup>
					<c:if test="${sessionScope.loginInfo.memberId eq 'admin' }">
						<col width="5%">
					</c:if>
					<col width="8%">
					<col width="5%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="8%">
				</colgroup>
				<tbody>
					<tr style="background-color: #E2A7DF;">
						<c:if test="${sessionScope.loginInfo.memberId eq 'admin' }">
							<td class="title" style="border-right: 1px solid #ddd;"><input type="checkbox" id="chkAllBoard"></td>
						</c:if>
						<td class="title" style="border-right: 1px solid #ddd;">분류</td>
						<td class="title" style="border-right: 1px solid #ddd;">번호</td>
						<td class="title" style="border-right: 1px solid #ddd;">글제목</td>
						<td class="title" style="border-right: 1px solid #ddd;">작성자</td>
						<td class="title" style="border-right: 1px solid #ddd;">작성일</td>
						<td class="title">조회수</td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(boardList) != 0}">
						<c:set var="num" value="${boardListCnt - ((pagination.page-1) * 10) }"/>
							<c:forEach items="${boardList }" var="board" varStatus="status">
									<tr>
										<c:if test="${sessionScope.loginInfo.memberId eq 'admin' }">
											<td align="center" style="border-right: 1px solid #ddd;"><input type="checkbox" class="chkBoard" value="${board.boardNum }"></td>
										</c:if>
										<td align="center" style="border-right: 1px solid #ddd;">${board.kindName }</td>
 										<td align="center" style="border-right: 1px solid #ddd;">
 											${num }
										</td>
										<td style="border-right: 1px solid #ddd;">
											<c:if test="${board.originBoard > 0 }">
												&nbsp;&nbsp;&nbsp;<img src="resources/images/replyArrow2.png" alt="답글" width="15px" height="15px" style="position: relative; top: -3px;">
											</c:if>
											<c:if test="${board.isSecret eq 'Y' }">
												&nbsp;&nbsp;&nbsp;<img src="resources/images/secretIcon.png" alt="비밀글" width="15px" height="15px" style="position: relative; top: -3px;">
											</c:if> 
											<c:if test="${board.fileCnt > 0}">
												&nbsp;&nbsp;&nbsp;<img src="resources/images/paperclip.png" alt="첨부파일" width="15px" height="20px" style="position: relative; top: -3px;">
											</c:if> 
											&nbsp;&nbsp;&nbsp;<a href="boardDetail.do?boardNum=${board.boardNum }&chkKindCode=${kindInfo.kindCode}">${board.boardTitle }</a>
											<c:if test="${board.replyCnt ne 0 }">
												<a style="color: red;" href="boardDetail.do?boardNum=${board.boardNum }&chkKindCode=${kindInfo.kindCode}">[${board.replyCnt }]</a>
											</c:if>
										</td>
										<td align="center" style="border-right: 1px solid #ddd;">${board.memberId }</td>
										<td align="center" style="border-right: 1px solid #ddd;">${board.createDate }</td> 
										<td align="center">${board.viewCount }</td>
									</tr>
							<c:set var="num" value="${num-1 }"></c:set>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<c:choose>
									<c:when test="${sessionScope.loginInfo.memberId eq 'admin' }">
										<td align="center" colspan="7">게시글이 없습니다.</td>
									</c:when>
									<c:otherwise>
										<td align="center" colspan="6">게시글이 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:otherwise>
					</c:choose>
					
				</tbody>
			</table>
			</div>
			<c:if test="${not empty sessionScope.loginInfo.memberId }">
				<c:choose>
					<c:when test="${sessionScope.loginInfo.memberId eq 'admin'}">
						<div align="right">
							<input type="button" id="deleteBoardBtn" value="삭제" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
							<input type="button" id="boardWriteBtn" value="글쓰기" data-chkKindCode="${kindInfo.kindCode }">
						</div>
					</c:when>
					<c:when test="${sessionScope.loginInfo.memberId ne 'admin' && kindInfo.kindCode == 2 || sessionScope.loginInfo.memberId ne 'admin' && kindInfo.kindCode == 3}">
						<div align="right">
							<input type="button" id="boardWriteBtn" value="글쓰기" data-chkKindCode="${kindInfo.kindCode }">
						</div>
					</c:when>
				</c:choose>
			</c:if>
			<!-- pagination{s} -->
			<div id="paginationBox" align="center">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item">
							<span class="pagePrev" 
								data-page="${pagination.range}" 
								data-range="${pagination.range}" 
								data-rangeSize="${pagination.rangeSize}"
								data-kindCode="${kindInfo.kindCode }"
								data-searchType="${searchType }"
								data-keyword="${keyword }"
							>Prev</span>
						</li>
					</c:if>
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<li class='page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/>'>    
							<span class="pageNum" 
								data-page="${idx}" 
								data-range="${pagination.range}" 
								data-rangeSize="${pagination.rangeSize}"
								data-kindCode="${kindInfo.kindCode }"
								data-searchType="${searchType }"
								data-keyword="${keyword }"
							> ${idx} </span>
						</li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-item">
							<span class="pageNext" 
								data-page="${pagination.range}" 
								data-range="${pagination.range}" 
								data-rangeSize="${pagination.rangeSize}"
								data-kindCode="${kindInfo.kindCode }"
								data-searchType="${searchType }"
								data-keyword="${keyword }"
							>Next</span>
						</li>
					</c:if>
				</ul>
			</div>
			<!-- pagination{e} -->
		</div> <!--리스트끝  -->
	</div>
</div>	
<script src="resources/js/board.js?ver=12"></script>
</body>
</html>






