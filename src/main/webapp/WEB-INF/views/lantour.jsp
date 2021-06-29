<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>랜선투어</h1>
	<table border="1">
		<col width="50"/>
		<col width="150"/>
		<col width="500"/>
		<col width="150"/>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<th colspan="4">------------작성된 글이 없습니다------------</th>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.lantour_no }</td>
					<td><a href="./lantourdetail.do?lantour_no=${dto.lantour_no }">${dto.lantour_title }</a></td>
					<td>${dto.lantour_content }</td>
					<td>${dto.lantour_regdate }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="투어 등록" onclick="location.href='./lantourinsert.do'"/>
			</td>
		</tr>	
	</table>
	
	
	
	
</body>
</html>