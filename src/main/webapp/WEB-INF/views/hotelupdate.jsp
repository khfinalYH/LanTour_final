<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function upload() {
		var form = new FormData();
		form.append("mpfile", $("#file1")[0].files[0])
		$.ajax({
			type : "post",
			enctype : 'multipart/form-data',
			url : "hotelupload.do",
			processData : false,
			contentType : false,
			data : form,
			dataType : "json",
			success : function(msg) {
				$("#hotel_img").prop("src", msg.path);
				$("#hotel_image").val(msg.path);
			},
			error : function() {
				alert("통신 실패");
			}
		})
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
					}
				}).open();
	}
</script>
</head>
<body>
	<h1>숙소 update, ${login.member_id },${login.member_no }</h1>
	<form action="./hotelupdateres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hotel_no" value="${dto.hotel_no }" />
		<input type="hidden" id="hotel_image" name="hotel_image" value="${dto.hotel_image }" />
		<table border="1">
			<tr>
				<th>숙소 종류</th>
				<td>
					<input type="text" name="hotel_type" value="${dto.hotel_type }">
				</td>
			</tr>
			<tr>
				<th>숙소 이름</th>
				<td>
					<input type="text" name="hotel_title" value="${dto.hotel_title }">
				</td>
			</tr>
			<tr>
				<th>숙소 설명</th>
				<td>
					<input type="text" name="hotel_content" value="${dto.hotel_content }">
				</td>
			</tr>
			<tr>
				<th>숙소 가격</th>
				<td>
					<input type="text" name="hotel_price" value="${dto.hotel_price }">
				</td>
			</tr>
			<tr>
				<th>숙소 주소</th>
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="sample6_address" name="hotel_addr" placeholder="주소" value="${dto.hotel_addr }">
					<br>
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
					<img id="hotel_img" src="${dto.hotel_image }" />
				</td>
			</tr>
			<tr>
				<th>숙소 편의시설</th>
				<td>
					<input type="text" name="hotel_convinence" value="${dto.hotel_convinence }">
				</td>
			</tr>
			<tr>
				<th>숙소 최대 인원</th>
				<td>
					<input type="text" name="hotel_maxcount" value="${dto.hotel_maxcount }">
				</td>
			</tr>
			<tr>
				<th>숙소 쉬는 요일</th>
				<td>
					<input type="text" name="hotel_date" value="${dto.hotel_date }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>