<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/bottom.css?ver=2"/>
<script src="resources/js/bottom.js?ver=2"></script>
<style type="text/css">
body{
}
</style>
</head>
<body>
<div class="col-md-offset-4 col-md-8">

</div>
<div style="background-color: #333333; height: 145px; color: white;" class="row">
	<div class="col-md-offset-3 col-md-9">
		<img src="resources/images/logo2_white.png" style="width: 150px; position: relative; bottom: -50px;">
	</div>
	<div class="col-md-offset-4 col-md-8" style="position: relative; bottom: -8px;">
		<span data-toggle="modal" data-target="#protectInfo" class="protectInfo">
			개인정보보호정책
		</span>
		 │ 
		<span  data-toggle="modal" data-target="#emailRejection" class="emailRejection">
			메일주소무단수집거부
		</span>
		<br>
		<span style="font-weight: lighter; color: white;">
			copyright © 울산KH스포츠센터. All Rights Reserved. 446-77 울산광역시 남구 삼산로35번길 19 (신정동) T.052-200-0000 / F. 052-200-0001
		</span>
		<br><br>
	</div>
</div>



<!-- 개인정보보호정책 Modal -->
<div class="modal fade bs-example-modal-lg" id="protectInfo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel" style="font-weight: bold">개인정보보호정책</h4>
			</div>
			<div class="modal-body">
				■ 수집하는 개인정보 항목<br><br>
				학교는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
				◦수집항목(일반회원) : 이름, 아이디, 비밀번호, 생년월일, 성별, 이메일, 자택전화번호, 휴대폰번호, 자택주소<br>
				◦수집항목(수강회원) : 이름, 아이디, 비밀번호, 생년월일, 성별, 이메일, 자택전화번호, 휴대폰번호, 자택주소<br>
				◦수집항목(기업회원) : 이름, 아이디, 비밀번호, 이메일, 일반전화번호, 팩스번호, 휴대폰번호, 업체명, 사업자번호, 사업장주소<br>
				◦개인정보 수집방법 : 홈페이지(회원가입)<br>
				<br><br><br><br>
				■ 개인정보의 수집 및 이용목적<br><br>
				본 관은 수집한 개인정보를 다음의 목적을 위해 활용합니다.
				<br>◦회원관리 : 수강생모집, 수강생관리 등
				<br><br><br><br>
				■ 개인정보의 보유 및 이용기간<br><br>
				원칙적으로, 개인정보는 본관 홈페이지 가입등록 후 상시 보관합니다.<br>
				◦보존 기간 : 본 홈페이지 탈퇴 후 즉시 삭제, 회원 정지 후 1년간 보관<br>
			</div>
		</div>
	</div>
</div>

<!-- 메일주소무단수집거부 Modal -->
<div class="modal fade bs-example-modal-lg" id="emailRejection" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel" style="font-weight: bold">메일주소무단수집거부</h4>
			</div>
			<div class="modal-body">
				<br><br>
				우리 울산KH스포츠센터 회원에게 무차별적으로 보내지는 타사의 메일을 차단하기 위해,<br><br>
				본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여<br><br>
				무단으로 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.<br><br>
				<br><br>
			</div>
		</div>
	</div>
</div>

</body>
</html>