<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.lan.tour.model.dto.ReservationDto"%>
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
<%List<ReservationDto> Resdto =  (List<ReservationDto>)request.getAttribute("ResDto");%>
<%HotelDto Hdto =  (HotelDto)request.getAttribute("HotelDto");%>
<%RoomDto Roodto =  (RoomDto)request.getAttribute("RoomDto");%>
<%Map<String,Integer> map = (Map<String,Integer>)request.getAttribute("map");%>
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
		<%if(Ldto!=null&&Ldto.getLantour_date().indexOf(',')>0){
			for(int i = 0; i < Ldto.getLantour_date().split(",").length ; i++){
				if(map.get(Ldto.getLantour_date().split(",")[i]) < Ldto.getLantour_maxcount())
				if(i==Ldto.getLantour_date().split(",").length-1){%>
					"<%=Ldto.getLantour_date().split(",")[i]%>"
				<%}else{%>
					"<%=Ldto.getLantour_date().split(",")[i]%>",
				<%}%>
		<%	}
		}%>
]
var disabledDays = [
	<%if(Hdto!=null&&Resdto!=null){
		for(int i = 0; i < Resdto.size(); i++){
			if(i==Resdto.size()-1){%>
				["<%=Resdto.get(i).getReservation_date()%>","<%=Resdto.get(i).getReservation_checkout_date()%>"]
			<%}else{%>
				["<%=Resdto.get(i).getReservation_date()%>","<%=Resdto.get(i).getReservation_checkout_date()%>"],
			<%}%>
	<%	}
	}%>
]


var countmb = [
	<%if(Ldto!=null){%>
		<%for(int i = 0; i < Ldto.getLantour_date().split(",").length ; i++){%>
			<%if(i==Ldto.getLantour_date().split(",").length-1){%>
				<%=map.get(Ldto.getLantour_date().split(",")[i])%>
			<%}else{%>
				<%=map.get(Ldto.getLantour_date().split(",")[i])%>,
			<%}%>
		<%}%>
	<%}%>
	
	
]

$(function() {
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
	
	function disable(date) {
		var m = date.getMonth()+1
		var d = date.getDate();
		if(m<10){
			m = "0"+m
		}
		if(d<10){
			d = "0"+d
		}
		ymd = new Date(date.getFullYear()+"-"+m+"-"+d)
		for(i in disabledDays){
			var date1 = new Date(disabledDays[i][0])
			var date2 = new Date(disabledDays[i][1])
			if(date1 <= ymd&&date2 >ymd)
				return [false];
		}
		return [true];

	}
	
    $( "#datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        reginonal:"ko",
        minDate : 0,
		beforeShowDay: <%if(Ldto!=null){%>available<%}else{%>disable,
		onClose: function() {
			var Dday = new Date($("#datepicker").val())
			var Ldate = new Date(Dday.getFullYear(),Dday.getMonth(), Dday.getDate())
			Ldate.setYear(Ldate.getFullYear()+5)
			for(i in disabledDays){
				var date1 = new Date(disabledDays[i][0])
				if(Dday<date1){
					if(date1<Ldate){
						Ldate = date1
					}
					
				}
			}
			Dday.setDate(Dday.getDate()+1)
			$("#datepicker2").val("")
			$("#datepicker2").removeClass('hasDatepicker').datepicker({
		      dateFormat: 'yy-mm-dd',
		      minDate: Dday,
		      maxDate: Ldate,
		      onClose: function() {
		    	  first = new Date($("#datepicker").val())
		    	  second = new Date($("#datepicker2").val())
		    	  var time = parseInt(second-first)/60/60/24/1000
		    	  alert(time)
		    	  $("#reservation_price").val(time*<%=Roodto.getRoom_price()%>)
		      }
		    })
		}
		<%}%>
		
		
    });
  } );

function count(date){
	<%if(Ldto!=null){%>
	if(enableDay.indexOf(date.value)>=0){
		document.getElementById("countMember").innerText = "잔여인원 : "+countmb[enableDay.indexOf(date.value)]+"/<%=Ldto.getLantour_maxcount()%>"
	}else{
		
	}
	<%}%>
	
}

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
	
	<form action="insertReservation.do" method="post">
	<input type="hidden" name="no" value="<%=Ldto.getLantour_no()%>">
	<input type="hidden" name="rno" value="0">
	<input type="hidden" name="reservation_price" value="<%=Ldto.getLantour_price() %>">
	<input type="hidden" name="member_no" value="<%=Mdto.getMember_no() %>">
	
	<div>
	<span>랜선투어 제목: <%=Ldto.getLantour_title() %></span>
	</div>
	
	<div>
	<span>투어일자 : <%=Ldto.getLantour_date() %> </span>
	</div>
	
	<div>
	<span>예약일자 : <input onchange="count(this)" type="text" id="datepicker" name="reservation_date" readonly="readonly"></span>
	</div>
	
	<div>
	<span>비용 : <%=Ldto.getLantour_price() %></span>
	</div>
	
	<div>
	<span id="countMember">잔여인원을 확인하려면 날짜를 선택해주세요</span>
	</div>
		<input type="submit">
		</form>
	<%}else{ %>
	<form action="insertReservation.do" method="post">
	<input type="hidden" name="no" value="<%=Hdto.getHotel_no()%>">
	<input type="hidden" name="rno" value="<%=Roodto.getRoom_no()%>">
	<input type="hidden" name="member_no" value="<%=Mdto.getMember_no() %>">
	<div>
	<span>호텔 이름: <%=Hdto.getHotel_title() %> </span>
	</div>
	
	<div>
	<span>방 이름 :<%=Roodto.getRoom_content() %> </span>
	</div>
	
	<div>
	<span>체크 인 :<input type="text" id="datepicker" name="reservation_date" readonly="readonly"> </span>
	</div>
	<div>
	<span>체크 아웃 :<input type="text" id="datepicker2" name="reservation_checkout_date" readonly="readonly"> </span>
	
	</div>
	<div>
	<span>비용 : 박 : <%=Roodto.getRoom_price() %> </span>
	</div>
	<div>
	<span>총 비용 : <input type="text" name="reservation_price" id="reservation_price"readonly> </span>
	</div>
			<input type="submit">
	
	</form>
	<%} %>
</div>



</body>
</html>