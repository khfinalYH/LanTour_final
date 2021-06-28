<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<% List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");  %>


<h1>항공 검색</h1>

<form action="airplaneList.do">
	<div>
		<sapn>출발 공항</sapn>
		<select name = "depAirportId">
		<%for(Map<String, String> map : list){ %>
			<option value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<sapn>도착 공항</sapn>
		<select name = "arrAirportId">
		<%for(Map<String, String> map : list){ %>
			<option value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<sapn>출발일자</sapn>
		<input type="date" name="date" >
		<span>출발 시간</span>
		<select name="time">
			<option value="">전체조회</option>
			<option value="00000600">00:00 ~ 06:00</option>
			<option value="06000900">06:00 ~ 09:00</option>
			<option value="09001200">09:00 ~ 12:00</option>
			<option value="12001500">12:00 ~ 15:00</option>
			<option value="15001800">15:00 ~ 18:00</option>
			<option value="18002100">18:00 ~ 21:00</option>
			<option value="21002400">21:00 ~ 24:00</option>			
		</select>		
		
		<input type="submit" value="검색">
		
		
		
	</div>

</form>







</body>
</html>