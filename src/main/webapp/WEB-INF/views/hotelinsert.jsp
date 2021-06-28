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
		form.append("mpfile",$("#file1")[0].files[0])
		$.ajax({
			type : "post",
			enctype: 'multipart/form-data',
			url : "hotelupload.do",
			processData : false,
			contentType : false,
			data : form ,
			dataType : "json",
			success : function (msg) {
				$("#hotel_img").prop("src",msg.path);
				$("#hotel_image").val(msg.path);
			},
			error : function () {
				alert("통신 실패");
			}
		})
	}
</script>
</head>
<body>

	<h1>숙소 insert, ${login.member_id },${login.member_no }</h1>
	<form action="./hotelinsertres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" id="hotel_image" name="hotel_image" value="aaaaaa" />
		<table border="1">
			<tr>
				<th>숙소 종류</th>
				<td>
					<input type="text" name="hotel_type">
				</td>
			</tr>
			<tr>
				<th>숙소 이름</th>
				<td>
					<input type="text" name="hotel_title">
				</td>
			</tr>
			<tr>
				<th>숙소 설명</th>
				<td>
					<input type="text" name="hotel_content">
				</td>
			</tr>
			<tr>
				<th>숙소 가격</th>
				<td>
					<input type="text" name="hotel_price">
				</td>
			</tr>
			<tr>
				<th>숙소 주소</th>
				<td>
					<input type="text" name="hotel_addr">
				</td>
			</tr>
			<tr>
				<th>숙소 사진</th>
				<td>
					<input type="file" id="file1" name="file1">
					<button type="button" id="img_button" onclick="upload()">사진 업로드</button>
				</td>
			</tr>
			<tr>
				<th>숙소 사진 미리보기</th>
				<td>
					<img id="hotel_img" src=""/>
				</td>
			</tr>
			<tr>
				<th>숙소 편의시설</th>
				<td>
					<input type="text" name="hotel_convinence">
				</td>
			</tr>
			<tr>
				<th>숙소 최대 인원</th>
				<td>
					<input type="text" name="hotel_maxcount">
				</td>
			</tr>
			<tr>
				<th>숙소 쉬는 요일</th>
				<td>
					<input type="text" name="hotel_date">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>