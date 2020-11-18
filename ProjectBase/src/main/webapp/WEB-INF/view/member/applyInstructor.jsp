<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/joinMember.css?ver=4"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle;
}
.addrTable > tbody > tr{
	padding: 5px;
	border: none;
}
.addrTable > tbody > tr > td{
	padding: 5px;
	vertical-align: middle;
	border: none;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">강사지원</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<form action="sendResume.do" id="resumeForm" method="post" enctype="multipart/form-data">
			<div align="center">
				<table class="table joinMemberTable">
					<colgroup>
						<col width="20%"></col>
						<col width="*"></col>
					</colgroup>
					<tr>
						<td class="title">아이디</td>
						<td>${loginInfo.memberId }<input type="hidden" name="memberId" value="${loginInfo.memberId }"></td>
					</tr>
					<tr>
						<td class="title">이름</td>
						<td>${loginInfo.memberName }</td>
					</tr>
					<c:if test="${empty instInfo }">
						<tr>
							<td class="title">주민등록번호</td>
							<td>
								<input type="hidden" name="regNum" id="regNum">
								<input type="text" name="regNum_1" id="regNum_1" style="width: 100px;">
								&nbsp;-&nbsp;
								<input type="text" name="regNum_2" id="regNum_2" style="width: 100px;">
							</td>
						</tr>
						<tr>
							<td class="title">증명사진</td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr>
							<td class="title">종목</td>
							<td>
								<select id="classesCode" name="classesCode">
									<c:forEach items="${classesNameList }" var="classes">
										<option value="${classes.classesCode }">${classes.classesName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="title">자격증</td>
							<td><input type="text" name="license"></td>
						</tr>
						<tr>
							<td class="title">경력</td>
							<td><input type="number" name="career" value="0" min="0" max="100"></td>
						</tr>
						</c:if>
					<c:if test="${not empty instInfo }">
						<tr>
							<td class="title">주민등록번호</td>
							<td>
								${instInfo.regNum }
								<input type="hidden" name="regNum" value="${instInfo.regNum }">
							</td>
						</tr>
						<tr>
							<td class="title">증명사진</td>
							<td>
								<img src="resources/images/instructor/${instInfo.picture }" alt="" width="25%" class="thumbnail" style="margin-bottom: 0px;">
								<input type="hidden" name="picture" value="${instInfo.picture }">
							</td>
						</tr>
						<tr>
							<td class="title">종목</td>
							<td>
								<select id="classesCode" name="classesCode">
									<c:forEach items="${classesNameList }" var="classes">
										<option value="${classes.classesCode }">${classes.classesName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="title">자격증</td>
							<td><input type="text" name="license"></td>
						</tr>
						<tr>
							<td class="title">경력</td>
							<td><input type="number" name="career" value="0" min="0" max="100"></td>
						</tr>
					</c:if>
				</table>
			</div>
			<div align="center">
				<input type="button" value="뒤로가기" onclick="history.back();" style="background: #ffcc00; border: 1px solid #ffcc00;">
				<input type="submit" id="submitBtn" value="지원하기">
			</div>
			</form>
		</div>
	</div>
</div>
<script src="resources/js/applyInstructor.js?ver=1"></script>
</body>
</html>