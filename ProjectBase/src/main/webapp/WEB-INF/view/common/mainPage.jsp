<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date popUpDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css를 사용하기 위한 태그 -->
<link rel="stylesheet" type="text/css" href="resources/css/mainPage.css?ver=64"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>


<!-- Jquey 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- cookie 사용을 위한 태그 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		cookiedata = document.cookie; 
		if ( cookiedata.indexOf("ncookie=done") < 0 ){ 
			document.getElementById('popup').style.display = "block";    //  팝업창 아이디
		} else {
			document.getElementById('popup').style.display = "none";    // 팝업창 아이디
		}
	});
	
	function setCookie( name, value, expiredays ) { 
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	function closeWin() { 
		document.getElementById('popup').style.display = "none";    // 팝업창 아이디
	}
	
	function todaycloseWin() { 
		setCookie("ncookie", "done", 1);     // 저장될 쿠키명 , 쿠키 value값 , 기간( ex. 1은 하루, 7은 일주일)
		document.getElementById('popup').style.display = "none";    // 팝업창 아이디
	}
</script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.carousel-control.left {
	background-image: linear-gradient(to left,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);
}
.carousel-control.right {
	background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);
}
.carousel-control.left:hover {
	background-image: linear-gradient(to left,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);
}
.carousel-control.right:hover {
	background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,0) 100%);
}
</style>
</head>
<body>
<div style="width: 100%;" align="center">
<!-- ####캐러셀시작#### -->
	<div align="center" id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width: auto; margin-top: -51px;">
		<!-- Indicators -->
<!-- 		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			<li data-target="#carousel-example-generic" data-slide-to="4"></li>
		</ol> -->
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" align="center">
			<div class="item active" style="height: 500px;">
				<img src="resources/images/corona19_ad.png" alt="slide1" width="auto" height="auto" style="opacity: 0.7">
			</div>
			<div class="item" style="height: 500px;">
				<img src="resources/images/yoga_ad.png" alt="slide2" width="auto" height="auto" style="opacity: 0.7">
			</div>
			<div class="item" style="height: 500px;">
				<img src="resources/images/health_ad.png" alt="slide3" width="auto" height="auto" style="opacity: 0.7">
			</div>
			<div class="item" style="height: 500px;">
				<img src="resources/images/swim_ad.png" alt="slide4" width="auto" height="auto" style="opacity: 0.7">
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- ####캐러셀끝#### -->
	
	<c:set var="date" value="<%= sf.format(popUpDate) %>"/>
	<!-- ###팝업배너시작### -->
	<div class="col-md-12">
		<c:choose>
			<c:when test="${date >= 15 && date <= 25 }">
				<div id="popup">
					<img class="popupImage" src="resources/images/classApprovalPopup.png">
					<br>
					<span class="col-md-6 closePopup text-left" onclick="closeWin();" style="font-size: 12px; background-color: gold; color: #0034a9;">
						닫기
					</span>
					<span class="col-md-6 todayClosePopup text-right" onclick="todaycloseWin();" style="font-size: 12px; background-color: gold; color: #0034a9;">
						오늘하루 보지않기
					</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="popup col-md-12 row" style="bottom: 15%; visibility: hidden;"></div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- ###팝업배너끝### -->
	
	<div class="col-md-12">
		<div style="height: 350px;"></div>
	</div>
	
	<!-- ####검색창시작#### -->
	<form action="searchPage.do" method="post">
		<div align="center" class="col-md-12 searchWindow">
			<div class="col-md-offset-3 col-md-6 searchTitle">
				<div align="left">
					<span style="font-size: 1.5em; letter-spacing: -3px;">더욱 간편하고 새로워진</span>
					<br>
					<span style="font-size: 2em; letter-spacing: -3px; font-weight: bold;">
						울산KH스포츠센터
					</span>
					<span style="font-size: 2em; letter-spacing: -3px; color: #0034a9; font-weight: bold;">
						강의검색
					</span>
					<span style="font-size: 2em; letter-spacing: -3px; font-weight: bold;">
						서비스
					</span>
				</div>
			</div>
			<div class="col-md-12">
				<div style="height: 10px;"></div>
			</div>
			<div class="col-md-offset-3 col-md-6" style="background-color: #FFCC00; height: 100px;">
				<div style="height: 10px;"></div>
				<div align="left" style="font-size: 1.5em; color: white; font-weight: bold;">
					&nbsp;검색어입력
				</div>
				<div style="height: 5px;"></div>
				<input type="text" autocomplete="off" name="searchWord" style="height: 38.5px; width: 77%; position: relative; top: -1.5px; border: 1px solid white; padding-left: 5px;">
				&emsp;
				<button class="searchBtn" type="submit">
					<img src="resources/images/loupe_wh.png" width="20px">
					검색
				</button>
			</div>
		</div>
	</form>
	<!-- ###검색창끝### -->
</div>
<!-- ###게시판호출### -->
<div class="col-md-12" style="position: relative; top: -50px;">
	<div class="col-md-offset-2 col-md-10">
		<div class="col-md-12">
			<!-- 공지사항시작 -->
			<div class="col-md-3 tab_event_wrap tab_box" style="padding: 10px 10px 0px 10px; margin: 10px;">
				<div class="row">
					<div class="col-md-12" style="background-color: #0034a9; height: 40px;">
						<span style="font-size: 1.5em; color: white; position: relative; top: 5px;">&emsp;공지사항</span>
						<img alt="" src="resources/images/plus_yellow.png" style="width: 11px; position: relative; right: -25px;" class="col-md-offset-7 plusBtn" onclick="location.href='board.do?kindCode=1';">
					</div>
				</div>
				<ul class="noticeList conts_inner">
					<c:forEach items="${selectNoticeList }" var="notice">
						<li>
							<div class="row">
								<div class="col-md-12">
									<a href="boardDetail.do?boardNum=${notice.boardNum }&chkKindCode=${notice.kindOfBoard}&sessionId=${sessionScope.loginInfo.memberId}" class="col-md-7">·　${notice.boardTitle }</a>
									<span class="col-md-offset-1 dateSpan" style="position: relative; top: 6px; left: -10px;">${notice.createDate }</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 공지사항 끝 -->
			<!-- Q&A 시작 -->
			<div class="col-md-3 tab_event_wrap tab_box" style="padding: 10px 10px 0px 10px; margin: 10px;">
				<div class="row">
					<div class="col-md-12" style="background-color: gold; height: 40px;">
						<span style="font-size: 1.5em; color: white; position: relative; top: 5px;">&emsp;Q&amp;A</span>
						<img alt="" src="resources/images/plus_blue.png" style="width: 11px; position: relative; right: -60px;" class="col-md-offset-7 plusBtn" onclick="location.href='board.do?kindCode=3';">
					</div>
				</div>
				<ul class="noticeList conts_inner">
					<c:forEach items="${selectQnaList }" var="qna">
						<li>
							<div class="row">
								<div class="col-md-12">
									<a href="boardDetail.do?boardNum=${qna.boardNum }&chkKindCode=${qna.kindOfBoard}&sessionId=${sessionScope.loginInfo.memberId}" class="col-md-7">·　${qna.boardTitle }</a>
									<span class="col-md-offset-1 dateSpan" style="position: relative; top: 6px; left: -10px;">${qna.createDate }</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- Q&A 끝 -->
			<!-- FAQ 시작 -->
			<div class="col-md-3 tab_event_wrap tab_box" style="padding: 10px 10px 0px 10px; margin: 10px;">
				<div class="row">
					<div class="col-md-12" style="background-color: #0034a9; height: 40px;">
						<span style="font-size: 1.5em; color: white; position: relative; top: 5px;">&emsp;FAQ</span>
						<img alt="" src="resources/images/plus_yellow.png" style="width: 11px; position: relative; right: -60px;" class="col-md-offset-7 plusBtn" onclick="location.href='board.do?kindCode=4';">
					</div>
				</div>
				<ul class="noticeList conts_inner">
					<c:forEach items="${selectFaqList }" var="faq">
						<li>
							<div class="row">
								<div class="col-md-12">
									<a href="boardDetail.do?boardNum=${faq.boardNum }&chkKindCode=${faq.kindOfBoard}&sessionId=${sessionScope.loginInfo.memberId}" class="col-md-7">·　${faq.boardTitle }</a>
									<span class="col-md-offset-1 dateSpan" style="position: relative; top: 6px; left: -10px;">${faq.createDate }</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- FAQ 끝 -->
		</div>
	</div>
</div>
</body>
<!-- js를 사용하기 위한 태그 -->
<script src="resources/js/mainPage.js?ver=7"></script>
</html>