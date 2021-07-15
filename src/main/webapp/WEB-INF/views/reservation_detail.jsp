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
<%LantourDto Ldto =  (LantourDto)request.getAttribute("Ldto");%>
<%HotelDto Hdto =  (HotelDto)request.getAttribute("Hdto");%>
<%RoomDto Roodto =  (RoomDto)request.getAttribute("Roodto");%>
<%ReservationDto Resdto = (ReservationDto)request.getAttribute("Resdto"); %>
<!-- // jQuery 기본 js파일 -->
<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
<script
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
//결제
window.onload = function(){

	IMP.init("imp73387015")
}


function payment(){
	var pgtype =  document.getElementById("paymethod")
	var pgvalue = pgtype.options[pgtype.selectedIndex].value
	var Merchant_uid = 'merchant_' + new Date().getTime()
	IMP.request_pay({
	    pg : pgvalue,
	    pay_method : 'card',
	    merchant_uid : Merchant_uid,
	    name : '주문명:결제테스트',
	    amount : <%=Resdto.getReservation_price()%>,
	    buyer_email : '<%=Mdto.getMember_email()%>',
	    buyer_name : '<%=Mdto.getMember_name()%>',
	    buyer_tel : '<%=Mdto.getMember_phone()%>'
	    }, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "payments.do", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {imp_uid : rsp.imp_uid},
	    		success: function(data){
	    			alert(data.status)
	    			if (data.status =="paid" ) {
		    			location.href="reservation_pay.do?no=<%=Resdto.getReservation_no()%>&m_id="+Merchant_uid
	    			}
	    			
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}


</script>
</head>
<body>

<h1>예약 확인</h1>

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
	<div>
	<span>랜선투어 제목: <%=Ldto.getLantour_title() %></span>
	</div>
	
	<div>
	<span>투어일자 : <%=Ldto.getLantour_date() %> </span>
	</div>
	
	<div>
	<span>예약일자 : <%=Resdto.getReservation_date() %></span>
	</div>
	
	<div>
	<span>비용 : <%=Ldto.getLantour_price() %></span>
	</div>
	
	<div>
	<span>잔여인원 : <%=(int)request.getAttribute("date") %>/<%=Ldto.getLantour_maxcount() %></span>
	</div>
		</form>
	<%}else{ %>
	<div>
	<span>호텔 이름: <%=Hdto.getHotel_title() %> </span>
	</div>
	
	<div>
	<span>방 이름 :<%=Roodto.getRoom_content() %> </span>
	</div>
	
	<div>
	<span>예약일자 :  <%=Resdto.getReservation_date() %></span>
	</div>
	
	<div>
	<span>비용 : <%=Roodto.getRoom_price() %> </span>
	</div>
	
	<%} %>
</div>
<%if(Resdto.getReservation_pay().equals("N")){ %>
<div id="pay">
결제방식 : <select id="paymethod">
	<option value="kakaopay">카카오 페이</option>
	<option value="html5_inicis">일반 웹결제</option>
</select>
<input type='button' value='결제' onclick='payment()'>
<%}else if(!Resdto.getReservation_pay().equals("cancelled")){ %>
<input type="button" value="결제 취소" onclick="location.href='canclepay.do?no=<%=Resdto.getReservation_no()%>&id=<%=Resdto.getReservation_pay()%>'">
<%} %>
</div>





</body>
</html>