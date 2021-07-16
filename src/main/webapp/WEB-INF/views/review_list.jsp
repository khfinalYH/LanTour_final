<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@page import="java.util.Map"%>
<%@page import="com.lan.tour.model.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜선투어</title>
</head>
<link rel="stylesheet" href="./resources/5/litera/bootstrap.css">
<link rel="stylesheet" href="./resources/_vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/_vendor/prismjs/themes/prism-okaidia.css">
<link rel="stylesheet" href="./resources/_assets/css/custom.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernote js,css 링크 -->
<script type="text/javascript" src="./resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<%List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list"); %>
<%Map<String,String> map = (Map<String,String>)request.getAttribute("map"); %>
<%MemberDto login = (MemberDto)session.getAttribute("login"); %>
<%String type= (String)request.getAttribute("type"); %>
<%DateFormat format = new SimpleDateFormat("yyyy/MM/dd");%>
<script type="text/javascript">
	$(function() {
		<%if(request.getParameter("error")!=null){%>
			alert("작성 실패했습니다. 글자수를 줄여주세요.")
		<%}%>
		
		paging(0)

		$('.summernote').summernote({
			placeholder : '500자 이내로 작성해주세요',
			minHeight : 250,
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
			url : "reviewupload.do",
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
		const StarScore = document.getElementById("starScore")
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
		writeReview()
	}

	
	function paging(i){
		var reviews = document.getElementsByClassName("reviews")
		var page_item = document.querySelectorAll(".page-item")
		for(var j = 0; j<page_item.length;j++){
			if(j==i){
				page_item[j].setAttribute("class", "page-item active" )

			}else{
				page_item[j].setAttribute("class", "page-item" )
				
			}
		}
			
			
			
		for(var j = 0; j<reviews.length;j++){
			if(j>=i*10&&j<(i+1)*10){
				document.getElementById("review"+j).style.display = "block"
			}else{
				document.getElementById("review"+j).style.display = "none"
				
				
			}
		}
	}

	function writeReview(){
		var write = document.getElementById("writeReview")		
		write.style.display = "block"
		var write = document.getElementById("reviewList")		
		var Search = document.getElementById("reviewSearch")
		Search.style.display = "none"
		var write = document.getElementById("writeButton")		
		write.style.display = "none"
	}

	function backReview(){
		var write = document.getElementById("writeReview")		
		write.style.display = "none"
		var write = document.getElementById("reviewList")		
		write.style.display = "block"
		var write = document.getElementById("writeButton")		
		write.style.display = "block"
		var Search = document.getElementById("reviewSearch")
		Search.style.display = "block"
	}
	
	function ReviewSort(ele){
		document.getElementById("defaultSearch").style.display = "none"
		if(ele.value=="asc"){
			
		}
		if(ele.value=="desc"){
			
		}

	}
	

</script>
<body>
<div>
<span></span>
</div>

<div class="bs-docs-section">
	<div class="bs-component card border-secondary mb-3">
		<%if(login!=null){ %>		
		<form action="ReviewInsert.do" method="post">
			<input type="hidden" name="no" value="<%=(int)request.getAttribute("no")%>">
			<input type="hidden" name="type" value="<%=type %>"/>			
			<div class="card-header">
				<h3>평가하기</h3>
			</div>
			<div class="card-body">
				<h6>다른 사용자에게 의견을 들려주세요</h6>
				<h3>
					<input type="hidden" value="0" name="review_score" id="starScore">			
					<span id="star1" onclick="starPick(1)"> ☆ </span>
					<span id="star2" onclick="starPick(2)"> ☆ </span>
					<span id="star3" onclick="starPick(3)"> ☆ </span>
					<span id="star4" onclick="starPick(4)"> ☆ </span>
					<span id="star5" onclick="starPick(5)"> ☆ </span>
				</h3>
				<input type="button" class="btn btn-primary" id="writeButton" value="리뷰 작성하기" onclick="writeReview()">
				<div id="writeReview" style="display: none;">
					<div>
						<span><textarea rows="10" cols="30" name="review_title" class="summernote"></textarea> </span>
					</div>
					<div>
						<input type="submit" class="btn btn-primary" value="작성">
						<input type="button" class="btn btn-primary" value="취소" id="writeButton" onclick="backReview()">
					</div>
				</div>
			</div>
		</form>
		
		<%} %>	
	</div>
	<div style="width: 50%; display: inline;" id="reviewSearch">
		<form action="reviewsearch.do" method="post">
			<div>
				<input type="hidden" name="no" value="<%=(int)request.getAttribute("no")%>">
				<input type="hidden" name="type" value="<%=type %>"/>		
				<div class="bs-component mb-5">
					<div>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="0"><label class="form-check-label"  > 0</label>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="1"><label class="form-check-label"  > 1</label>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="2"><label class="form-check-label"  > 2</label>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="3"><label class="form-check-label"  > 3</label>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="4"><label class="form-check-label"  > 4</label>
						<input type="checkbox" class="form-check-input" checked="checked" name = "star" value="5"><label class="form-check-label"  > 5</label>
					</div >
					<select class="form-select" name="sort" style="width: 30%; display: inline;">
						<option value="ASC">오름차순</option>
						<option value="DESC">내림차순</option>
					</select>
					<input type="submit" class="btn btn-primary" value="검색"/>
				</div>
			</div>
		</form>
	</div>
	
	
</div>

<div id="reviewList">

<div class="bs-docs-section">
<%if(list.size()==0){ %>
	<div>리뷰가 존재하지 않습니다</div>
<%}else{ 
	int i = 0;%>
	<%for(ReviewDto dto : list){ %>
		<div class="reviews" id="review<%=i++%>">
			<div class="bs-component card border-secondary mb-3">
				<div class="card-header">
					<span><b><%=map.get(""+dto.getMember_no()) %></b></span>
					<span style="position: absolute; right: 0; margin-right: 20px">
					<input type="button" class="btn btn-primary" value="수정" onclick="location.href='ReviewUpdate.do?type=<%=type %>&review_no=<%=dto.getReview_no()%>'"/>
					<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='ReviewDelete.do?type=<%=type %>&review_no=<%=dto.getReview_no()%>'"/>	
					</span>
					<br/>
					<span><%for(int k=0; k < dto.getReview_score();k++){%>★<%} %><%for(double k= (5-dto.getReview_score()) ; k > 0;k--){%>☆<%} %></span>
					<span><%=format.format(dto.getReview_date()) %></span>	
				</div>
				<div class="card-body">
					<span class="card-text"><%=dto.getReview_title() %></span>
				</div>
			</div>
			<%if(login!=null&&login.getMember_no()==dto.getMember_no()){%>
			<%} %>
		</div>	
	<%} %>
		<div id="defaultSearch" style="margin-left:50% ">
			<ul class="pagination pagination-sm">
			<%for(int j = 0;j<=list.size()/10;j++){%>
				<li class="page-item" onclick="paging(<%=j%>)"><a class="page-link" href="#"><%=j+1 %></a></li>						
			<% }%>
			</ul>
		</div>
<%} %>
</div>

</div>
</body>
</html>