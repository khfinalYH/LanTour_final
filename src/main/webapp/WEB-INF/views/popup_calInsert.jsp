<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".cal_insert").click(function(){
		var member_no = $(".member_no").val();
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
        	url: "popupInsertRes.do",
        	data: {
        		"member_no" : member_no,
        		"cal_title" : cal_title,
        		"cal_content" : cal_content,
        		"cal_startdate" : start_dt,
        		"cal_enddate" : end_dt
        	},
        	success: function(){
        		alert("일정이 등록되었습니다.");
        		opener.location.reload();
        		window.close();
        	}
        });

		

	});
	
});
</script>
<body>

	<h1>일정 등록</h1>
	<input type ="hidden" class="member_no" name="member_no" value="${login.member_no }">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" class="cal_title" name="title" placeholder="제목을 입력해주세요"></td>
		</tr>

		<tr>
			<th>시작 날짜</th>
			<td>
				<input type="date" class="start_date">&nbsp;&nbsp;<input type="time" class="start_time">
			</td>
		</tr>
		
		<tr>
			<th>종료 날짜</th>
			<td>
				<input type="date" class="end_date">&nbsp;&nbsp;<input type="time" class="end_time">
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" class="cal_content" name="content" placeholder="내용을 입력해주세요"></textarea></td>
		</tr>
		
	</table>
	<br>
	<input type="button" value="일정 등록" class="cal_insert">
	<input type="button" value="취소" onClick="window.close()">
	

</body>
</html>