<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".cal_update").click(function(){
			var cal_no = $(".cal_no").val();
			var cal_title = $(".cal_title").val();
			var start_date = $(".start_date").val();
			var start_time = $(".start_time").val();
			var end_date = $(".end_date").val();
			var end_time = $(".end_time").val();
			var cal_content = $(".cal_content").val();
			
			if(start_time != '') {
				start_time = 'T' + start_time;
			}		
			if(end_time != '') {
				end_time = 'T' + end_time;
			}
			
			var start_dt = start_date + start_time
			var end_dt = end_date + end_time
			
			
			var startArray = start_date.split('-');
			var endArray = end_date.split('-');   
			var start_date = new Date(startArray[0], startArray[1], startArray[2]);
	        var end_date = new Date(endArray[0], endArray[1], endArray[2]);

	        if(start_date.getTime() > end_date.getTime()) {
	        	alert("종료날짜보다 시작날짜가 작아야합니다.");
	            return false;
	        }

	        if (cal_title.trim() == "") {
	        	alert("제목을 입력해주세요");
	            return false;
	        }

	        if (!Date.parse(start_date)) {
	        	alert("시작날짜를 입력해주세요");
	            return false;
	        }
	        
	        $.ajax({
	        	type:"post",
	        	url: "popupUpdateRes.do",
	        	data: {
	        		"cal_no" : cal_no,
	        		"cal_title" : cal_title,
	        		"cal_content" : cal_content,
	        		"cal_startdate" : start_dt,
	        		"cal_enddate" : end_dt
	        	},
	        	success: function(){
	        		alert("일정이 수정되었습니다.");
	        		opener.location.reload();
	        		window.close();
	        	}
	        });
		});
	});
</script>
</head>

<body>

	<h1>일정 수정</h1>
	<c:set var="startdate" value="${dto.cal_startdate }" />
	<c:set var="enddate" value="${dto.cal_enddate }" />

<input type ="hidden" class="cal_no" name="cal_no" value="${dto.cal_no }">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" class="cal_title" name="title" value="${dto.cal_title }"></td>
		</tr>

		<tr>
			<th>시작 날짜</th>
			<td>
				<input type="date" class="start_date" value="${fn:substring(startdate,0,10) }">&nbsp;&nbsp;<input type="time" class="start_time" value="${fn:substring(startdate,11,19) }">
			</td>
		</tr>
		
		<tr>
			<th>종료 날짜</th>
			<td>
				<input type="date" class="end_date" value="${fn:substring(enddate,0,10) }">&nbsp;&nbsp;<input type="time" class="end_time" value="${fn:substring(enddate,11,19) }">
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" class="cal_content" name="content">${dto.cal_content }</textarea></td>
		</tr>
		
	</table>
	<br>
	<input type="button" class="cal_update" value="일정 수정">
	<input type="button" value="취소" onClick="window.close()">

</body>
</html>