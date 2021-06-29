<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<% String contentid = (String)request.getAttribute("contentid"); %>
<input type="hidden" id="contentid" value="<%= contentid%>">
<% String eventstartdate = (String)request.getAttribute("eventstartdate"); %>
<% String eventenddate = (String)request.getAttribute("eventenddate"); %>



<section>
	<div>
		<h2 id="festivaltitle"></h2>
		<img id="festivalimg" alt="img" src="">
		<p id="festivalsummary">개요</p>		
	</div>
	
	<table class="table">
			<thead>
				<tr>
					<th class="text-center" colspan="2" scope="col"><p>상세정보</p></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><p>시작일</p></th>
					<td><p><%= eventstartdate%></p></td>
				</tr>
				<tr>
					<th scope="row"><p>종료일</p></th>
					<td><p><%= eventenddate%></p></td>
				</tr>
				<tr>
					<th scope="row"><p>전화번호</p></th>
					<td><p id="festivaltel"></p></td>
				</tr>
				<tr>
					<th scope="row"><p>홈페이지</p></th>
					<td><p id="festivallink"></p></td>
				</tr>
				<tr>
					<th scope="row"><p>주소</p></th>
					<td><p id="festivaladdr"></p></td>
				</tr>
			</tbody>
		</table>
	<div id="map" style="width: 50%; height: 350px;"></div>

</section>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e46f4369a17cbff96a1aa064dd171ad2"></script>
<script type="text/javascript">
	window.onload = function(){
		
		var contentid = $('#contentid').val();
		
		$.ajax({
			url: './festivaldetaillist.do',
			type: 'GET',
			data: {
				 'contentid': contentid
			 },
			 dataType: 'json',
			 success: function(data) {
				 var myData = data.response.body.items.item;
				 
				 addr1 = myData.addr1;
				 firstimage = myData.firstimage;
				 homepage = myData.homepage;
				 mapx = myData.mapx;
				 mapy = myData.mapy;
				 mlevel = myData.mlevel;
				 overview = myData.overview;
				 tel = myData.tel;
				 telname = myData.telname;
				 title = myData.title;

				 document.getElementById("festivaltitle").innerHTML = title; 
				 var festivalimg = $('#festivalimg');
				 festivalimg.attr('src', firstimage);
				 document.getElementById("festivalsummary").innerHTML = overview;
				 document.getElementById("festivaltel").innerHTML = telname + "(" + tel + ")";
				 document.getElementById("festivallink").innerHTML = homepage;
				 document.getElementById("festivaladdr").innerHTML = addr1;

				 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

					mapOption = { 
					    center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					//마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(mapy, mapx); 
					
					//마커를 생성합니다
					var marker = new kakao.maps.Marker({
					position: markerPosition
					});
					
					//마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
			 },
			 error: function() {
				 alert("통신 실패");
			 }
		});
	}
</script>	
	




</body>
</html>