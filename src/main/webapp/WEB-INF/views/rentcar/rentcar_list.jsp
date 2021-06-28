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

<h1>렌트카 검색</h1>

<form action="rentCarList.do">
	<div>
		<sapn>지역검색</sapn>
		<input type="text" name="addr">
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
				<span>업체명</span><span><%=map.get("entrpsNm") %></span>
				<span>사업장구분</span><%=map.get("bplcType") %></span>
				<span>소재지도로명주소</span><%=map.get("rdnmadr") %></span>
				<span>소재지지번주소</span><%=map.get("lnmadr") %></span>
				<span>자동차총보유대수</span><%=map.get("vhcleHoldCo") %></span>
				<span>비즈니스석운임</span><%=map.get("carHoldCo") %></span>
				<span>승용차보유대수</span><%=map.get("vansHoldCo") %></span>
				<span>휴무일</span><%=map.get("rstde") %></span>
				<span>홈페이지주소</span><%=map.get("homepageUrl") %></span>
				<span>대표자명</span><%=map.get("rprsntvNm") %></span>
				<span>전화번호</span><%=map.get("phoneNumber") %></span>
			</div>
		<%} %>
		<%for(int i = 0;i<=list.size()/10;i++){%>
			<span onclick="pagingcar(<%=i%>)">[<%=i+1 %>]</span>
		
		<% }%>
	<%} %>
</div>

</body>
</html>