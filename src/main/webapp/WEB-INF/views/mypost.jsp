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
<<<<<<< HEAD
	<jsp:include page="header.jsp" />
	<h1>내 게시글 확인</h1>
=======
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
	</ul>
	<br><br>
>>>>>>> 916538a82aeddeca840884d1ae0ef6c232916df4
	
	<form action="./mypost.do" method="post" >
	<!--  목록 -->
	<div>
<<<<<<< HEAD
	<ul>
		<li ><a href= mypage.do>내정보 확인</a></li>
		<li ><a href= mypageupdate.do>내정보 수정</a></li>
		<li ><a href= mypost.do>내 게시글 확인</a></li>
		<li ><a href= mypayment.do>내결제내역 확인</a></li>
		<li ><a href= mytrip.do>내 여행계획 확인</a></li>
	</ul>
=======

>>>>>>> 916538a82aeddeca840884d1ae0ef6c232916df4
	
	<table>	
		
	</table>
		
	
	</div>
	</form>
<<<<<<< HEAD
	<jsp:include page="footer.jsp" />
=======
</div>
<jsp:include page="footer.jsp" />
>>>>>>> 916538a82aeddeca840884d1ae0ef6c232916df4
</body>
</html>