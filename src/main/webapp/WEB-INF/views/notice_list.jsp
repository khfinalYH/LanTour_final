<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<td>
							<fmt:formatDate value="${dto.notice_date }" pattern="yyyy-MM-dd" />
						</td>
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
	

	 <c:if test="${dto.nowBlock > 1}">
	 	<a href="noticeList.do?nowPage=${dto.blockBegin-1}">◀</a>
	 </c:if>
	

	 <c:forEach begin="${dto.blockBegin}" end="${dto.blockEnd}" var="index" >
 	 	<c:choose>
			<c:when test="${dto.nowPage eq index}">
				${index}
			</c:when>
			<c:otherwise>
           		<a href="noticeList.do?nowPage=${index}">${index}</a>
			</c:otherwise>
		 </c:choose>
	  </c:forEach>


	  <c:if test="${dto.nowBlock < dto.totalBlock}">
		    <a href="noticeList.do?nowPage=${dto.blockEnd+1}">▶</a>
	  </c:if>


</body>
</html>