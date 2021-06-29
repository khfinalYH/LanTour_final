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


	var all=["NAARKJBa","NAARKJJa","NAARKJKa", "NAARKJYa","NAARKNWa","NAARKNYa","NAARKPCa","NAARKPKa","NAARKPSa","NAARKPSa","NAARKPUa","NAARKSSa","NAARKTNa","NAARKTUa"]
	var dp_kp = "NAARKSS" //김포
	var dp_KK = ["NAARKJJ","NAARKPK"] //광주 김해
	var dp_jj = "NAARKPC" // 제주
	var dp_YY = "NAARKNY" // 양양
	var dp_CKW=["NAARKJK","NAARKNW","NAARKTU"] //창원 청주 원주
	
	//광주, 대구, 무안, 김해, 양양, 여수, 울산, 제주, 사천, 포항
	var arr_kimpo=["NAARKJJa", "NAARKTNa","NAARKJBa","NAARKPKa","NAARKNYa","NAARKJYa","NAARKPUa","NAARKPKa","NAARKPSa","NAARKTHa"]
	
	//13개
	var arr_jeju=["NAARKJJa","NAARKJKa", "NAARKTNa","NAARKJBa","NAARKPKa","NAARKSSa","NAARKNYa","NAARKJYa","NAARKPUa","NAARKNWa","NAARKPSa","NAARKTUa","NAARKTHa"]
	
	var arr_KK=["NAARKSSa","NAARKPCa","NAARKNYa"]
	
	var arr_YY=["NAARKJJa","NAARKPCa","NAARKSSa","NAARKPKa"]
	
	var arr_one="NAARKPCa"
	
	var arr_else=["NAARKSSa","NAARKPCa"]

	function port(dep){
		var check = true
		for(arr in all){
			document.getElementById(all[arr]).setAttribute("disabled","disabled")
		}
		
		
		if(dep.value==dp_kp){
			for(var arr in arr_kimpo){
				var ar = document.getElementById(arr_kimpo[arr])
				ar.removeAttribute("disabled")
				check= false
			}
			
		}else if(dep.value==dp_jj){
			for(var arr in arr_jeju){
				var ar = document.getElementById(arr_jeju[arr])
				ar.removeAttribute("disabled")
				check= false
			}
		}else if(dep.value==dp_YY){
			for(var arr in arr_YY){
				var ar = document.getElementById(arr_YY[arr])
				ar.removeAttribute("disabled")
				check= false
			}
		}else{
			if(check){
				for(dp in dp_KK){
					if(dep.value== dp_KK[dp]){
						for(var arr in arr_KK){
							var ar = document.getElementById(arr_KK[arr])
							ar.removeAttribute("disabled")
						}
					
					}
				}
			}
			if(check){
				for(dp in dp_CKW){
					if(dep.value== dp_CKW[dp]){
						var ar = document.getElementById(arr_one)
						ar.removeAttribute("disabled")
						check= false
					}	
				}
			}
			if(check){
				for(var arr in arr_else){
					var ar = document.getElementById(arr_else[arr])
					ar.removeAttribute("disabled")
				}
				
			}
		}
	}
	
	
	window.onload = function(){
		let [today] = new Date().toISOString().split("T");
		document.getElementById("date").setAttribute("min", today);
		port(document.getElementById("dep"))
	}

	
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
<% String time = (String)request.getAttribute("time"); %>

<h1>항공 검색</h1>

<form action="airplaneList.do">
	<div>
		<span>출발 공항:도착공항</span>
		<select onchange="port(this)" id="dep" name = "depAirportId">
		<%for(Map<String, String> map : portlist){ %>
			<option <%if(map.get("airportId").equals((String)request.getAttribute("depAirportId"))){ %>selected<%} %> value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<span>:</span>
		<select id="arr" name = "arrAirportId">
		<%for(Map<String, String> map : portlist){ %>
			<option disabled="disabled" id ="<%=map.get("airportId")+"a"%>"  <%if(map.get("airportId").equals((String)request.getAttribute("arrAirportId"))){ %>selected<%} %> value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
		</select>
		<span>출발일자</span>
		<input type="date" id="date" name="date" value="<%= date%>" >
		<span>출발 시간</span>
		<select name="time">
			<option value="">전체조회</option>
			<option <%if(time.equals("00000600")){ %>selected<%} %> value="00000600">00:00 ~ 06:00</option>
			<option <%if(time.equals("06000900")){ %>selected<%} %> value="06000900">06:00 ~ 09:00</option>
			<option <%if(time.equals("09001200")){ %>selected<%} %> value="09001200">09:00 ~ 12:00</option>
			<option <%if(time.equals("12001500")){ %>selected<%} %> value="12001500">12:00 ~ 15:00</option>
			<option <%if(time.equals("15001800")){ %>selected<%} %> value="15001800">15:00 ~ 18:00</option>
			<option <%if(time.equals("18002100")){ %>selected<%} %> value="18002100">18:00 ~ 21:00</option>
			<option <%if(time.equals("21002400")){ %>selected<%} %> value="21002400">21:00 ~ 24:00</option>
			
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
			<span  onclick="paging(<%=i%>)"><a href="#">[<%=i+1 %>]</a></span>
		
		<% }%>
	<%} %>
</div>

</body>
</html>