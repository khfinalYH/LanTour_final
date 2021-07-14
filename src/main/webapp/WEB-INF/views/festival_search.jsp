<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/festivalSearch.js" ></script>
<script type="text/javascript" src="resources/js/koreaWeather.js" ></script>

</head>
<body>
	<h1>오늘의 날씨</h1>
	<div id="js-weather"></div>
	
	<h3>지역별 축제 정보를 검색하세요!</h3>
	
	<table>
		<tr>
			<th>시작 날짜</th>
			<td>
				<input type="date" id="eventStartDate">
			</td>
		</tr>
		<tr>
			<th>종료 날짜</th>
			<td>
				<input type="date" id="eventEndDate">
			</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>
				<select id="areaCode">
					<option value="" >전국</option>
					<option value="1" >서울</option>
					<option value="2" >인천</option>
					<option value="3" >대전</option>
					<option value="4" >대구</option>
					<option value="5" >광주</option>
					<option value="6" >부산</option>
					<option value="7" >울산</option>
					<option value="8" >세종특별자치시</option>
					<option value="31" >경기도</option>
					<option value="32" >강원도</option>
					<option value="33" >충청북도</option>
					<option value="34" >충청남도</option>
					<option value="35" >경상북도</option>
					<option value="36" >경상남도</option>
					<option value="37" >전라북도</option>
					<option value="38" >전라남도</option>
					<option value="39" >제주도</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>정렬</th>
			<td>
				<select id="arrange">
					<option value="A">제목순</option>
					<option value="B">인기순</option>
					<option value="C">수정일순</option>
					<option value="D">생성일순</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="검색" onclick="festivalSearch();"></td>
		</tr>
	</table>
	
	<br><br><br><br><br><br><br><br>
	
	<div id="festivalSearchList"></div>
	
	<div id="paging"></div>

	<jsp:include page="footer.jsp" />
</body>
</html>