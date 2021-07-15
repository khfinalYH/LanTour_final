<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="869891537807-u606s04umnomhs5tg7sufpd9c5g7fv6a.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="resources/js/currentWeather.js" ></script>
<script type="text/javascript">
	function signOut() {
	  var auth2 = gapi.auth2.getAuthInstance();
	  auth2.signOut().then(function () {
	    console.log('User signed out.');
	  });
    	location.href="logout.do"
	}
	window.onload = function() {
	      gapi.load('auth2', function() {
	        gapi.auth2.init();
	      });
	    }
</script>
<script type="text/javascript" src="resources/js/currentWeather.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:if test="${empty login }">
		<a href="loginform.do">로그인</a>
	</c:if>
	<c:if test="${not empty login }">
		<a href="#" onclick="signOut();">로그아웃</a>
	</c:if>
	
	<!-- 일반메뉴 -->
	<a href="registselect.do">회원가입</a>
	<a href="hotellist.do">숙소</a>
	<a href="lantourlist.do">랜선투어</a>
	<a href="airportSearch.do">항공검색</a>
	<a href="rentCarSearch.do">렌트카 검색</a>
	<a href="festival.do">축제 검색</a>
	<a href="community.do">정보게시판</a>
	<c:if test="${not empty login }">
		<c:choose>
			<c:when test="${login.member_grade == 'A' }">
				<a href="adminmember.do">관리자 페이지</a>
			</c:when>
			<c:otherwise>
				<a href="mypage.do">마이페이지</a>
			</c:otherwise>
		</c:choose>
	</c:if>


	<a href="noticeList_category.do?nowPage=1">공지사항 게시판</a>

	<div id="js-weather"></div>
</body>
</html>