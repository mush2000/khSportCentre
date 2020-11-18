<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/searchPage.css?ver=26"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Jquey를 사용을 위한 태그 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="col-md-12">
	<div class="col-md-offset-2 col-md-8">
		<c:choose>
			<c:when test="${empty searchClassList }">
				<div style="font-size: 2em">
					· 검색결과 : 총 ${listTotalCnt }건
				</div>
				<div style="height: 10px;"></div>
				<div class="tab-content search_content">
					<div class="listBox col-md-12 text-center">
						<span style="font-size: 2em;">
							본 관에서 진행되지 않는 강의이거나 잘못된 검색어 입니다.<br>
							검색어를 다시 확인 해주세요.
						</span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div style="font-size: 2em">
					· 검색결과 : 총 ${listTotalCnt }건<%-- ${fn:length(searchClassList)}건 --%>  
				</div>
				<div style="height: 10px;"></div>
				<c:forEach items="${searchClassList }" var="search">
					<div class="tab-content search_content">
						<div class="listBox col-md-12"  onmouseover="this.style.background='#eeeeee';" onmouseleave="this.style.background='white';">
							<div class="listTit col-md-3 text-center" style="padding-right: 30px;">
								<h2>${search.classesName }</h2><br>
								<h4>강의개시월 : ${search.classStartDate }</h4>	  		
							</div>
							<div class="listInfo col-md-7">
								<h4>
									<c:set var="nowDate" value="<%= sf.format(nowDate) %>"/>
									<c:choose>
										<c:when test="${nowDate > search.classDate }">
											&emsp;&nbsp;<span style="background-color: gray; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">이미 시작된 강의이거나 종료된 강의입니다.</span>
										</c:when>
										<c:when test="${nowDate > search.classApplyEnd }">
											· 모집기간 : ${search.classApplyStart } ~ ${search.classApplyEnd }
											&emsp;&emsp;
											<span style="background-color: gray; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">모집기간초과</span>
										</c:when>
										<c:when test="${search.maxMember > search.regMemberCnt }">
											· 모집기간 : ${search.classApplyStart } ~ ${search.classApplyEnd }
											&emsp;&emsp;
											<span style="background-color: #0404B4; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">모집중</span>
										</c:when>
										<c:when test="${search.maxMember < search.regMemberCnt }">
											· 모집기간 : ${search.classApplyStart } ~ ${search.classApplyEnd }
											&emsp;&emsp;
											<span style="background-color: gray; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">모집마감</span>
										</c:when>
										<c:when test="${search.maxMember == search.regMemberCnt }">
											· 모집기간 : ${search.classApplyStart } ~ ${search.classApplyEnd }
											&emsp;&emsp;
											<span style="background-color: gray; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">모집마감</span>
										</c:when>
										<c:otherwise>
											· 모집기간 : ${search.classApplyStart } ~ ${search.classApplyEnd }
											&emsp;&emsp;
											<span style="background-color: #0404B4; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">모집중</span>
										</c:otherwise>
									</c:choose>
									<c:if test="${nowDate < search.classApplyEnd && search.minMember > search.regMemberCnt }">
										<span style="background-color: #DF0101; font-weight: lighter; font-size: 12px; color: white; padding: 5px; border-radius: 5px; height: 35px;">최소인원미달</span>
									</c:if>
								</h4>
								<ul class="list col-md-6">
								<li>강의요일 : ${search.classDay }</li>		   							   					
								<li>수강료 : 					
									<c:choose>
										<c:when test="${search.classDay eq '화목' }">
											<fmt:formatNumber value="${search.classesFee / 100 * 0.7 }" pattern="0"/>00원
										</c:when>
										<c:otherwise>
											${search.classesFee }원
										</c:otherwise>					
									</c:choose>
								</li>
								<li>　</li>
								</ul>
								<ul class="list col-md-6">		   					
								<li>수강신청인원 : ${search.regMemberCnt }명 / ${search.maxMember }명</li>		   					
								<li>강의실 : ${search.placeName }</li>
								<li>　</li>
								</ul>	   
							</div>
							<div class="col-md-2">
								<input type="button" class="btn listBtn" style="height: 35px;" value="상세보기" onclick="location.href='classesDetail.do?classesCode=${search.classesCode }';">
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<!-- pagination{s} -->
		<div id="paginationBox" align="center">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item">
						<span class="pagePrev" 
							data-page="${pagination.range}" 
							data-range="${pagination.range}" 
							data-rangeSize="${pagination.rangeSize}"
							data-searchWord="${searchWord}"
						>Prev</span>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class='page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/>'>    
						<span class="pageNum" 
							data-page="${idx}" 
							data-range="${pagination.range}" 
							data-rangeSize="${pagination.rangeSize}"
							data-searchWord="${searchWord}"
						> ${idx} </span>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item">
						<span class="pageNext" 
							data-page="${pagination.range}" 
							data-range="${pagination.range}" 
							data-rangeSize="${pagination.rangeSize}"
							data-searchWord="${searchWord}"
						>Next</span>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->

	</div>
</div>
</body>
<script src="resources/js/searchPage.js?ver=4"></script>
</html>