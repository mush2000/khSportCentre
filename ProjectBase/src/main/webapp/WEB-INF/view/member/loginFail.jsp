<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/loginFail.js?ver=1"></script>


</head>
<body>
<div>로그인실패</div>
<input type="hidden" value="${wrongId }" id="wrongId">

</body>
</html>