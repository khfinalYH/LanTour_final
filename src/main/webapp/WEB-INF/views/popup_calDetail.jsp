<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".cal_del").click(function(){
			var cal_no = $(this).attr("name");
			
			$.ajax({
				type:"post",
				url: "popupDelete.do",
				data: {
					"cal_no":cal_no
				},
				success: function(){
					alert("일정이 삭제되었습니다.");
					opener.location.reload();
					window.close();
				}
			});
		});
	});
</script>
</head>

<body>

	<h1>일정 디테일</h1>
	<c:set var="startdate" value="${dto.cal_startdate }" />
	<c:set var="enddate" value="${dto.cal_enddate }" />
	
	<form action="popupUpdate.do" method="post">
		<input type ="hidden" class="cal_no" name="cal_no" value="${dto.cal_no }">
		<table>
			<tr>
				<th>제목</th>
				<td>${dto.cal_title }</td>
			</tr>
	
			<tr>
				<th>시작 날짜</th>
				<td>
					${fn:substring(startdate,0,4)}년
					${fn:substring(startdate,5,7)}월
					${fn:substring(startdate,8,10)}일
					${fn:substring(startdate,11,16)}
				</td>
			</tr>
			
			<tr>
				<th>종료 날짜</th>
				<td>
					<c:if test="${not empty dto.cal_enddate}">
						${fn:substring(enddate,0,4)}년
						${fn:substring(enddate,5,7)}월
						${fn:substring(enddate,8,10)}일
						${fn:substring(enddate,11,16)}
					</c:if>
					
					<c:if test="${empty dto.cal_enddate}">
						종료날짜를 등록하지 않았습니다.
					</c:if>
				</td>
			</tr>
	
			<tr>
				<th>내용</th>
				<td>${dto.cal_content }</td>
			</tr>
			
		</table>
		<br>
		<input type="submit" value="일정 수정">
		<input type="button" class="cal_del" name="${dto.cal_no }" value="일정 삭제">
		<input type="button" value="취소" onClick="window.close()">
	</form>
</body>
</html>