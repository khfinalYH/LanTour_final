<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1>내 게시글 확인</h1>
	
	<form action="./mypost.do" method="post" >
	<!--  목록 -->
	<div>
	<ul>
		<li ><a href= mypage.do>내정보 확인</a></li>
		<li ><a href= mypageupdate.do>내정보 수정</a></li>
		<li ><a href= mypost.do>내 게시글 확인</a></li>
		<li ><a href= mypayment.do>내결제내역 확인</a></li>
		<li ><a href= mytrip.do>내 여행계획 확인</a></li>
	</ul>
	
	<table>	
		
	</table>
		
	
	</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>