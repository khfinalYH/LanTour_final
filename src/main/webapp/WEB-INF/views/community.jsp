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

	<h1>정보공유 게시판</h1>
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="500" />
		<col width="100" />
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th colspan="4">------------등록된 게시글이 없습니다-----------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<c:choose>
						<c:when test="${'Y' eq dto.community_delflag}">
							<tr>
								<th colspan="4">------------삭제된 게시글 입니다-----------</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>${dto.community_no }</td>
								<td>${dto.member_name }</td>
								<td>
									<a href="./communitydetail.do?community_no=${dto.community_no } ">${dto.community_title } </a>
								</td>
								<td>
									<fmt:formatDate value="${dto.community_regdate }" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="게시글 등록" onclick="location.href='communityinsert.do'" />
			</td>
		</tr>
	</table>
</body>
</html>