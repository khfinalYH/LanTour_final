<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
	<img src="${dto.room_image }">
	<h3>대여 인원 : ${dto.room_maxcount }</h3>
	<h3>방 소개 : ${dto.room_content }</h3>

	<button type="button" onclick="delete_room()">방 삭제</button>
	<button type="button" onclick="">예약하기</button>
</body>
</html>