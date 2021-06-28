<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<c:choose>
		<c:when test="${empty roomlist }">
			<h4>등록된 방이 없습니다</h4>
		</c:when>
		<c:otherwise>
			<c:forEach items="${roomlist }" var="dto">
				<img src = "${dto.room_image }">
				<h3>${dto.room_maxcount }인실</h3>
				<h3>${dto.room_price }</h3>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<button type="button" onclick="location.href='./roominsert.do?hotel_no=${dto.hotel_no}'">방등록</button>
</body>
</html>