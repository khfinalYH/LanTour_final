<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function delete_room() {
		var del = confirm('방 정보를 삭제 하겠습니까? 삭제를 하시면 복구가 불가능 하며 새롭게 등록하셔야 합니다 정말로 삭제하시겠습니까?');
		if (del) {
			$.ajax({
				type: "post",
				url : "./roomdelete.do",
				data:{"room_no":${dto.room_no}},
				dataType:"json",
				success : function (msg) {
					if(msg.check == true){
						alert("삭제 되었습니다");
						location.href = "./hoteldetail.do?hotel_no=${dto.hotel_no }";
					}
				},
				error : function () {
					alert("통신 실패");
				}
			});
		}
	}
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'ko',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE, autoDisplay: false
		}, 'google_translate_element');
	}
</script>
<style type="text/css">
#room-detail {
	margin: auto;
	width: 1000px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="room-detail">
		<img src="${dto.room_image }" style="width: 100%; height: 500px;">
		<div class="input-group">
			<h3>체크인</h3>
			<input class="form-control" style="color: black;" name="check_in" id="date" type="date" />
			<h3>체크 아웃</h3>
			<input class="form-control" style="color: black;" name="check_out" id="date" type="date" />
		</div>
		<div>
			<p>이름 : ${dto.room_name }</p>
			<p>방 소개 : ${dto.room_content } / 인원 : ${dto.room_maxcount }</p>
			<p>편의 시설 : ${dto.room_convinence }</p>
			<p>가격 : ${dto.room_price }</p>
		</div>

		<button type="button" class="btn btn-primary" onclick="delete_room()">방 삭제</button>
		<input type="button" class="btn btn-primary" value="예약" onclick="location.href='reservation.do?type=hotel&no=${dto.hotel_no}&rno=${dto.room_no}'" />
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>