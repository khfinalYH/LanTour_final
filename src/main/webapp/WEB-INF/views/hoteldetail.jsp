<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function delete_hotel() {
		var del = confirm('호텔 정보를 삭제 하겠습니까? 삭제를 하시면 복구가 불가능 하며 새롭게 등록하셔야 합니다 정말로 삭제하시겠습니까?');
		if(del){
			location.href="./hoteldelete.do?hotel_no=${dto.hotel_no }"; 
		}
	}
	function update_hotel() {
		var update = confirm("호텔 정보를 수정하시겠습니까?")
		if(update){
			location.href="./hotelupdate.do?hotel_no=${dto.hotel_no }";
		}
	}
</script>
</head>
<body>

	<img src="${dto.hotel_image }">
	<div>
		<h3>체크인</h3>
		<input type="date" name="check_in">
		<h3>체크 아웃</h3>
		<input type="date" name="check_out">
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229057490b6a5d6e3ee6c840c9390879&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${dto.hotel_addr }',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${dto.hotel_title}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	<h3>이름 : ${dto.hotel_title }</h3>
	<h3>호텔 소개 : ${dto.hotel_content }</h3>
	<h3>편의 시설 : ${dto.hotel_addr }</h3>
	<h3>전체 대여 : ${dto.hotel_price }</h3>
	<h3>대여 인원 : ${dto.hotel_maxcount }</h3>
	<c:choose>
		<c:when test="${empty roomlist }">
			<h4>등록된 방이 없습니다</h4>
		</c:when>
		<c:otherwise>
			<c:forEach items="${roomlist }" var="dto">
				<img src="${dto.room_image }">
				<h3>
					<a href="./roomdetail.do?room_no=${dto.room_no }">${dto.room_maxcount }인실</a>
				</h3>
				<h3>${dto.room_price }</h3>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<button type="button" onclick="location.href='./roominsert.do?hotel_no=${dto.hotel_no}'">방등록</button>
	<button type="button" onclick="update_hotel();">정보 수정</button>
	<button type="button" onclick="delete_hotel();">등록된 호텔 삭제</button>
	<br/>
	<embed height="400px" width="680" src="http://localhost:8787/tour/reviewlist.do?type=hotel&no=${dto.hotel_no}" ></embed>
	
</body>
</html>