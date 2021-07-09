<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function search() {
		var category = $(".search_category option:selected").val();
		var keyword = $(".search_keyword").val();

		if (keyword.trim() == '') {
			alert('검색어를 입력해주세요.');
			return false;
		}
		location.href = 'noticeList_category.do?category=' + category + '&keyword=' + keyword + '&nowPage=1';
	}
</script>
</head>
<body>
	<c:set var="member_grade" value="${login.member_grade }" />
	
	<h1>공지사항</h1>

	<select class="search_category">
		<option selected value="n_t">제목</option>
		<option value="n_c">내용</option>
		<option value="n_t_c">제목 + 내용</option>
	</select>
	<input type="text" class="search_keyword">
	<button onclick="search();">검색</button>
	
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
	 	<a href="noticeList.do?nowPage=${dto.blockBegin-1}&category=${dto.category}&keyword=${dto.keyword}">◀</a>
	 </c:if>
	

	

	 <c:forEach begin="${dto.blockBegin}" end="${dto.blockEnd}" var="index" >
 	 	<c:choose>
			<c:when test="${dto.nowPage eq index}">
				${index}
			</c:when>
			<c:otherwise>
           		<a href="noticeList_category.do?nowPage=${index}&category=${dto.category}&keyword=${dto.keyword}">${index}</a>
			</c:otherwise>
		 </c:choose>
	  </c:forEach>


	  <c:if test="${dto.nowBlock < dto.totalBlock}">
		    <a href="noticeList.do?nowPage=${dto.blockEnd+1}&category=${dto.category}&keyword=${dto.keyword}">▶</a>
	  </c:if>


</body>
</html>