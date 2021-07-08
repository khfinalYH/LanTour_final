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
<body>
<%ReviewDto Rdto = (ReviewDto)request.getAttribute("Rdto"); %>
<%MemberDto login = (MemberDto)session.getAttribute("login"); %>
<script type="text/javascript">
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
<h1>후기</h1>
<div>
	<div>
		<div>리뷰 수정</div>
		<form action="hotelReviewUpdateRes.do">
			<input type="hidden" name="review_no" value="<%=Rdto.getReview_no() %>"/>
			<input type="hidden" name="hotel_no" value="<%=Rdto.gethotel_no()%>">
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
				<span><textarea rows="10" cols="30" name="review_title"><%=Rdto.getReview_title() %></textarea></span>
			</div>
			<div>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='hotelreviewlist.do?hotel_no=<%=Rdto.gethotel_no() %>'">
			</div>
		</form>
	</div>
</div>
</body>
</html>