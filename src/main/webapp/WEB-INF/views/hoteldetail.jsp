<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<img src="${dto.hotel_image }">
	<h3>이름 : ${dto.hotel_title }</h3>
	<h3>호텔 소개 : ${dto.hotel_content }</h3>
	<h3>편의 시설 : ${dto.hotel_addr }</h3>
	<h3>전체 대여 : ${dto.hotel_price }</h3>
	<h3>대여 인원 : ${dto.hotel_maxcount }</h3>
</body>
</html>