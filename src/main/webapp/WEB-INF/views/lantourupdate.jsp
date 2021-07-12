<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			url : "lantourupload.do",
			processData : false,
			contentType : false,
			data : form,
			dataType : "json",
			success : function(msg) {
				$("#lantour_image").val(msg.path)
			},
			error : function() {
				alert("통신 실패");
			}
		})
	}
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1>랜선투어 글수정</h1>
		<form action="./lantourupdateres.do" method="post" enctype ="multipart/form-data">
		<input type ="hidden" name = "member_no" value = "${login.member_no }">
		<input type ="hidden" name = "lantour_rtc" value = "aaa">
		<input type="hidden" id="lantour_image" name="lantour_image" />
		
		<table border="1">
			<tr>
				<th>투어 제목</th>
				<td>
					<input type="text" name="lantour_title" value="${dto.lantour_title}"/>
				</td>
			</tr>
			<tr>
				<th>투어 내용</th>
				<td>
					<input type="text" name="lantour_content" value="${dto.lantour_content}"/>
				</td>
			</tr>
			<tr>
				<th>투어 주소</th>
				<td>
					<input type="text" name="lantour_addr" value="${dto.lantour_addr}"/>
				</td>
			</tr>
			<tr>
				<th>투어 이미지</th>
				
				<td>
					<input type="file" id="file1" name="file1">
					<button type="button" id="img_button" onclick="upload()">사진 업로드</button>
				</td>
			</tr>
			<tr>
				<th>최대 인원</th>
				<td>
					<input type="text" name="lantour_maxcount" value="${dto.lantour_maxcount }">
				</td>
			</tr>
			<tr>
				<th>투어 가격</th>
				<td>
					<input type="text" name="lantour_price" value="${dto.lantour_price}"/>
				</td>
			</tr>
			<tr>
				<th>투어 일정</th>
				<td>
					<input type="text" name="lantour_date">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글 수정" onclick="location.href='lantourinsert.do?lantour_no=${dto.lantour_no}'"/>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>