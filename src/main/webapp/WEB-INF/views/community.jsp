<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		paging(1);
		select_change()
	})
	function search() {
		var search = $("#select_option").val();
		var community_content = $("#community_content").val();
		var url = "";
		if (search == "title"){
			url = "community_titlesearch.do";
		} else if(search == "content"){
			url = "community_contentsearch.do";
		} else {
			url = "community_namesearch.do";
		}
		
		location.href = "./"+url+"?community_content="+community_content;
	}
	function paging(j) {
		var count = ${fn:length(list)} - ((j-1) * 10)
		for(var i = 0; i <= ${fn:length(list)}; i++){
			if(i>count-10&&i<=count){
				$("#"+i).css("display","");
			} else{
				$("#"+i).css("display","none");
			}
		}
	}
	function select_change() {
		var change = $("#select_change").val();
		if(change == ""){
			$("#select_option").val("title").prop("selected",true);
		} else {
			$("#select_option").val(change).prop("selected",true);
		}
	}
</script>
</head>
<body>

	<h1>정보공유 게시판</h1>
	<input type="hidden" id="select_change" value="${filter }"/>
	<select id="select_option">
		<option selected="selected" value="title">제목</option>
		<option value="content">내용</option>
		<option value="name">작성자</option>	
	</select>
	<input type="text"	id="community_content" value="${community_content }"/>
	<button type="button" onclick="search()">검색</button>
	<table id="community_table" border="1">
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
		<c:set var="i" value="${fn:length(list) }" />
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
							<tr id = "${i }" style="display : none">
								<th colspan="4">------------삭제된 게시글 입니다-----------</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr id="${i }"  style="display : none">
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
					<c:set var="i" value="${i - 1 }" />
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="게시글 등록" onclick="location.href='communityinsert.do'" />
			</td>
		</tr>
	</table>
	<c:forEach var="i" begin="0" end="${fn:length(list)/10 }">
		<span onclick="paging(${i+1});">[${i+1 }]</span>
	</c:forEach>
</body>
</html>