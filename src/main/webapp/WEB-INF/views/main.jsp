<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/currentWeather.js" ></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:if test="${empty login }">
		<a href="loginform.do">로그인</a>
	</c:if>
	<c:if test="${not empty login }">
		<a href="logout.do">로그아웃</a>
	</c:if>


	
	 	<div>
	 	<ul>
		 	<li><a href="memberlist.do">회원관리</a></li>
			<li><a href="boardlist.do">관리자 - 커뮤니티 게시판 글 목록</a></li>
			<li><a href="noticelist.do">관리자 - 공지사항 게시판 글 목록</a></li>
			<li><a href="comment_list.do">관리자 - 정보공유 게시판 글 목록</a></li>
		</ul>
		</div>

	<!-- 일반메뉴 -->
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
	<a href="community.do">정보게시판</a>
	<a href="mypage.do">마이페이지</a>
	
	<a href="noticeList_category.do?nowPage=1">공지사항 게시판</a>
	
	<div id="js-weather"></div>
</body>
</html>