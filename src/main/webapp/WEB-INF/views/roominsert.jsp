<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function upload() {
		var form = new FormData();
		form.append("mpfile", $("#file1")[0].files[0])
		$.ajax({
			type : "post",
			enctype : 'multipart/form-data',
			url : "roomupload.do",
			processData : false,
			contentType : false,
			data : form,
			dataType : "json",
			success : function(msg) {
				$("#room_img").prop("src", msg.path);
				$("#room_image").val(msg.path);
			},
			error : function() {
				alert("통신 실패");
			}
		});
	}
</script>
</head>
<body>

	<form action="./roominsertres.do" method="post">
		<input type="hidden" name="hotel_no" value=${hotel_no }>
		<input type="hidden" id="room_image" name="room_image" value="" />
		<table border="1">
			<tr>
				<th>방 내용</th>
				<td>
					<input type="text" name="room_content" />
				</td>
			</tr>
			<tr>
				<th>방 가격</th>
				<td>
					<input type="text" name="room_price" />
				</td>
			</tr>
			<tr>
				<th>방 편의시설</th>
				<td>
					<input type="text" name="room_convinence" />
				</td>
			</tr>
			<tr>
				<th>방 최대인원</th>
				<td>
					<input type="text" name="room_maxcount" />
				</td>
			</tr>
			<tr>
				<th>방 사진</th>
				<td>
					<input type="file" id="file1" />
					<button type="button" onclick="upload()">사진 업로드</button>
				</td>
			</tr>
			<tr>
				<th>사진 미리보기</th>
				<td>
					<img id="room_img" src="" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
				</td>
			</tr>


		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>