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

	<h1>숙소 list</h1>
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="500" />
		<col width="100" />
		<tr>
			<th>번호</th>
			<th>장소</th>
			<th>호텔명</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr >
					<th colspan="4">------------등록된 숙소가 없습니다-----------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.hotel_no }</td>
						<td>${dto.hotel_addr }</td>
						<td><a href="./hoteldetail.do?hotel_no=${dto.hotel_no } ">${dto.hotel_title } </a></td>
						<td>${dto.hotel_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="숙소 등록" onclick="location.href='./hotelinsert.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>