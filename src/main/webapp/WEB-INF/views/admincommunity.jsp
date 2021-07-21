<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">


<style type="text/css">
.admin{
	margin: auto;
	width: 1000px;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />


	<div class="container">
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link" href="adminmember.do">회원관리</a></li>
			<li class="nav-item"><a class="nav-link active" href="admincommunity.do">커뮤니티 게시판 글 목록</a></li>
		</ul>
		<br>
		<table border="1" class="table table-hover text-center" >
			<tr style="background-color: #4582ec; color: #ffffff;">
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">관리</th>
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
									<input type="button" value="복구" class="btn btn-primary btn-sm" onclick="location.href='admincommunity_refaire.do?community_no=${dto.community_no}'" />
								</c:if>
									<input type="button" value="삭제" class="btn btn-primary btn-sm" onclick="location.href='admincommunityAlldelete.do?community_no=${dto.community_no }'" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
	</div>
	<br />
	<br />

	<jsp:include page="footer.jsp" />
</body>
</html>