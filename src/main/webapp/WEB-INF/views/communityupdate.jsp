<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernote js,css 링크 -->
<script type="text/javascript" src="./resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<script type="text/javascript">
	$(function() {
		$('.summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						fileupload(files[i], this);
					}
				}
			}
		});
	})
	function fileupload(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			type : "post",
			enctype : 'multipart/form-data',
			url : "communityupload.do",
			processData : false,
			contentType : false,
			data : data,
			dataType : "json",
			success : function(msg) {
				$(el).summernote('editor.insertImage', msg.path);
			},
			error : function() {
				alert("통신 실패");
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="communityupdateres.do" method="post">
		<input type="hidden" name="community_no" value="${dto.community_no }"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="community_title" value="${dto.community_title }">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" value="${dto.member_name }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="summernote" rows="10" cols="60" name="community_content">${dto.community_content }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">게시글 수정</button>
				</td>
			</tr>


		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>