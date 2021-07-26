<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<body>
	<% MemberDto Mdto =  (MemberDto)session.getAttribute("login"); %>
	
<jsp:include page="header.jsp" />
<div class="container">

	<br><br>
	<ul class="nav nav-pills" >
	  <li class="nav-item">
	    <a class="nav-link" href="mypage.do">정보 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="mypageupdate.do">정보 수정</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="mypost.do">게시글 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="mypayment.do">결제내역 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="mytrip.do?member_no=${login.member_no }">여행일정 확인</a>
	    </li>
	    
		  <%if(Mdto.getMember_grade().equals("H")){ %>
		  <li class="nav-item">
		    <a class="nav-link" href="mypagehost.do">호스트 관리</a>
		  </li>
		  <%} %>
	</ul>
	<br><br>
	
	<form action="./mypost.do" method="post" >
	<!--  목록 -->
	<div>


	
	<table>	
		
	</table>
		
	
	</div>
	</form>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>