<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 웹폰트 : 데이즈원체 -->
<link href="https://fonts.googleapis.com/css2?family=Days+One&display=swap" rel="stylesheet">

<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/introPage.css?ver=2"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="resources/js/introPage.js?ver=11"></script>

<!-- 카카오맵API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=666fc1250fa79f4d0446a9ec36e1e03a"></script>
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
<div class="row">
	<div class="col-md-12">
		<div class="col-md-offset-3 col-md-6">
			<div role="tabpanel" class="introTab">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" <c:if test="${introTab eq 'centerIntro'}">class="active"</c:if> ><a href="#centerIntro" aria-controls="centerIntro" role="tab" data-toggle="tab" class="centerIntroNameA">센터소개</a></li>
					<li role="presentation" <c:if test="${introTab eq 'centerInfo'}">class="active"</c:if> ><a href="#centerInfo" aria-controls="centerInfo" role="tab" data-toggle="tab" class="centerIntroNameA">시설현황</a></li>
					<li role="presentation" <c:if test="${introTab eq 'centerLoc'}">class="active"</c:if> ><a href="#centerLoc" aria-controls="centerLoc" role="tab" data-toggle="tab" class="centerIntroNameA">위치안내</a></li>
				</ul>
			
				<!-- Tab panes 시작 -->
				<div class="tab-content">
					<!-- 센터소개 -->
					<c:choose>
						<c:when test="${introTab eq 'centerIntro'}">
							<div role="tabpanel" class="tab-pane fade in active" id="centerIntro">
						</c:when>
						<c:otherwise>
							<div role="tabpanel" class="tab-pane fade in" id="centerIntro">
						</c:otherwise>
					</c:choose>
						<div class="row">
							<br><br>
							<div class="col-md-12">
								<div class="left col-md-8">
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #0034a9; font-weight: bold">Ulsan</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #ffcc00; font-weight: bold">&nbsp;KH</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #bbbbbb; font-weight: bold">&nbsp;Sports Center</span>
									<br>
									<span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">울산</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #ffcc00;">KH</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">스포츠센터</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #666666;">는 수강생들이 건강하고 가치 있는 미래를<br>창조해 갈 수 있도록 언제나 문이 활짝 열려져 있습니다.</span>
								</div>
								<div class="right col-md-4" align="right">
									<img src="resources/images/open.png" width="230px">
								</div>
							</div>
						</div>
						<hr style="border: 0.5px solid #0034a9;">
						<div class="row">
							<div class="col-md-12">
								<img src="resources/images/placeholder.png" style="width: 35px; margin-top: -15px;"><span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;센터소개</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="left">
									<br>
									<p style="font-family: 'NanumSquareRound'; font-size: 1.2em; padding: 5px;">
										&nbsp;2020년 10월 개관한 울산KH스포츠센터는 연건평 3,500여 평으로
										국내 스포츠센터 중 가장 긴 50M 길이의 수영장을 보유하고 있습니다.
										또한, 오토시스템을 갖춘 골프장 및 검도, 배드민턴, 농구 등
										다양한 구기 스포츠가 가능한 실내체육관이 있습니다.
										<br><br> 
										&nbsp;그 외에도 요가, 재즈, 나이트댄스를 강습하는 스포츠교실
										그리고 최고급형 헬스기구를 갖춘 헬스장과 하체강화 및
										심폐지구력 증대를 위한 스피닝기구를 갖춘 GX-룸,
										운동의 의학적 검진 및 상담을 위한 운동처방실 등을
										갖추고 있습니다.
										울산시민들의 복지시설로서 역할은 물론 지역
										주민들의 건전한 여가 선용과 체력증진을 위한 공간으로서
										기능을 위해 최선의 노력을 기울이고 있습니다.
									</p>
								</div>
								<div class="right">
									<br>
									<p style="font-family: 'NanumSquareRound'; font-size: 1.2em; padding: 5px;">
										&nbsp;시내 간선도로에 인접하고 있어 접근성이 용이하며 강습생을 위한
										주차장 및 스낵바 등 부대시설이 마련되어 있으며,
										아침 6시부터 저녁 10시까지 운영되고 있습니다.
										<br><br>
										&nbsp;언제나 쾌적하고 깨끗한 시설로서 차별화되고 다양한 강좌를 개설하여
										이용하는 수강생들이 더욱 가치 있는 삶을 창조해 갈 수 있도록 하겠습니다.
									</p>
								</div>
								<div align="center">
									<img src="resources/images/centerdwg1.jpg" alt="..." class="img-thumbnail" style="width: 930px;">
									<br>
									<span style="font-size: 0.8em; color: lightgray;">* 본 이미지 출처는 울산시 북구호계문화체육센터 조감도 입니다. </span>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 시설현황 -->
					<c:choose>
						<c:when test="${introTab eq 'centerInfo'}">
							<div role="tabpanel" class="tab-pane fade in active" id="centerInfo">
						</c:when>
						<c:otherwise>
							<div role="tabpanel" class="tab-pane fade in" id="centerInfo">
						</c:otherwise>
					</c:choose>
						<div class="row">
							<br><br>
							<div class="col-md-12">
								<div class="left col-md-8">
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #0034a9; font-weight: bold">Ulsan</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #ffcc00; font-weight: bold">&nbsp;KH</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #bbbbbb; font-weight: bold">&nbsp;Sports Center</span>
									<br>
									<span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">울산</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #ffcc00;">KH</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">스포츠센터</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #666666;">는 수강생들이 건강하고 가치 있는 미래를<br>창조해 갈 수 있도록 언제나 문이 활짝 열려져 있습니다.</span>
								</div>
								<div class="right col-md-4" align="right">
									<img src="resources/images/open.png" width="230px">
								</div>
							</div>
						</div>
						<hr style="border: 0.5px solid #0034a9;">
						<div class="row">
							<div class="col-md-12">
								<img src="resources/images/home.png" style="width: 35px; margin-top: -15px;"><span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;시설현황</span>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" style="height: 250px;">
									<img src="resources/images/fitness.jpg" alt="..." style="width: 270px; height: 180px; border: 2px solid lightgray">
									<div class="caption" align="center">
										<p class="centerImage">휘트니스센터</p>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" style="height: 250px;">
									<img src="resources/images/screen-golf.jpg" alt="..." style="width: 270px; height: 180px; border: 2px solid lightgray">
									<div class="caption" align="center">
										<p class="centerImage">스크린골프장</p>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail" style="height: 250px;">
									<img src="resources/images/indoor_swimming_pool.jpg" alt="..." style="width: 270px; height: 180px; border: 2px solid lightgray">
									<div class="caption" align="center">
										<p class="centerImage">실내수영장</p>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12 text-center">
								<!-- 시설현황테이블1 -->
								<table class="table centerInfoTable">
									<colgroup>
										<col width="20%"></col>
										<col width="20%"></col>
										<col width="*"></col>
									</colgroup>
									<tr>
										<td class="title">시설명</td>
										<td class="title" style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">층</td>
										<td class="title">비고</td>
									</tr>
									<tr>
										<td style="vertical-align: middle;">주차장</td>
										<td style="vertical-align: middle; border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B2F</td>
										<td style="text-align: left">주차는 일반인 등록회원 한하여 무료이용 (학생/교직원 회원은 제외)이며, 실내체육관 B1, B2 주차장 이용(안내데스크에서 정기 주차권 신청서 작성)</td>
									</tr>
									<tr>
										<td>수영장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">25M / 7레인</td>
									</tr>
									<tr>
										<td>휘트니스센터</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">유산소 33종, 웨이트머신 20종 및 각종 프리웨이트</td>
									</tr>
									<tr>
										<td>다목적체육실</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>스낵바</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>스쿼시장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">단식 2실</td>
									</tr>
									<tr>
										<td style="vertical-align: middle;">골프연습장</td>
										<td style="vertical-align: middle; border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">스크린 6개 타석, 일반 6개 타석, 골프존, 스크린룸 2개, 야외 어프로치, 벙커장 및 퍼팅장 구비</td>
									</tr>
									<tr>
										<td>락커룸</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">남녀 구분</td>
									</tr>
									<tr>
										<td>샤워실</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">B1F</td>
										<td style="text-align: left">남녀 구분</td>
									</tr>
									<tr>
										<td>실내체육관</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">1F</td>
										<td style="text-align: left">농구코트, 배드민턴코트</td>
									</tr>
									<tr>
										<td>유소년체련단</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">2F</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>대운동장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>소운동장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>농구장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>축구장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>테니스장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
									<tr>
										<td>족구장</td>
										<td style="border-left: 1px solid #dddddd; border-right: 1px solid #dddddd;">실외</td>
										<td style="text-align: left">&nbsp;</td>
									</tr>
								</table>
								
								<div style="height: 30px;"></div>
								
								<!-- 시설현황테이블2 -->
								<table class="table centerInfoTable">
									<colgroup>
										<col width="20%"></col>
										<col width="*"></col>
									</colgroup>
									<tr>
										<td class="title" colspan="2">시설정보</td>
									</tr>
									<tr>
										<td>부지면적</td>
										<td style="border-left: 1px solid #dddddd;">1,663평</td>
									</tr>
									<tr>
										<td>건축면적</td>
										<td style="border-left: 1px solid #dddddd;">768평</td>
									</tr>
									<tr>
										<td>연면적</td>
										<td style="border-left: 1px solid #dddddd;">2,738평(지하2층~지상 2층, 지하주차장 제외)</td>
									</tr>
								</table>
								
							</div>
						</div>
						
					</div>
					
					<!-- 위치안내 -->
					<c:choose>
						<c:when test="${introTab eq 'centerLoc'}">
							<div role="tabpanel" class="tab-pane fade in active" id="centerLoc">
						</c:when>
						<c:otherwise>
							<div role="tabpanel" class="tab-pane fade in" id="centerLoc">
						</c:otherwise>
					</c:choose>
						<div class="row">
							<br><br>
							<div class="col-md-12">
								<div class="left col-md-8">
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #0034a9; font-weight: bold">Ulsan</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #ffcc00; font-weight: bold">&nbsp;KH</span>
									<span style="font-family: 'Days One', sans-serif; font-size: 3em; color: #bbbbbb; font-weight: bold">&nbsp;Sports Center</span>
									<br>
									<span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">울산</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #ffcc00;">KH</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #0034a9;">스포츠센터</span><span style="font-family: 'NanumSquareRound'; font-size: 1.5em; color: #666666;">는 수강생들이 건강하고 가치 있는 미래를<br>창조해 갈 수 있도록 언제나 문이 활짝 열려져 있습니다.</span>
								</div>
								<div class="right col-md-4" align="right">
									<img src="resources/images/open.png" width="230px">
								</div>
							</div>
						</div>
						<hr style="border: 0.5px solid #0034a9;">
						<div class="row">
							<div class="col-md-12">
								<img src="resources/images/mapflag.png" style="width: 35px; margin-top: -15px;"><span style="font-family: 'S-CoreDream-5Medium'; font-size: 2em;">&nbsp;위치안내</span>
							</div>
						</div>
						<div class="row">
							<br>
							<div class="col-md-12">
								<!-- 카카오맵 -->
								<div id="map" style="width: 100%; height: 500px;" class="thumbnail"></div>
								<ul class="thumbnail" id="loc_tx">
									<li>
										<img src="resources/images/home.png" style="width: 35px; margin-top: -5px;"><span style="font-size: 1.1em; font-family: 'NanumSquareRound'; text-align: center;">&emsp;446-77 울산광역시 남구 삼산로35번길 19 (신정동)</span>
									</li>
									<li>
										<img src="resources/images/phone-call.png" style="width: 35px; margin-top: -5px;"><span style="font-size: 1.1em; font-family: 'NanumSquareRound'; text-align: center;">&emsp;전화 : 052-200-0000&emsp;/&emsp;팩스 : 052-200-0001</span>
									</li>
								</ul>
								<!-- 교통안내테이블 -->
								<table class="table centerInfoTable">
									<colgroup>
										<col width="35%"></col>
										<col width="*"></col>
									</colgroup>
									<tr>
										<td class="title" colspan="2" style="text-align: center;">교통안내</td>
									</tr>
									<tr>
										<td>비행기 이용 울산공항에서 오는 방법</td>
										<td style="border-left: 1px solid #dddddd;">
											비행기 : 울산 ↔ 서울(1일 17회, 07:00 ~ 21:30)<br>
											일반버스 : 402, 412, 432, 442, 452(50분)<br>
											좌석버스 : 1402(50분)<br>
											택시 : 6~7,000원(30분)<br>
										</td>
									</tr>
									<tr>
										<td>고속버스 이용 시외버스터미널에서 오는 방법</td>
										<td style="border-left: 1px solid #dddddd;">
											일반버스 : 401, 427, 714(35분)<br>
											좌석버스 : 1114, 1104, 1402(35분)<br>
											택시 : 4~5,000원(25분)<br>
											신복로타리 고속버스 승강장에서 하차시 도보로 20분 거리<br>
										</td>
									</tr>
									<tr>
										<td>택시 이용 울산시내에서 오는 방법</td>
										<td style="border-left: 1px solid #dddddd;">
											4~5,000원(25분)
										</td>
									</tr>
									<tr>
										<td>철도 이용 울산역에서 오는 방법</td>
										<td style="border-left: 1px solid #dddddd;">
											일반버스 : 307, 401, 427, 704, 817(35분)<br>
											좌석버스 : 1114, 1104, 1401(35분)<br>
											택시 : 4~5,000원(25분)
										</td>
									</tr>
									<tr>
										<td>자가용 이용 울산IC에서 오는 방법</td>
										<td style="border-left: 1px solid #dddddd;">
											경부고속도로(언양) → 울산방향(울산고속도로) → 울산 IC → 신복로타리 우회전<br>
											→ 1Km 직진(15분)
										</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</div>
				<!-- Tab panes 끝 -->
				
			</div>
		</div>
	</div>
</div>

</body>
</html>