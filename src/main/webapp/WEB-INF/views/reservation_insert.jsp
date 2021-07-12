<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%MemberDto dto =  (MemberDto)session.getAttribute("login")%>

</head>
<body>

<h1>예약</h1>

<div>
	<div>
	<span>성명 : </span>
	</div>
	
	<div>
	<span>전화번호 : </span>
	</div>
	
	<div>
	<span>이메일 : </span>
	<input type="button" value="변경" onclick="#">
	</div>
	
	<div>
	<span>성명 : </span> 
	</div>
	
	<!-- if -->
	
	<div>
	<span>랜선투어 제목: </span>
	</div>
	
	<div>
	<span>투어일자 : </span>
	</div>
	
	<div>
	<span>예약일자 : </span>
	</div>
	
	<div>
	<span>비용 : </span>
	</div>
	
	<!-- else -->
	
	<div>
	<span>호텔 이름: </span>
	</div>
	
	<div>
	<span>방 이름 : </span>
	</div>
	
	<div>
	<span>예약일자 : </span>
	</div>
	
	<div>
	<span>비용 : </span>
	</div>
	
		
</div>



</body>
</html>