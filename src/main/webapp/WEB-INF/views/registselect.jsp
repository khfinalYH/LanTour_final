<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<a href="registerform.do">일반 회원가입</a>
		<a href="registerhost.do">호스트 회원가입</a>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>