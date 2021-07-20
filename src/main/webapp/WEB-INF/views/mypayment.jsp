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
	<h1>마이 페이지 결제내역</h1>
	
	<form action="./mypayment.do" method="post" >
	<!--  목록 -->
	<div>
	<ul>
		<li ><a href= mypage.do>내정보 확인</a></li>
		<li ><a href= mypageupdate.do>내정보 수정</a></li>
		<li ><a href= mypost.do>내게시글 확인</a></li>
		<li ><a href= mypayment.do>내결제내역 확인</a></li>
		<li ><a href= mytrip.do>내 여행계획 확인</a></li>
	</ul>
	
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
	<jsp:include page="footer.jsp" />
</body>
</html>