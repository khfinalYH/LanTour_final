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

<script type="text/javascript">

function paging(i){
	var airplane = document.getElementsByClassName("airplanedetail")

	for(var j = 0; j<airplane.length;j++){
		if(j>=i*10&&j<(i+1)*10){
			document.getElementById("ticket"+j).style.display = "block"
		}else{
			document.getElementById("ticket"+j).style.display = "none"
			
			
		}
	}
}
</script>



<body>
<% List<Map<String, String>> portlist = (List<Map<String, String>>)request.getAttribute("portlist");  %>
<% List<Map<String, String>> planelist = (List<Map<String, String>>)request.getAttribute("planelist");  %>
<% String date = (String)request.getAttribute("date"); %>
<h1>항공 검색</h1>

<form action="airplaneList.do">
	<div>
		<span>출발 공항:도착공항</span>
		<select name = "depAirportId">
		<%for(Map<String, String> map : portlist){ %>
			<option <%if(map.get("airportId").equals((String)request.getAttribute("depAirportId"))){ %>selected<%} %> value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<span>:</span>
		<select name = "arrAirportId">
		<%for(Map<String, String> map : portlist){ %>
			<option <%if(map.get("airportId").equals((String)request.getAttribute("arrAirportId"))){ %>selected<%} %> value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<span>출발일자</span>
		<input type="date" name="date" value="<%= date%>" >
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
<h1>비행기 리스트</h1>

<div>
	<%if(planelist.size()==0){ %>
			<div>검색된 항공편이 없습니다.</div>
	<%}else{
		int j = 0;%>
		<%for(Map<String, String> map : planelist){ %>
			<div id = "ticket<%=j%>"class="airplanedetail" <%if(j>=10){ %>style="display: none"<%} %>>
			<%j++; %>
				<span>항공편명</span>
				<span><%=map.get("vihicleId") %></span><br/>
				<span>항공사명</span>
				<span><%=map.get("airlineNm") %></span><br/>
				<span>출발시간</span>
				<span><%=map.get("depPlandTime") %></span><br/>
				<span>도착시간</span>
				<span><%=map.get("arrPlandTime") %></span><br/>
				<span>일반석운임</span>
				<span><%=map.get("economyCharge") %></span><br/>
				<span>비즈니스석운임</span>
				<span><%=map.get("prestigeCharge") %></span><br/>
				<span>출발공항</span>
				<span><%=map.get("depAirportNm") %></span><br/>
				<span>도착공항</span>
				<span><%=map.get("arrAirportNm") %></span><br/>
				<%if(map.get("dep").equals("X")||map.get("arr").equals("X")){ %>
					예약가능한 항공사와 협약되어있지 않습니다.<br/>
				<%}else{ %>
				<a href="https://flight.naver.com/flights/results/domestic?trip=OW&fareType=YC&scity1=<%=map.get("dep") %>&ecity1=<%=map.get("arr") %>&adult=1&child=0&infant=0&sdate1=<%=date.replaceAll("-",".")+"."%>">예약하기</a>
			<br/>
				<%} %>
			</div>
		<%} %>
		<%for(int i = 0;i<=planelist.size()/10;i++){%>
			<span onclick="paging(<%=i%>)"><a href="#">[<%=i+1 %>]</a></span>
		
		<% }%>
	<%} %>
</div>

</body>
</html>