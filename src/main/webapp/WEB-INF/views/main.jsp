<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${empty login }">
		<a href="loginform.do">로그인</a>
	</c:if>
	<c:if test="${not empty login }">
		<a href="logout.do">로그아웃</a>
	</c:if>
	<a href="registerform.do">회원가입</a>
	<a href="registerhost.do">호스트용 회원가입</a>
	<a href="hotellist.do">숙소</a>
	<a href="lantourlist.do">랜선투어</a>
	<a href="airportSearch.do">항공검색</a>
	<a href="rentCarSearch.do">렌트카 검색</a>
	<a href="festival.do">축제 검색</a>
	<a href="sppechR.do">음성 인식</a>
	<a href="tts.do">TTS</a>
	<a href="mypage.do">마이페이지</a>
</body>
</html>