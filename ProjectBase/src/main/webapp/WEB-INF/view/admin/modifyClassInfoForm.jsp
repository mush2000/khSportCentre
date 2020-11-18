<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	select {
		width: 200px;
	}
</style>
</head>

<body>

<form action="modifyClassInfo.do" method="post">
<input id="nowPage" name="page" type="hidden" value="${page }">  
<input id="nowRange" name="range" type="hidden" value="${range }">
<input type="hidden" value="${classInfo.classNum }" name="classNum"> 
	<div class="col-md-12">
		<div class="col-md-offset-1 col-md-10">
		<h4>강의 정보 수정</h4>
			<table>
			<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
				<tbody>
					<tr style="text-align: center;">
						<td>과목 목록(강습코드)</td>
						<td>강의 장소</td>
						<td>강의 요일</td>
					</tr>
					<tr style="text-align: center;">
						<td> <!-- 과목 목록  -->
							<select name="classesCode" id="classesCode">
							<c:forEach items="${classesList }" var="classes">
								<option <c:if test="${classInfo.classesCode eq classes.classesCode  }">selected</c:if> value="${classes.classesCode }" data-frontPlaceCode="${classes.frontPlaceCode }" data-frontDayCode="${classes.frontDayCode }">${classes.classesName }</option>
							</c:forEach>
							</select>
						</td>
						
						<c:choose>
							<c:when test="${fn:length(classPlaceList) != 0}">
							<td id="classPlace"> <!-- 장소  -->
								<select name="locCode" id="locCode">
								<c:forEach items="${classPlaceList }" var="classPlace">
									<c:if test="${classPlace.available eq 'Y'}"><option <c:if test="${classInfo.locCode eq classPlace.placeCode  }">selected</c:if> value="${classPlace.placeCode }">${classPlace.placeName }</option></c:if>
								</c:forEach>
								</select>
							</td>
							</c:when>
							<c:otherwise>
							<td>
								<input name="locCode" id="locCode" type="text" value="" placeholder="대관 가능한 장소가 없습니다" readonly>
							</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${fn:length(classPlaceList) != 0}">
							<td id="classDay"> <!-- 과목 요일  -->
								<select name="classDayCode" id="classDayCode"> 
									<c:forEach items="${classDayList }" var="classDay">
										<option value="${classDay.classDayCode }">요일 : ${classDay.classDay}</option>
									</c:forEach>
								</select>
							</td>
							</c:when>
							<c:otherwise>
								<td>
									<input name="classDay" id=classDay" type="text" value="" placeholder="요일을 선택할수 없습니다" readonly>
								</td>
							</c:otherwise>
						</c:choose>
						
						
					</tr>
				 	<!-- 두번째 thead 역활 -->
					<tr style="text-align: center;">
						<td>강의 년</td>
						<td>강의 달</td> 
						<td>강의 시간</td>
						<td>강사 정보</td>
						<td>레벨</td>
					</tr>
					<tr style="text-align: center;">
						<!-- 강의 시작 년도, 월 설정 -->
						<td id="classYear">
							<select name="year" id="year">
							<c:forEach begin="${year }" end="${year +1 }" var="idx">
								<option value="${idx}">${idx}</option>
							</c:forEach>
							</select>
						</td>
						<td id="classMonth">
							<select name="month">
								<c:choose>
									<c:when test="${month < 12}">
										<c:forEach begin="${month }" end="12" var="idx">
											<option value="${idx }">${idx }</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="${month }">
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<!-- 시간 설정 -->
						<td>
							<select name="classTime">
							<c:forEach begin="6" end="21" var="idx">
								<option value="${idx }">${idx } : 00 ~ ${idx } : 50</option>
							</c:forEach>
							</select>
						</td>
						
						<!-- 강사 선택  -->
						<c:choose>
							<c:when test="${fn:length(instructorInfoList) != 0}">
							<td id="inst">
								<select name="instNum" id="instNum">
								<c:forEach items="${instructorInfoList }" var="instructorInfo">
									<option value="${instructorInfo.instNum }">${instructorInfo.memberName }(${instructorInfo.memberId })</option>
								</c:forEach>
								</select>
							</td>
							</c:when>
							<c:otherwise>
							<td>
								<input name="instNum" id="instNum" type="text" value="" placeholder="등록된 강사가 없습니다" readonly>
							</td>
							</c:otherwise>
						</c:choose>
						<!-- 강의 레벨 -->
						<td>
							<select name="classLv">
							<c:forEach items="${classLevelList }" var="classLevel">
								<option  value="${classLevel.levelCode }">${classLevel.levelName } 설명 : ${classLevel.levelDetail }</option>
							</c:forEach>
							</select>
						</td>	
					</tr>
					<tr style="text-align: center">
						<td colspan="6">
							<br><br><br><input type="button" value="등록" id="insertBtn">
							<input type="button" value="뒤로가기" id="back">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>	

<script src="resources/js/modifyClassInfoForm.js?ver=2222"></script>
</body>
</html>