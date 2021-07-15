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
			<col width="200" />
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>

			<c:choose>
				<c:when test="${empty c_list }">
					<tr>
						<th colspan="3">----작성된 게시글 없음------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${c_list }" var="dto">

						<tr>
							<td>${dto.community_no }</td>
							<td>${dto.community_title }</td>
							<td>${dto.community_regdate }</td>
							<td>
								<c:if test="${dto.community_delflag eq 'Y' }">
									<input type="button" value="복구" onclick="location.href='admincommunity_refaire.do?community_no=${dto.community_no}'" />
								</c:if>
								<input type="button" value="삭제" onclick="location.href='admincommunityAlldelete.do?community_no=${dto.community_no }'" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
	</div>
</body>
</html>