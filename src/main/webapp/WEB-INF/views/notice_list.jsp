<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="member_grade" value="${login.member_grade }" />
	
	<h1>공지사항</h1>
	
	<table border="1">
		<col width="50" />
		<col width="500" />
		<col width="100" />
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="3">----작성된 글이 없습니다---</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.notice_no }</td>
						<td><a href="noticeSelectOne.do?notice_no=${dto.notice_no }">${dto.notice_title }</a></td>
						<td>${dto.notice_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<c:if test="${member_grade == 'A' }">
			<td colspan="4" align="right"><input type="button" value="글작성" onclick="location.href='noticeInsertForm.do'" /></td>
			</c:if>
		</tr>
	</table>


</body>
</html>