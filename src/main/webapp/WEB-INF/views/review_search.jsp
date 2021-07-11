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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- summernote js,css 링크 -->
<script type="text/javascript" src="./resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="./resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
<script type="text/javascript">
<%List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list"); %>
<%Map<String,String> map = (Map<String,String>)request.getAttribute("map"); %>
<%Map<String,Integer> Smap = (Map<String,Integer>)request.getAttribute("Smap"); %>
<%MemberDto login = (MemberDto)session.getAttribute("login"); %>
<%String type= (String)request.getAttribute("type"); %>
<%String sort= (String)request.getAttribute("sort"); %>
<%DateFormat format = new SimpleDateFormat("yyyy/MM/dd");%>

	$(function() {
		paging(0)
		$('.summernote').summernote({
			placeholder : '후기를 작성해주세요',
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
	}

	
	function paging(i){
		var airplane = document.getElementsByClassName("reviews")
	
		for(var j = 0; j<airplane.length;j++){
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
		write.style.display = "none"
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
	}
	

</script>
<body>

<h1>후기</h1>
<div>
</div>
<div>
	<div>
		<%if(login!=null){ %>
		<div>리뷰 작성 <button id="writeButton" onclick="writeReview()">작성</button></div>
		<div id="writeReview" style="display: none;">
			<form action="ReviewInsert.do">
				<input type="hidden" name="no" value="<%=(int)request.getAttribute("no")%>">
				<input type="hidden" name="type" value="<%=type %>"/>			
				<div>
				<span>별점</span>
				<input type="hidden" value="0" name="review_score" id="starScore">			
				<span id="star1" onclick="starPick(1)">☆</span>
				<span id="star2" onclick="starPick(2)">☆</span>
				<span id="star3" onclick="starPick(3)">☆</span>
				<span id="star4" onclick="starPick(4)">☆</span>
				<span id="star5" onclick="starPick(5)">☆</span>
			</div>
			<div>
					<span>리뷰 내용</span>
					<span><textarea rows="10" cols="30" name="review_title" class="summernote"></textarea> </span>
				</div>
				<div>
					<input type="submit" value="작성">
					<input type="button" value="취소" id="writeButton" onclick="backReview()">
				</div>
			</form>
		</div>
		<%} %>	
	</div>
</div>


<div id="reviewList">
	<form action="reviewsearch.do" method="post">
		<div>
			별점 검색
			<input type="hidden" name="no" value="<%=(int)request.getAttribute("no")%>">
			<input type="hidden" name="type" value="<%=type %>"/>		
		<select name="sort">
				<option <%if(sort.equals("ASC")){ %> selected="selected" <%} %> value="ASC">오름차순</option>
				<option <%if(sort.equals("DESC")){ %> selected="selected" <%} %> value="DESC">내림차순</option>
			</select>
			<input name="star" <%if(Smap.get("zero")==0){ %> checked="checked" <%} %>type="checkbox" value="0">0
			<input name="star"  <%if(Smap.get("one")==1){ %> checked="checked" <%} %>type="checkbox" value="1">1
			<input name="star"  <%if(Smap.get("two")==2){ %> checked="checked" <%} %>type="checkbox" value="2">2
			<input name="star"  <%if(Smap.get("three")==3){ %> checked="checked" <%} %>type="checkbox" value="3">3
			<input name="star"  <%if(Smap.get("four")==4){ %> checked="checked" <%} %>type="checkbox" value="4">4
			<input name="star"  <%if(Smap.get("five")==5){ %> checked="checked" <%} %>type="checkbox" value="5">5
			<input type="submit"/>
			
		</div>
</form>
	
</div>

<%if(list.size()==0){ %>
	<div>리뷰가 존재하지 않습니다</div>
<%}else{ 
	int i = 0;%>
	<%for(ReviewDto dto : list){ %>
		<div class="reviews" id="review<%=i++%>">
			<span>작성자 : <%=map.get(""+dto.getMember_no()) %></span>
			<span>점수 : <%=dto.getReview_score() %>/5</span>
			<span>내용 : <%=dto.getReview_title() %></span>
			<span>작성일자 : <%=format.format(dto.getReview_date()) %></span>
			<%if(login!=null&&login.getMember_no()==dto.getMember_no()){%>
				<input type="button" value="수정" onclick="location.href='ReviewUpdate.do?type=<%=type %>&review_no=<%=dto.getReview_no()%>'"/>
				<input type="button" value="삭제" onclick="location.href='ReviewDelete.do?type=<%=type %>&review_no=<%=dto.getReview_no()%>'"/>
			<%} %>
		</div>	
	<%} %>
		<div id="defaultSearch">
		<%for(int j = 0;j<=list.size()/10;j++){%>
			<span  onclick="paging(<%=j%>)"><a href="#">[<%=j+1 %>]</a></span>
		<% }%>
		</div>
<%} %>


</div>
</body>
</html>