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
<link rel="stylesheet" type="text/css" href="resources/css/boardWriteForm.css?ver=1"/>
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
<form action="updateBoard.do" method="post" id="updateBoard" enctype="multipart/form-data">
<div id="hidFile"></div>
	<div id="hid">
		<c:choose>
			<c:when test="${board.isSecret eq 'Y' }">
				<input type="hidden" name="isSecret" id="isSecret" value="Y">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="isSecret" id="isSecret" value="N">
			</c:otherwise>
		</c:choose>
	</div>
	<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginInfo.memberId }"> <!-- 로그인 여부  -->
	<input type="hidden" name="boardNum" id="boardNum" value="${board.boardNum }"> <!-- 게시판번호  -->
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div class="contentsTitle1"></div>
			<div class="contentsTitle2">
				<h1 id="contentsTitle" class="contentsTitle">커뮤니티</h1>
			</div>
		</div>
	</div>
	<div class="col-md-offset-3 col-md-6">
		<div style="height: 30px"></div> 
		<div class="row" style="margin-left: 10px;">
			<img src="resources/images/list.png" style="width: 35px; margin-top: -15px;">
			<c:choose>
				<c:when test="${board.originBoard eq 0 }">
					<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;글수정</span>
				</c:when>
				<c:otherwise>
					<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;답글수정</span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="col-md-12">
		<div style="height: 20px;"></div>
	</div>
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">  
			<div class="write">
				<table class="table boardWriteTable">
					<c:if test="${board.originBoard eq 0 }">
					<tr>
						<td class="title" style="padding: 15px 0px 15px 0px;">
							<div class="row col-md-12">
								<div class="col-md-10">
									게시판분류&nbsp;
									<select id="kindOfBoard" name="kindOfBoard" style="width: 90%;">
										<c:choose>
											<c:when test="${sessionScope.loginInfo.memberId eq 'admin' && getReplyBoardCnt < 1}">
												<c:forEach items="${adminKindList }" var="kind">
													<option <c:if test="${kind.kindCode eq kindInfo.kindCode  }">selected</c:if> value="${kind.kindCode }">${kind.kindName }</option>
												</c:forEach>	
											</c:when>
											<c:otherwise>
												<c:forEach items="${memberKindList }" var="kind">
													<option <c:if test="${kind.kindCode eq kindInfo.kindCode  }">selected</c:if> value="${kind.kindCode }">${kind.kindName }</option>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="col-md-2 text-right">
									<c:if test="${kindInfo.kindCode eq 2 || kindInfo.kindCode eq 3 }">
										<input type="checkbox" id="chkIsSecret" style="position: relative; top: 2px;" <c:if test="${board.isSecret eq 'Y' }">checked</c:if>>&nbsp;비밀글
									</c:if> 
								</div>
							</div>
						</td>
					</tr>
					</c:if>
					<c:if test="${board.originBoard ne 0 }">
					<tr>
						<td class="title" style="padding: 15px 0px 15px 0px;">
							<div class="row col-md-12">
								<div class="col-md-10">
									<input type="hidden" id="kindOfBoard" name="kindOfBoard" readonly value="${kindInfo.kindCode }">							
									<div style="width: 90%;">${kindInfo.kindName }</div>
								</div>
								<div class="col-md-2 text-right">
									<c:if test="${kindInfo.kindCode eq 2 || kindInfo.kindCode eq 3 }">
										<input type="checkbox" id="chkIsSecret" style="position: relative; top: 2px;">&nbsp;비밀글
									</c:if> 
								</div>
							</div>
						</td>
					</tr>
					</c:if>
					<c:choose>
						<c:when test="${not empty fileList }">
							<tr>
								<td>
									<c:forEach items="${fileList }" var="file">
										<input type="hidden" value="${fn:length(fileList) }" id="boardFile">
										<div class="file">게시글 첨부파일 : ${file.originFileName }(${file.fileSize }) <input type="button" class="deleteFile" value="파일삭제" data-fileNum="${file.fileNum }"></div>
										<div style="height: 5px;" class="heightDiv"></div>
									</c:forEach>
										<div id="insertFiles"></div>
									<c:choose>
										<c:when test="${fn:length(fileList) < 3 }">
											<div id="hidInsertBtn">
												<input type="button" id="insertFile" value="파일추가">
											</div>
										</c:when> 
										<c:otherwise>
											<div id="hidInsertBtn" style="display: none;">
												<input type="button" id="insertFile" value="파일추가">
											</div>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:if test="${board.originBoard < 1 }">
							<tr>
								<td>
									<div>
										<span id="insertFiles"></span>
										<input type="hidden" value="0" id="boardFile">
										<div id="hidInsertBtn">
											<input type="button" id="insertFile" value="파일추가">
										</div>
									</div>
								</td>
							</tr>
						</c:if>
						</c:otherwise>
					</c:choose>
					
					<tr> 
						<td>
							<input type="text" id="boardTitle" name="boardTitle" style="width: 100%" value="${board.boardTitle }">
							<div class="byteInfo"></div>
						</td>
					</tr>
					<tr> 
						<td>
							<textarea id="boardContent" name="boardContent" style="resize: none;" cols="122" rows="15">${board.boardContent }</textarea>
							<div class="byteInfo"></div>
						</td>
					</tr>

				</table>
				<div align="center">
					<input type="button" value="뒤로가기" onclick="history.back()" style="background: #ffcc00; border: 1px solid #ffcc00;">
					<input type="button" id="boardUpdateBtn" value="작성">
				</div>
			</div>
		</div>
	</div>
	</form> 
<script src="resources/js/boardUpdateForm.js?ver=13"></script>
</body>
</html>