<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:set var="member_grade" value="${login.member_grade }" />

	<h1>DETAIL</h1>
	
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${dto.notice_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div>${dto.notice_content }</div></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<c:if test="${member_grade == 'A' }">
					<input type="button" value="수정" onclick="location.href='noticeUpdateForm.do?notice_no=${dto.notice_no}'" />
					<input type="button" value="삭제" onclick="location.href='noticeDelete.do?notice_no=${dto.notice_no}'" />
					</c:if>
					<input type="button" value="목록" onclick="location.href='noticeList_category.do?nowPage=1'" />
				</td>
			</tr>
		</table>
	<jsp:include page="footer.jsp" />
</body>	
</html>