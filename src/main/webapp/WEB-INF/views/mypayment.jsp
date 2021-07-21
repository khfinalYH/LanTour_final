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
	    <a class="nav-link" href="mypost.do">게시글 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="mypayment.do">결제내역 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="mytrip.do?member_no=${login.member_no }">여행일정 확인</a>
	  </li>
	</ul>
	<br><br>
	
	<form action="./mypayment.do" method="post" >
	<!--  목록 -->
	<div>

	
	<table border =1>	
	  	<col width="150" />
		<col width="150" />
		<tr bordercolor="1">
			<th>예약 이름</th>
			<th>결제내역</th>
		</tr>
		<tr>
			<td><a>가나다라</a></td>
			<td><a>100000원</a></td>
		</tr>
	  	
	  		
		
	</table>
	</div>
	</form>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>