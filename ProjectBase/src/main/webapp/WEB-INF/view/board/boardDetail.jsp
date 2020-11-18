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
<link rel="stylesheet" type="text/css" href="resources/css/boardDetail.css?ver=63"/>
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
<form action="writeReply.do" method="post" id="writeReply">
<input type="hidden" name="replyBoardNum" id="originBoard" value="${board.boardNum}">
<input type="hidden" name="replyMemberId" id="memberId" value="${sessionScope.loginInfo.memberId }">
<input type="hidden" name="chkKindCode" id="chkKindCode" value="${chkKindCode }">
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">커뮤니티</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8">
		<img src="resources/images/list.png" style="width: 35px; margin-top: -15px;">
		<span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;" class="board" data-kindCode="${kindInfo.kindCode }" >&nbsp;${kindInfo.kindName }</span>
		<div class="write">
			<div id="hid" style="height: 20px">
				<input type="hidden" name="replyIsSecret" id="replyIsSecret" value="N">
			</div>
			<table class="table boardDetailTable" 
				<c:if test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">style="border-bottom: 0px;"</c:if>>
				<colgroup>
					<col width="40%"></col>
					<col width="*"></col>
					<col width="20%"></col>
				</colgroup>
				<tr>
					<td colspan="3" class="title" style="font-size: 1.3em;">${board.boardTitle }</td>
				</tr>
				<tr>
					<td>작성자 : ${board.memberId}</td>
					<td>작성일 : ${board.createDate}</td>
					<td style="text-align: right;">조회수 : ${board.viewCount}</td>   
				</tr>
				<c:if test="${not empty fileList }">
					<tr>
						<td colspan="3">
						<c:forEach items="${fileList }" var="file">
							게시글 첨부파일 : <input type="button" class="download" value="${file.originFileName }" data-fileNum="${file.fileNum }"> (${file.fileSize })
							<div style="height: 5px;"></div>
						</c:forEach>
						</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="3" style="height: auto;">
						<pre style="background-color: white; border: 0px; font-size: 16px; font-family: 'Noto Sans KR', sans-serif !important;">${board.boardContent }</pre>
					</td>
				</tr>
			</table>
			<table class="table boardDetailTable" style="border-top: 3px solid #ddd; border-bottom: 0px; margin-bottom: 0px;">
				<c:if test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">
					<colgroup>
						<col width="10%"></col>
						<col width="*"></col>
						<col width="20%"></col>
					</colgroup>
					<tr class="none" style="border-top: 0px;">
						<td class="none title" colspan="3">
							<img src="resources/images/replyIcon.png" height="20px" width="20px" style="opacity: 0.5; position: relative; top: -2px;">
							<span style="font-weight: bold; font-size: 16px;">&nbsp;덧글 ${fn:length(replyList ) }</span>
						</td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(replyList ) != 0 }">
							<c:forEach items="${replyList }" var="reply">
								<c:choose>
									<c:when test="${reply.replyIsSecret eq 'N' }">
										<tr class="showTr" style="border-top: 0px;">
											<td colspan="2">
												<div class="row col-md-12">
													<div class="col-md-2" style="text-align: center; width: 100px; ">
														<span style="position: relative; top:12px; font-weight: bold;">${reply.replyMemberId }</span>
													</div> 
													<div class="col-md-10 context-right" style="border-left: 1px solid #ddd; margin: 2px 0px 0px 0px;">
														<pre style="width:100%; background-color: white;  border: 0px; font-size: 16px; font-family: 'Noto Sans KR', sans-serif !important;">${reply.replyContent }</pre>
													</div>
												</div>
											</td>
											<td style="text-align: right;">
												<c:if test="${reply.replyMemberId eq sessionScope.loginInfo.memberId }">
													<input type="button" class="updateReply" value="수정" style="background-color: gray; border: 1px solid gray;">
												</c:if>
												<c:if test="${reply.replyMemberId eq sessionScope.loginInfo.memberId || 'admin' eq sessionScope.loginInfo.memberId }">
													<input type="button" class="deleteReply" data-replyNum=${reply.replyNum } value="삭제" style="background-color: #ccc; border: 1px solid #ccc;">
												</c:if>
											</td>
										</tr>
										<tr class="hideTr" style="display: none;"> <!--덧글 수정 누르면 여기가 show됌 -->
										 	<td>
												<div class="col-md-6" style="text-align: center; width: 100px; height: 28px;">
													<span style="position: relative; top:3px; font-weight: bold;">${reply.replyMemberId }</span>
												</div>
										 	</td>
										 	<td>
										 		<textarea style="width: 100%; resize: vertical;" class="boardContent" name="boardContent" rows="5" placeholder="내용을 입력하세요.">${reply.replyContent }</textarea>
										 		<div class="byteInfo"></div>
											</td>
										 	<td style="text-align: right;">
											 	<input class="updateReplyBtn" data-replyNum="${reply.replyNum }" type="button" value="완료"  style="background-color: gray; border: 1px solid gray;">
											 	<input class="cancelUpdate" type="button" value="취소" style="background-color: #ccc; border: 1px solid #ccc;">
										 	</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${board.memberId eq sessionScope.loginInfo.memberId || reply.replyMemberId eq sessionScope.loginInfo.memberId || sessionScope.loginInfo.memberId eq 'admin'}">
												 <tr class="showTr">
												 	<td colspan="2">
														<div class="col-md-2" style="text-align: center; width: 100px; height: 28px;">
															<span style="position: relative; top:12px; font-weight: bold;">
																<img src="resources/images/secretIcon.png" width="15px" height="15px">
																${reply.replyMemberId }
															</span>
														</div>
													 	<div class="col-md-10" style="border-left: 1px solid #ddd; margin: 2px 0px 0px 0px;"><pre style="background-color: white; border: 0px; font-size: 16px; font-family: 'Noto Sans KR', sans-serif !important;">${reply.replyContent }</pre></div>
												 	</td>
												 	<td style="text-align: right;">
														<c:if test="${reply.replyMemberId eq sessionScope.loginInfo.memberId }">
															<input type="button" class="updateReply" value="수정"  style="background-color: gray; border: 1px solid gray;">
														</c:if>
														<c:if test="${reply.replyMemberId eq sessionScope.loginInfo.memberId || 'admin' eq sessionScope.loginInfo.memberId }">
															<input type="button" class="deleteReply" data-replyNum=${reply.replyNum } value="삭제" style="background-color: #ccc; border: 1px solid #ccc;">
														</c:if>
													</td>
												 </tr>
												 <tr class="hideTr" style="display: none;"> <!--덧글 수정 누르면 여기가 show됌 -->
												 	<td>
												 		<div style="text-align: center; width: 100px; height: 28px;">
												 			<span style="position: relative; top:3px; font-weight: bold;">
																<img src="resources/images/secretIcon.png" width="15px" height="15px">
																${reply.replyMemberId }
															</span>
														</div>
												 	</td>
												 	<td>
												 		<textarea style="width:100%; resize: vertical;" class="boardContent" name="boardContent" rows="5" placeholder="내용을 입력하세요.">${reply.replyContent }</textarea>
												 		<div class="byteInfo"></div>
												 	</td>
												 	<td style="text-align: right;">
													 	<input class="updateReplyBtn" data-replyNum="${reply.replyNum }" type="button" value="완료"  style="background-color: gray; border: 1px solid gray;">
													 	<input class="cancelUpdate" type="button" value="취소" style="background-color: #ccc; border: 1px solid #ccc;">
												 	</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr> 
													<td colspan="3">
														&emsp;<img src="resources/images/secretIcon.png" width="15px" height="15px"> 
														비밀글 입니다.
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</table>
			<c:if test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">
				<div style="height: 20px"></div>
			</c:if>
			<c:if test="${not empty sessionScope.loginInfo.memberId }">
				<c:if test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">
					<div class="reply" style="border: 2px solid #ddd; border-radius: 3px; padding: 15px; margin: 5px;">
						<div class="row col-md-12" style="padding: 10px;">
							<div class="col-md-6 text-left">
								<span style="font-weight: bold;">${sessionScope.loginInfo.memberId }(${sessionScope.loginInfo.memberName })</span>
								&emsp;&emsp;<c:if test="${board.isSecret eq 'N' }"><input type="checkbox" id="chkIsSecret" style="position: relative; top: 2px;">&nbsp;비밀글</c:if>
							</div>
							<div style="height: 5px;"></div>
						</div>
						<div style="padding: 15px; "> <!-- 덧글달기 ! -->
							<textarea style="width: 100%; resize: vertical;" class="boardContent" name="replyContent" rows="5" placeholder="내용을 입력하세요.">${reply.replyContent }</textarea>
							<div class="byteInfo"></div>
							<div id="insertBtn" class="text-right" style="font-size: 16px;">등록</div>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
		<c:if test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">
			<div style="height: 30px;"></div>
		</c:if>
			<div class="row">
				<div class="col-md-6">
					<c:if test="${not empty sessionScope.loginInfo.memberId }">
						<c:choose>
							<c:when test="${kindInfo.kindCode == 2 || kindInfo.kindCode == 3}">
								<input id="boardWriteBtn" type="button" value="글쓰기" >
							</c:when>
							<c:when test="${sessionScope.loginInfo.memberId eq 'admin' && kindInfo.kindCode == 1 || sessionScope.loginInfo.memberId eq 'admin' && kindInfo.kindCode == 4 }">
								<input id="boardWriteBtn" type="button" value="글쓰기" >
							</c:when>
						</c:choose>
						<c:if test="${board.originBoard eq 0 && kindInfo.kindCode == 2 || board.originBoard eq 0 && kindInfo.kindCode == 3 }">
							<input id="boardReplyWriteBtn" type="button" style="background-color: #ccc; border: 1px solid #ccc;" value="답글달기" >
						</c:if>
						<c:if test="${sessionScope.loginInfo.memberId eq board.memberId }">
							<input id="updateBoardBtn" type="button" style="background-color: #ccc; border: 1px solid #ccc;" value="수정"> 
						</c:if>
						<c:if test="${sessionScope.loginInfo.memberId eq 'admin' || sessionScope.loginInfo.memberId eq board.memberId }">
							<input id="deleteBoardBtn" type="button" style="background-color: #ccc; border: 1px solid #ccc;" value="삭제"> 
						</c:if>
					</c:if>
					<input class="board" data-kindCode="${kindInfo.kindCode }" type="button" style="background-color: #ccc; border: 1px solid #ccc;" value="목록">
				</div>
				<div class="col-md-6 text-right"> 
					<input type="button" value="TOP" id="TOP" style="background-color: #ffcc00; border: 1px solid #ffcc00;">
				</div>
			</div>
		</div>
	</div>
</form>
<script src="resources/js/boardDetail.js?ver=113"></script> 
</body>
</html>