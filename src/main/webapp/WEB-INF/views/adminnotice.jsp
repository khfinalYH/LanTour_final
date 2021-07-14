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

	<div>
		<ul id="menu">
			<li><a href="adminmember.do">회원관리</a></li>
			<li><a href="admincommunity.do">관리자 - 커뮤니티 게시판 글 목록</a></li>
			<li><a href="adminnotice.do">관리자 - 공지사항 게시판 글 목록</a></li>
		</ul>
	</div>
	
	<div>
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
				<c:when test="${empty n_list }">
					<tr>
						<th colspan="3">----작성된 게시글 없음------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${n_list }" var="dto">

						<input type="hidden" name="notice_no" value="${dto.notice_no }">
						<tr>
							<td>${dto.notice_no }</td>
							<td>${dto.notice_title }</td>
							<td>${dto.notice_date }</td>
							<td>
								<input type="submit" value="수정" />
							</td>
							
						</tr>
						
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
	</div>
</body>
</html>