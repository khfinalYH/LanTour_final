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
function pagingcar(i){
	var cars = document.getElementsByClassName("cars")
	
	for(var j = 0; j<cars.length;j++){
		if(j>=i*10&&j<(i+1)*10){
			document.getElementById("ticket"+j).style.display = "block"
		}else{
			document.getElementById("ticket"+j).style.display = "none"
			
			
		}
	}
	
}
</script>



<body>
<% List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");  %>
<% String cartype = (String)request.getAttribute("cartype");  %>
<% String searchtype = (String)request.getAttribute("searchtype");  %>
<% String content = (String)request.getAttribute("content");  %>

<h1>렌트카 검색</h1>

<form action="rentCarList.do">
	<div>
		<select name = "searchtype">
			<option <%if(searchtype.equals("entrpsNm")){%> selected <%}%> value="entrpsNm">업체명</option>
			<option <%if(searchtype.equals("rdnmadr")){%> selected <%}%> value="rdnmadr">소재지 도로명 주소</option>
			<option <%if(searchtype.equals("garageRdnmadr")){%> selected <%}%> value="garageRdnmadr">차고지 도로명 주소</option>
		</select>
		<input type="text" name="content" <%if(content!=null){%> value="<%=content%>"<%}%> >
		<span>차종 검색</span>
		<select name = "cartype">
			<option <%if(cartype.equals("carHoldCo")){%> selected <%}%> value="carHoldCo">승용차</option>
			<option <%if(cartype.equals("vansHoldCo")){%> selected <%}%> value="vansHoldCo">승합차</option>
			<option <%if(cartype.equals("eleCarHoldCo")){%> selected <%}%> value="eleCarHoldCo">전기 승용차</option>
			<option <%if(cartype.equals("eleVansCarHoldCo")){%> selected <%}%> value="eleVansCarHoldCo">전기 승합차</option>
		</select>
		<input type="submit" value="검색">
		
		
		
	</div>

</form>
<h1>랜트카 리스트</h1>

<div>
	<%if(list.size()==0){ %>
			<div>검색된 업체가 없습니다.</div>
	<%}else{
		int j = 0;%>
		<%for(Map<String, String> map : list){ %>
			<div id = "ticket<%=j%>" class="cars"<%if(j>=10){ %>style="display: none"<%} %>>
			<%j++; %>
				<span>업체명 </span>
				<span><%=map.get("entrpsNm") %></span><br/>
				<span>사업장구분</span>
				<span><%=map.get("bplcType") %></span><br/>
				<span>소재지 도로 명주소</span>
				<span><%=map.get("rdnmadr")%></span><br/>
				<span>차고지 도로명 주소</span>
				<span><%=map.get("garageRdnmadr") %></span><br/>
				<span>자동차총보유대수</span>
				<span><%=map.get("vhcleHoldCo") %></span><br/>
				<span>승용차 보유 대수</span>
				<span><%=map.get("carHoldCo") %></span><br/>
				<span>승합차 보유대수</span>
				<span><%=map.get("vansHoldCo") %></span><br/>
				<span>전기 승용차 보유 대수</span>
				<span><%=map.get("eleCarHoldCo") %></span><br/>
				<span>전기 승합차 보유대수</span>
				<span><%=map.get("eleVansCarHoldCo") %></span><br/>
				<span>영업시간</span>				
				<span><%=map.get("weekdayOperOpenHhmm")+" ~ "+map.get("weekdayOperColseHhmm") %></span><br/>
				<span>전화번호</span>
				<span><%=map.get("phoneNumber") %></span><br/>
				<%if(map.get("homepageUrl")!=null){ %>
				<a href="<%=map.get("homepageUrl") %>">홈페이지</a><br/>
				<%}else{%>
				<span><b>홈페이지 X</b></span><br/>
				<%} %>
				<span><a href="#">지도연결</a></span>
				<br/>
			</div>
		<%} %>
		<%for(int i = 0;i<=list.size()/10;i++){%>
			<span onclick="pagingcar(<%=i%>)"><a href="#">[<%=i+1 %>]</a></span>
		
		<% }%>
	<%} %>
</div>

</body>
</html>