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

		<h1>관리자 - 삭제된 글 되돌리기</h1>
		<form action="deletelist.do" method="post">
		<input type="hidden" id="community_boardlist" value="${community_title }">
		
		<table border="1">
			<col width="50"/>
			<col width="500"/>
			<col width="200"/>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			
			<c:choose>
				<c:when test="${empty list }">
				<tr>	
					<th colspan="3">----삭제된 게시글 없음------</th>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
					
						<tr>
							<td>${dto.community_no }</td>
							<td>${dto.community_title }</td>
							<td>${dto.community_regdate }</td>
							<td>
							<input type="button" value="글 복구" onclick="location.href='boardlist.do?community_no=${dto.community_no }'"/>
							</td>
						</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
				
		</table>
	</form>
</body>
</html>