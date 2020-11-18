<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/memberInformation.css?ver=3"/>
<style type="text/css">
.table > tbody > tr {
	padding: 15px;
}
.table > tbody > tr > td {
	padding: 15px;
	vertical-align: middle !important;
}
.choiceAddr, .pageNum, .boardTitle:hover {
	cursor: pointer;
}
#withdrawMember {
	color: red;
}
</style>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="contentsTitle1"></div>
		<div class="contentsTitle2">
			<h1 id="contentsTitle" class="contentsTitle">내정보관리</h1>
		</div>
	</div>
	<div class="col-md-offset-2 col-md-8">
		<div style="height: 30px"></div>
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-offset-3 col-md-6">
		<div class="row col-md-12" style="margin: 0 0 0 0;">
			<div class="col-md-6" style="padding: 0 0 0 0;">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● 회원정보
				</span>
			</div>
			<div class="col-md-6" align="right" style="padding: 0 0 0 0;">
				<input type="button" value="강사지원" id="applyInst">
				<div style="height: 10px;"></div>
			</div>
		</div>
		<div>
			<table class="table memberInformationTable" id="memberInfo">
				<colgroup>
					<col width="20%"></col>
					<col width="*"></col>
					<col width="20%"></col>
				</colgroup>
				<tr>
					<td class="title">아이디</td>
					<td id="memberIdTd" colspan="2">${memberInfo.memberId }</td>
				</tr>
				<tr>
					<td class="title">이름</td>
					<td colspan="2">${memberInfo.memberName }</td>
				</tr>
				<tr>
					<td class="title">성별</td>
					<td colspan="2"><c:choose><c:when test='${memberInfo.memberGender == "F" }'>여자</c:when><c:otherwise>남자</c:otherwise></c:choose></td>
				</tr>
				<tr>
					<td class="title">생년월일</td>
					<td id="memberBirthday" class="memberDetail" colspan="2">${memberInfo.memberBirthday }</td>
				</tr>
				<tr>
					<td class="title">주소</td>
					<td id="memberAddr" class="memberDetail" colspan="2">${memberInfo.memberAddr }</td>
				</tr>
				<tr>
					<td class="title">연락처1</td>
					<td id="memberTel" class="memberDetail" colspan="2">${memberInfo.memberTel }</td>
				</tr>
				<tr>
					<td class="title">연락처2</td>
					<td id="memberTel2" class="memberDetail" colspan="2">${memberInfo.memberTel2 }</td>
				</tr>
				<tr>
					<td class="title">이메일</td>
					<td id="memberEmail" class="memberDetail" colspan="2">${memberInfo.memberEmail }</td>
				</tr>
				<c:if test="${not empty regclassList or not empty selectClassList }">
					<tr>
						<td class="title">수강정보</td>
						<td colspan="2">
							<c:if test="${not empty regclassList }">
								<input type="button" value="수강신청내역" id="regClass">&nbsp;&nbsp;
							</c:if>
							<c:if test="${not empty selectClassList }">
								<input type="button" value="이전수강내역" id="pastClass">
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty myBoard }">
					<tr>
						<td class="title">게시글정보</td>
						<td colspan="2" id="myBoardTd">
							<input type="button" value="작성글확인" id="myBoard">
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty pastRentalList or not empty nextRentalList }">
					<tr>
						<td class="title">대관예약신청정보</td>
						<td colspan="2" id="myBoardTd">
							<c:if test="${not empty nextRentalList }">
							<table width="100%" class="table table-bordered" style="margin-bottom: 0px;">
								<colgroup>
									<col width="*"></col>
									<col width="20%"></col>
									<col width="30%"></col>
									<col width="20%"></col>
								</colgroup>
								<thead>
									<tr>
										<th style="font-weight: bold; text-align: center; vertical-align: middle;">예약장소명</th>
										<th style="font-weight: bold; text-align: center; vertical-align: middle;">예약날짜</th>
										<th style="font-weight: bold; text-align: center; vertical-align: middle;">예약시간</th>
										<th style="font-weight: bold; text-align: center; vertical-align: middle;">예약승인여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${nextRentalList }" var="rental">
										<tr>
											<td style="text-align: center; vertical-align: middle;">${rental.placeName }</td>
											<td style="text-align: center; vertical-align: middle;">${rental.rentalDate }</td>
											<td style="text-align: center; vertical-align: middle;">
												<c:choose>
													<c:when test="${rental.rentalTime eq 'D'}">종일(08:00 ~ 18:00)</c:when>
													<c:when test="${rental.rentalTime eq 'A'}">오전(08:00 ~ 13:00)</c:when>
													<c:otherwise>오후(14:00 ~ 19:00)</c:otherwise>
												</c:choose>
											</td>
											<td style="text-align: center; vertical-align: middle;">
												<c:choose>
													<c:when test="${rental.rentalApprovalYN eq 'Y'}"><span style="color: blue; font-weight: bold;">승인완료</span></c:when>
													<c:otherwise><span style="color: red; font-weight: bold;">승인대기중</span></c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<span style="color: red;">* 신청내역에서 보이지 않는 예약은 예약승인취소가 된 경우입니다. 관리자에게 문의하세요.</span>
							</div>
							<div style="height: 10px;"></div>
							</c:if>
							<c:if test="${not empty pastRentalList }">
								<input type="button" value="지난내역확인" id="pastRentalList">
							</c:if>
						</td>
					</tr>
				</c:if>
			</table>
			<div align="center">
				<input type="button" value="개인정보수정" id="modifyBtn">
				<input type="button" value="수정완료" id="modifyFinBtn">
			</div>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div style="height: 50px;"></div>
</div>
<c:if test="${not empty instInfo and instInfo.instDel eq 'N'}">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div class="col-md-6">
				<span style="color: #0034a9; font-size: 1.5em; font-weight: bold;">
					● 강사정보
				</span>
				<div style="height: 10px;"></div>
			</div>
			<div>
				<table class="table memberInformationTable">
					<colgroup>
						<col width="20%"></col>
						<col width="30%"></col>
						<col width="*"></col>
					</colgroup>
					<tr>
						<td rowspan="4">
							<img src="resources/images/instructor/${instInfo.picture }" alt="" width="100%" style="border: 1px solid #ddd; margin: 0 0 0 0;" class="thumbnail" onerror="this.src='resources/images/no_img.jpg'">
						</td>
						<td class="title">종목</td>
						<td>${instInfo.classesName }</td>
					</tr>
					<tr>
						<td class="title">경력</td>
						<td>${instInfo.career }</td>
					</tr>
					<tr>
						<td class="title" style="border-bottom: 1px solid #ddd;">자격증</td>
						<td style="border-bottom: 1px solid #ddd;">${instInfo.license }</td>
					</tr>
					<c:if test="${not empty instClassList }">
						<tr>
							<td class="title">수업관리</td>
							<td><input type="button" value="수업목록" id="myClassList"></td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</c:if>
<script src="resources/js/memberInformation.js?ver=14"></script>
</body>
</html>