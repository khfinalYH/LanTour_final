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
<%List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list"); %>
<%Map<String,String> map = (Map<String,String>)request.getAttribute("map"); %>
<%MemberDto login = (MemberDto)session.getAttribute("login"); %>
<script type="text/javascript">
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

</script>
<h1>후기</h1>
<div>
	<div>
		<div>리뷰 수정</div>
		<form action="hotelReviewUpdateRes.do">
			<input type="hidden" name="hotel_no" value="<%=(int)request.getAttribute("review_no")%>">
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
				<span><textarea rows="10" cols="30" name="review_title"></textarea></span>
			</div>
			<div>
				<input type="submit" value="작성">
			</div>
		</form>
	</div>
</div>
<div>
<%if(list.size()==0){ %>
	<div>리뷰가 존재하지 않습니다</div>
<%}else{ %>
	<%for(ReviewDto dto : list){ %>
		<div>
			<span>작성자 : <%=map.get(""+dto.getMember_no()) %></span>
			<span>점수 : <%=dto.getReview_score() %>/5</span>
			<span>내용 : <%=dto.getReview_title() %></span>
			<span>작성일자 : <%=dto.getReview_date() %></span>
			<%if(login.getMember_no()==dto.getMember_no()){%>
				<input type="button" value="작성" onclick="location.href=''"/>
				<input type="button" value="취소" onclick="location.href=''"/>
			<%} %>
		</div>	
	<%} %>
<%} %>
</div>
</body>
</html>