<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/registerClass.css?ver=1"/>

<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
}
.table > tbody > tr > td.arrowTitle{
	background: url("resources/images/next-arrow.png") no-repeat #F7F7F7;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">수강신청</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8">
		<div class="row">
			<div class="col-md-2" style="padding: 0 0 0 0 !important;">
				<div align="left">
					<table class="table regTable">
						<tr>
							<td class="title" style="border-right: 1px solid #ddd;">과목명</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #ddd;">
								<!-- 스크롤바 시작-->		
								<div class="one" style="background: white; margin: 0px; padding: 0; overflow: auto;">
									<div class="two" style="background: white; margin: 0px; padding: 0; overflow: auto;">
										<div style="height: 400px;">
											<c:forEach items="${sessionScope.classesList }" var="classes">
												<c:if test="${classes.classesCode eq classesCode }">
													<div class="contentDiv">
														<span class="selectedName" data-classesCode="${classes.classesCode }">${classes.classesName }</span>
													</div>
												</c:if>
												<c:if test="${classes.classesCode ne classesCode }">
													<div class="contentDiv">
														<span class="classesName" data-classesCode="${classes.classesCode }">${classes.classesName }</span>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<div class="cover-bar">
										</div>
									</div>
								</div>
								<!-- 스크롤바 끝 -->
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2" style="padding: 0 0 0 0 !important;">
				<div align="left">
					<table id="classDayTable" class="table regTable">
						<c:choose>
							<c:when test="${empty classDayList }">
								<tr>
									<td class="title arrowTitle" style="border-right: 1px solid #ddd; background: url('resources/images/next-arrow.png') no-repeat #F7F7F7;">
										강의요일
									</td>
								</tr>
								<tr>
									<td style="border-right: 1px solid #ddd;">
										<div style="height: 400px;">
											<div class="contentDiv">
												<span style="color: red;">등록된 강의가 없습니다.</span>
											</div>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="title arrowTitle" style="border-right: 1px solid #ddd; background: url('resources/images/next-arrow.png') no-repeat #F7F7F7;">
										강의요일
									</td>
								</tr>
								<tr>
									<td style="border-right: 1px solid #ddd;">
										<div style="height: 400px;">
											<c:forEach items="${classDayList }" var="classDay">
												<div class="contentDiv">
													<span class="classDay" data-classDayCode="${classDay.classDayCode }">${classDay.classDay }</span>
												</div>
											</c:forEach>
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="col-md-2" style="padding: 0 0 0 0 !important;">
				<div align="left">
					<table id="classTimeTable" class="table regTable">
					</table>
				</div>
			</div>
			<div class="col-md-4" style="padding: 0 0 0 0 !important;">
				<div align="left">
					<table id="classLvTable" class="table regTable">
					</table>
				</div>
			</div>
			<div class="col-md-2" style="padding: 0 0 0 0 !important;">
				<div align="left">
					<table id="classesFeeTable" class="table regTable">
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/registerClass.js?ver=3"></script>
</body>
</html>