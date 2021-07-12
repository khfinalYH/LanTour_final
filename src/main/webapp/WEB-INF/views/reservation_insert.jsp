<%@page import="com.lan.tour.model.dto.RoomDto"%>
<%@page import="com.lan.tour.model.dto.HotelDto"%>
<%@page import="com.lan.tour.model.dto.LantourDto"%>
<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%MemberDto Mdto =  (MemberDto)session.getAttribute("login");%>
<%LantourDto Ldto =  (LantourDto)request.getAttribute("lantourDto");%>
<%HotelDto Hdto =  (HotelDto)request.getAttribute("HotelDto");%>
<%RoomDto Rdto =  (RoomDto)request.getAttribute("RoomDto");%>
<!-- jQuery UI CSS파일  -->  
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
<!--// jQuery UI 라이브러리 js파일 -->
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script type="text/javascript">

var enableDay = [
		<%if(Ldto.getLantour_date().indexOf(',')>0){
			for(int i = 0; i < Ldto.getLantour_date().split(",").length ; i++){
				if(i==Ldto.getLantour_date().split(",").length-1){%>
					"<%=Ldto.getLantour_date().split(",")[i]%>"
				<%}else{%>
					"<%=Ldto.getLantour_date().split(",")[i]%>",
				<%}%>
		<%	}
		}%>
]

$( function() {
	function available(date) {
		var thismonth = date.getMonth()+1;
		var thisday = date.getDate();
		if(thismonth<10){

			thismonth = "0"+thismonth;

		}
		if(thisday<10){
			thisday = "0"+thisday;
		}

	    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
	    if ($.inArray(ymd, enableDay) >= 0) {
	        return [true,"",""];
	    } else {
	        return [false,"",""];
	    }
	}
	
    $( "#datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        reginonal:"ko",
		beforeShowDay: available 
    });
  } );

</script>

</head>
<body>

<h1>예약</h1>

<div>
	<div>
	<span>성명 : <%=Mdto.getMember_name() %></span>
	</div>
	
	<div>
	<span>전화번호 :  <%=Mdto.getMember_phone() %></span>
	</div>
	
	<div>
	<span>이메일 :  <%=Mdto.getMember_email() %></span>
	<input type="button" value="변경" onclick="#">
	</div>
	
	<!-- if -->
	<%if(Ldto !=null){ %>
	<div>
	<span>랜선투어 제목: <%=Ldto.getLantour_title() %></span>
	</div>
	
	<div>
	<span>투어일자 : <%=Ldto.getLantour_date() %> </span>
	</div>
	
	<div>
	<span>예약일자 : <input type="text" id="datepicker" readonly="readonly"></span>
	</div>
	
	<div>
	<span>비용 : </span>
	</div>
	<%}else{ %>
	<!-- else -->
	
	<div>
	<span>호텔 이름: </span>
	</div>
	
	<div>
	<span>방 이름 : </span>
	</div>
	
	<div>
	<span>예약일자 : </span>
	</div>
	
	<div>
	<span>비용 : </span>
	</div>
	<%} %>
		
</div>



</body>
</html>