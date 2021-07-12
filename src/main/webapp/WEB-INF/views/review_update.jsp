<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@page import="java.util.Map"%>
<%@page import="com.lan.tour.model.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜선투어</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernote js,css 링크 -->
<script type="text/javascript" src="./resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<script type="text/javascript">
<%ReviewDto Rdto = (ReviewDto)request.getAttribute("Rdto"); %>
<%MemberDto login = (MemberDto)session.getAttribute("login"); %>
<%String type = (String)request.getAttribute("type"); %>
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
	function starPick(star){
		const star1 = document.getElementById("star1")
	    const star2 = document.getElementById("star2")
		const star3 = document.getElementById("star3")
		const star4 = document.getElementById("star4")
		const star5 = document.getElementById("star5")
		var StarScore = document.getElementById("starScore")
		StarScore.value=star
	    switch(star){
	        case 5:
	            star5.innerText = "★"
	        case 4:
	            star4.innerText = "★"
	        case 3:
	            star3.innerText="★"
	        case 2:
	            star2.innerText="★"
	        case 1:
	            star1.innerText="★"
	    }
		switch(star){
	        case 1:
	            star2.innerText="☆"
	        case 2:
	            star3.innerText="☆"
	        case 3:
	            star4.innerText="☆"
	        case 4:
	            star5.innerText="☆"
	    }
	}
	window.onload = function(){
		starPick(<%=Rdto.getReview_score()%>)
	}

</script>
<body>

<h1>후기</h1>
<div>
	<div>
		<div>리뷰 수정</div>
		<form action="ReviewUpdateRes.do">
			<input type="hidden" name="review_no" value="<%=Rdto.getReview_no() %>"/>
			<input type="hidden" name="no" value="<%=Rdto.getHotel_no()==0?Rdto.getLantour_no():Rdto.getHotel_no()%>">
			<input type="hidden" name="type" value="<%=type %>"/>
			<div>
			<span>별점</span>
			<input type="hidden" value="<%=Rdto.getReview_score()%>" name="review_score" id="starScore" >			
			<span id="star1" onclick="starPick(1)">☆</span>
			<span id="star2" onclick="starPick(2)">☆</span>
			<span id="star3" onclick="starPick(3)">☆</span>
			<span id="star4" onclick="starPick(4)">☆</span>
			<span id="star5" onclick="starPick(5)">☆</span>
			</div>
			<div>
				<span>리뷰 내용</span>
				<span><textarea rows="10" cols="30" name="review_title" class="summernote" ><%=Rdto.getReview_title() %></textarea></span>
			</div>
			<div>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='reviewlist.do?type=<%=type %>&no=<%=Rdto.getHotel_no()==0?Rdto.getLantour_no():Rdto.getHotel_no() %>'">
			</div>
		</form>
	</div>
</div>
</body>
</html>