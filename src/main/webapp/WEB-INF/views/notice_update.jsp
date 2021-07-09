<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		function updateChk(frm) {

			var notice_title = frm.notice_title.value;
			var notice_content = frm.notice_content.value;

			notice_content = notice_content.replace(/<p>/gi, '');
			notice_content = notice_content.replace(/<br>/gi, '');
			notice_content = notice_content.replace(/<\/p>/gi, '');
			notice_content = notice_content.replace(/&nbsp;/gi, '');

			if (notice_title.trim() == '') {
				alert("제목을 입력해주세요.");
				return false;
			}
			if (notice_content.trim() == '') {
				alert("내용을 입력해주세요.");
				return false;
			}

			frm.submit();
		}
	</script>

		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				  height: 300,            // 에디터 높이     
				  minHeight: null,        // 최소 높이    
				  maxHeight: null,        // 최대 높이     
				  focus: true,            // 에디터 로딩 후 포커스를 맞출지 여부      
				  lang: "ko-KR"		  // 한글 설정					
			});
		});
		</script>
<body>

	<h1>UPDATE</h1>
	
	<form action="noticeUpdateRes.do" method="post">
		<input type="hidden" name="notice_no" value="${dto.notice_no }" />
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title" value="${dto.notice_title }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" rows="10" cols="60" name="notice_content">${dto.notice_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정" onclick="updateChk(this.form)" />
					<input type="button" value="취소" onclick="location.href='noticeList_category.do?nowPage=1'" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>