<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:set var="findId" value="${id }" />
	
	<br><br>
	<div class="container">
	<c:if test="${not empty findId }">
		<h3 style="text-align: center;">찾으시는 id는 ${id }입니다</h3>
	</c:if>
	<c:if test="${empty findId }">
		<h3 style="text-align: center;">등록된 정보가 없습니다.</h3>
	</c:if>
	<br><br>
	<button type="button" class="btn btn-primary" onclick="location.href='./loginform.do'" style="float: right;">로그인 페이지로 돌아가기</button>

	
	
	</div>
	
	<br><br>
	<jsp:include page="footer.jsp" />
</body>
</html>