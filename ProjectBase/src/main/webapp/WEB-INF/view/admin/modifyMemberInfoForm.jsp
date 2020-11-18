<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.choiceAddr:hover {
		cursor: pointer;
	}
	
	.pageNum:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
<form action="modifyMemberInfo.do" method="post" id="modifySubmit">
<h4>회원 정보 보기 및 수정</h4>
<input name="page" id="nowPage" type="hidden" value="${page }">
<input name="range" id="nowRange" type="hidden" value="${range }">
	<div id="list"> 
	<table class="table table-striped">
		<tbody>
			<tr align="center" >
				<td>아이디 : <input type="text" readonly name="memberId" value="${memberInfo.memberId }"></td>
			</tr>
			<tr align="center">
				<td>이름 : <input type="text" id="memberName" name="memberName" required value="${memberInfo.memberName }" placeholder="${memberInfo.memberName }"></td>
			</tr>
			<tr align="center">
				<td>성별 : 
					<c:if test="${memberInfo.memberGender eq 'M'}"><span>남자</span></c:if>
					<c:if test="${memberInfo.memberGender eq 'F'}"><span>여자</span></c:if>
				</td>
			</tr>
			<tr align="center">
				<td>생일 : 
					<input type="date" name="memberBirthday" value="${memberInfo.memberBirthday }" readonly>
				</td>
			</tr>
			<tr align="center">
					<td>주소
						<input type="hidden" name="currentPage" id="currentPage" value="1">
						<input type="text" id="tKeyword" placeholder="" required onkeydown="enterSearch();">
						<input type="hidden" name="keyword" id="keyword">
						<input type="checkbox" id="area">전지역
						
						<input type="button" onClick="getAddrLoc();" value="주소검색하기">
						<div id="addrList">
							<input type="text" id="memberAddr1" style="width: 40em;" readonly><br>
							<input type="text" id="memberAddr2" style="width: 40em;">
							<input type="hidden" name="memberAddr" id="memberAddr" value="${memberInfo.memberAddr }">
						</div>
					</td>
			</tr>
			<tr align="center">
				<td>이메일
					<input type="hidden" name="memberEmail" id="memberEmail" value="${memberInfo.memberEmail }">
					<input type="text" name="memberEmailId" id="memberEmail1" placeholder="">@
					<input type="text" name="memberEmailUri" id="memberEmail2" placeholder="">
					<select id="emailUri">
						<option value="inputUri" selected>직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="hanmail.net">다음</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">구글</option>
					</select>
				</td>
			</tr>
			<tr align="center">
					<td>전화번호 : 
						<select id="memberTel1_1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
						</select>-
						<input type="text" name="memberTel1_2" id="memberTel1_2" placeholder="" class="inputTel">-
						<input type="text" name="memberTel1_3" id="memberTel1_3" placeholder="" class="inputTel">
						<input type="hidden" name="memberTel" id="memberTel" value="${memberInfo.memberTel }">
					</td> 
				</tr>
			<tr align="center">
					<td>전화번호2
						<select id="memberTel2_1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
						</select>-
						<input type="text" name="memberTel2_2" id="memberTel2_2" placeholder="" class="inputTel">-
						<input type="text" name="memberTel2_3" id="memberTel2_3" placeholder="" class="inputTel">
						<input type="hidden" name="memberTel2" id="memberTel2" value="${memberInfo.memberTel2 }">
					</td> 
				</tr>
			<tr align="center">
				<td><input type="button" value="수정완료" id="modifyBtn"><input type="button" value="뒤로가기" id="back"></td>
			</tr> 
		</tbody>
	</table>
	</div>
</form>
<script src="resources/js/modifyMemberInfoForm.js?ver=22222"></script>
</body>
</html>