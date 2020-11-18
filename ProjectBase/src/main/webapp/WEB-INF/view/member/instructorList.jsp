<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/instructorDetail.css?ver=1"/>
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
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">전체강사안내</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8">
		<div align="center">
			<div class="col-md-12 row">
				<c:forEach items="${instList }" var="inst">
					<div class="col-md-6">
						<table class="table instructorDetailTable" style="margin-bottom: 0px;">
							<colgroup>
								<col width="30%"></col>
								<col width="25%"></col>
								<col width="*"></col>
							</colgroup>
							<tr>
								<td colspan="3" style="padding: 5px;" class="title">
									<h4><strong>${inst.memberName }</strong></h4>
								</td>
							</tr>
							<tr>
								<td rowspan="5" style="padding: 15px !important; vertical-align: middle !important; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; text-align: center;">
									<img class="thumbnail" src="resources/images/instructor/${inst.picture }" onerror="this.src='resources/images/no_img.jpg'" width="120px" height="150px" style="margin: 0 0 0 10px; border: 1px solid #ddd;">
								</td>
							</tr>
							<tr>
								<td style="border-top: 0px; border-right: 1px solid #ddd;" class="title2">성　별</td>
								<td style="border-top: 0px;">
									<c:choose>
										<c:when test='${inst.memberGender == "F" }'>여자</c:when>
										<c:otherwise>남자</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="title2" style="border-right: 1px solid #ddd;">경　력</td>
								<td>${inst.career }</td>
							</tr>
							<tr style="border-bottom: 1px solid #ddd;">
								<td class="title2" style="border-right: 1px solid #ddd;">자격증</td>
								<td>${inst.license }</td>
							</tr>
							<tr style="border-bottom: 1px solid #ddd;">
								<td class="title2" style="border-right: 1px solid #ddd;">종목</td>
								<td>${inst.classesName }</td>
							</tr>
						</table>
					<div style="height: 50px;"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- <script src="resources/js/instructorList.js?ver=1"></script> -->
</body>
</html>