<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/boardWriteForm.css?ver=4"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<form action="writeBoard.do" method="post" id="writeBoard" enctype="multipart/form-data">
	<div id="hid">
		<input type="hidden" name="isSecret" id="isSecret" value="N">
	</div>
	<c:if test="${originBoard != 0 }">
		<input type="hidden" name="originBoard" id="originBoard" value="${originBoard }">
	</c:if>
	<c:if test="${originBoard == 0 }">
		<input type="hidden" name="originBoard" id="originBoard" value="0">
	</c:if>
	<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginInfo.memberId }">
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
				<c:when test="${originBoard eq 0 }">
					<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;글쓰기</span>
				</c:when>
				<c:otherwise>
					<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;답글달기</span>
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
					<c:if test="${originBoard == 0 }">
					<tr>
						<td class="title" style="padding: 15px 0px 15px 0px;">
							<div class="row col-md-12">
								<div class="col-md-10">
									게시판분류&nbsp;
									<select id="kindOfBoard" name="kindOfBoard" style="width: 90%;">
									<c:if test="${sessionScope.loginInfo.memberId eq 'admin'}">
										<c:forEach items="${adminKindList }" var="kind">
												<option <c:if test="${kind.kindCode eq kindInfo.kindCode  }">selected</c:if> value="${kind.kindCode }">${kind.kindName }</option>
										</c:forEach>	
									</c:if>
										<c:if test="${sessionScope.loginInfo.memberId ne 'admin' }">
											<c:forEach items="${memberKindList }" var="kind">
												<option <c:if test="${kind.kindCode eq kindInfo.kindCode  }">selected</c:if> value="${kind.kindCode }">${kind.kindName }</option>
											</c:forEach>	
										</c:if>
									</select>
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
					<c:if test="${originBoard != 0 }">
					<tr>
						<td>
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
					<tr> 
						<td>
							<input type="text" id="boardTitle" name="boardTitle" style="width: 100%" placeholder="제목을 입력하세요."/>
							<div class="byteInfo"></div>
						</td>
						
					</tr>
					<tr> 
						<td>
							<textarea style="resize: vertical;" id="boardContent" name="boardContent"  cols="122" rows="15" placeholder="내용을 입력하세요."></textarea>
							<div class="byteInfo"></div>
						</td>
					</tr>
					<c:if test="${originBoard == 0 }">
					<tr>
						<td>
							<input type="hidden" value="0" id="boardFile">
							<span id="insertFiles"></span>
							<div id="hidInsertBtn">
								<input type="button" id="insertFile" value="파일추가">
							</div>
						</td>
					</tr>
					
					</c:if>
				</table>
				<div align="center">
					<input type="button" value="뒤로가기" onclick="history.back()" style="background: #ffcc00; border: 1px solid #ffcc00;">
					<input type="button" id="boardWriteBtn" value="작성">
				</div>
			</div>
		</div>
	</div>
	</form>
<script src="resources/js/boardWriteForm.js?ver=1233"></script>
</body>
</html>