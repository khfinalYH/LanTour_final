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

	<h1>관리자 - 정보공유게시판 출력</h1>
		<input type="hidden"  value="${comment_title }">
		<table border="1">
			<col width="50"/>
			<col width="500"/>
			<col width="100"/>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
				<tr>	
					<th colspan="3">----작성된 게시글 없음------</th>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
					
					<form action="commentlist.do" method="post">
						<input type="hidden" name="comment_no" value="${dto.comment_no }">
						<tr>
							<td>${dto.comment_no }</td>
							<td>${dto.comment_contnet }</td>
							<td>${dto.comment_date }</td>
							<td>
								<input type="submit" value="수정"/>
							</td>
						</tr>
					</form>
				</c:forEach>
			</c:otherwise>
		</c:choose>
				
		</table>


</body>
</html>