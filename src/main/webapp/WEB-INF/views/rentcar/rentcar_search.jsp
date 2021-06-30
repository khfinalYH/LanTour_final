<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LanTour</title>
</head>
<body>

<h1>렌트카 검색</h1>

<form action="rentCarList.do">
	<div>
		<select name = "searchtype">
			<option value="entrpsNm">업체명</option>
			<option value="rdnmadr">소재지도로명주소</option>
			<option value="garageRdnmadr">차고지 도로명 주소</option>
			
		</select>
		<input type="text" name="content" >
		<span>차종 검색</span>
		<select name = "cartype">
			<option value="carHoldCo">승용차</option>
			<option value="vansHoldCo">승합차</option>
			<option value="eleCarHoldCo">전기 승용차</option>
			<option value="eleVansCarHoldCo">전기 승합차</option>
		</select>
		
		<input type="submit" value="검색">
		
	</div>

</form>

</body>
</html>