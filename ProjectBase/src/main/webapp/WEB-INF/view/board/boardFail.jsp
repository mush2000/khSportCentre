<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀글 조회 실패</title>
<script type="text/javascript">
	alert('비밀글 조회 권한이 없습니다');
	location.href = 'board.do?kindCode=' + ${kindInfo.kindCode};
</script>
</head>
<body>

</body>
</html>