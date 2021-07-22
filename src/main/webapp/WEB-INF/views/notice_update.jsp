<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
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

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // 에디터 높이     
			minHeight : null, // 최소 높이    
			maxHeight : null, // 최대 높이     
			focus : true, // 에디터 로딩 후 포커스를 맞출지 여부      
			lang : "ko-KR", // 한글 설정					
			placeholder : '내용을 입력해 주세요',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						imgUpload(files[i], this);
					}
				}
			}
		});
	});

	function imgUpload(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "noticeSumImg.do",
			enctype : 'multipart/form-data',
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(data) {
				$(el).summernote('editor.insertImage', data.path);

			},
			error : function() {
				alert("통신 실패");
			}
		});
	}
</script>
<style>
#writeBtn {
	position: absolute;
	right: 5%;
}
</style>
<body>
	<jsp:include page="header.jsp" />

	
	<div class="container">
	<br>
	<h3>공지사항</h3><hr>
	<br>
	<div class="row flex-center mb-5">
	<form action="noticeUpdateRes.do" method="post">
		<input type="hidden" name="notice_no" value="${dto.notice_no }" />
		
		<div class="form-group row">
			
			<div class="col-sm-10">
		    	<input type="text" class="form-control-plaintext"  id="staticEmail" name="notice_title" value="${dto.notice_title }" style="border:1px solid blue;" />
		    </div>
			<br><br><br>
		    <textarea id="summernote" rows="10" cols="60" name="notice_content" >${dto.notice_content }</textarea>
		</div>
		
		
	<br><br>
	<div id="writeBtn">
		<button type="button" class="btn btn-primary btn-sm" onclick="updateChk(this.form)">수정</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='noticeList_category.do?nowPage=1'">취소</button>
	</div>
	</form>
	</div>
	</div>
	

	<jsp:include page="footer.jsp" />
</body>
</html>