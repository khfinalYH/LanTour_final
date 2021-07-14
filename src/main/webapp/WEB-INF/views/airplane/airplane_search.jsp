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
<script type="text/javascript" src="resources/js/airportWeather.js" ></script>
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
			document.getElementById(all[arr]).setAttribute("hidden","hidden")
		}
		
		
		if(dep.value==dp_kp){
			for(var arr in arr_kimpo){
				var ar = document.getElementById(arr_kimpo[arr])
				ar.removeAttribute("hidden")
				check= false
			}
			
		}else if(dep.value==dp_jj){
			for(var arr in arr_jeju){
				var ar = document.getElementById(arr_jeju[arr])
				ar.removeAttribute("hidden")
				check= false
			}
		}else if(dep.value==dp_YY){
			for(var arr in arr_YY){
				var ar = document.getElementById(arr_YY[arr])
				ar.removeAttribute("hidden")
				check= false
			}
			
		}else{
			if(check){
				for(dp in dp_KK){
					if(dep.value== dp_KK[dp]){
						for(var arr in arr_KK){
							var ar = document.getElementById(arr_KK[arr])
							ar.removeAttribute("hidden")
						}
					
					}
				}
			}
			if(check){
				for(dp in dp_CKW){
					if(dep.value== dp_CKW[dp]){
						var ar = document.getElementById(arr_one)
						ar.removeAttribute("hidden")
						check= false
					}	
				}
			}
			if(check){
				for(var arr in arr_else){
					var ar = document.getElementById(arr_else[arr])
					ar.removeAttribute("hidden")
				}
				
			}
		}
	}
	
	window.onload = function(){
		var d = document.getElementById("dep")
		port(d.options[d.selectedIndex])
		let [today] = new Date().toISOString().split("T");
		document.getElementById("date").setAttribute("min", today);
	}
	


</script>
<body>
<% List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");  %>


<h1>항공 검색</h1>

<form action="airplaneList.do">
	<div>
		<sapn>출발 공항</sapn>
		<select id="dep" onchange="port(this)" name = "depAirportId">
		<%for(Map<String, String> map : list){ %>
				<option id = "<%=map.get("airportId")%>" value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
			</optgroup>
		</select>
		<sapn>도착 공항</sapn>
		<select required="required" name = "arrAirportId">
		<%for(Map<String, String> map : list){ %>
			<option hidden="hidden" <%if(map.get("airportNm").equals("제주")){ %>selected<%} %> id ="<%=map.get("airportId")+"a"%>" value="<%=map.get("airportId") %>"><%=map.get("airportNm") %></option>
		<%} %>
			</optgroup>
		</select>
		<sapn>출발일자</sapn>
		<input id = "date"type="date" name="date" >
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
<h1>오늘의 날씨</h1>
<div id="js-weather"></div>






</body>
</html>