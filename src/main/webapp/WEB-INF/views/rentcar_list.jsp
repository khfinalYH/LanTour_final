<%@page import="java.util.ArrayList"%>
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

<link rel="stylesheet" href="./resources/assets/css/theme.min.css">
<link rel="stylesheet" href="./resources/assets/css/theme-rtl.min.css">
<link rel="stylesheet" href="./resources/5/litera/bootstrap.css">
<link rel="stylesheet" href="./resources/_vendor/font-awesome/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5ac74b7ae612d28cecba47461784705"></script>

<script type="text/javascript">
<% List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list")==null? new ArrayList<Map<String, String>>():(List<Map<String, String>>)request.getAttribute("list");  %>
<% String cartype =(String)request.getAttribute("cartype");  %>
<% String searchtype = (String)request.getAttribute("searchtype");  %>
<% String content =  request.getAttribute("content")==null?"":(String)request.getAttribute("content");  %>
window.onload = function(){
	paging(0)
	<%if(request.getAttribute("list")!=null){%>
	if(<%=list.size()%><10){
		for(var k = 0; k<<%=list.size()%>;k++){
			eval('remap'+k+"()")		
		}
		
	}else{
		for(var k = 0; k<10;k++){
			eval('remap'+k+"()")		
		}
		
	}
	<%}%>
}
function paging(i){

	$('html').scrollTop(0);
	var reviews = document.getElementsByClassName("cars")
	var page_item = document.querySelectorAll(".page-item")
	for(var j = 0; j<page_item.length;j++){
		if(j==i){
			page_item[j].setAttribute("class", "page-item active" )
			page_item[j].removeAttribute("onclick")
		}else{
			page_item[j].setAttribute("class", "page-item" )
			page_item[j].setAttribute("onclick", "paging("+j+")" )
		}
	}
	for(var j = 0; j<reviews.length;j++){
		if(j>=i*10&&j<(i+1)*10){
			document.getElementById("ticket"+j).style.display = "block"
			eval('remap'+j+"()")	
		}else{
			document.getElementById("ticket"+j).style.display = "none"
		}
	}
	
}

function pagingBefore() {
	var active = document.getElementsByClassName("page-item active")[0]
	var count = document.querySelectorAll(".page-item").length
	if(parseInt(active.innerText)>10){
		for(var i = 0; i <=parseInt(count/10);i++){
			if(parseInt((active.innerText-1)/10)>=i & parseInt((active.innerText-1)/10)<i+1){
				for(var j = 0; j <count;j++){
					if(parseInt(j/10)==i-1){
						document.getElementById("pageList"+j).style.display = "block"
					}else{
						document.getElementById("pageList"+j).style.display = "none"

					}

				}
				paging((i-1)*10)
			}
		}
	}
}


function pagingNext() {
	var active = document.getElementsByClassName("page-item active")[0]
	var count = document.querySelectorAll(".page-item").length
	if(parseInt((active.innerText-1)/10)<parseInt(count/10)){
		for(var i = 0; i <=parseInt(count/10);i++){
			if(parseInt((active.innerText-1)/10)>=i&parseInt((active.innerText-1)/10)<(i+1)){
				for(var j = 0; j <count;j++){
					if(parseInt(j/10)==i+1){
						document.getElementById("pageList"+j).style.display = "block"
					}else{
						document.getElementById("pageList"+j).style.display = "none"							
					}
				}
				paging((i+1)*10)
			}
		}
	}
	
}
</script>
<style>
.form-group{
	width: 70%;
	margin: 0 auto;
}

</style>


<body>

<jsp:include page="./header.jsp" />



<div id="main-content" >
	<div class="col-lg-6" style="position:absolute ;border: 1px solid #8080805c; margin-left: 2%; width: 20%; margin-top: 5.5%">
		<form action="rentCarList.do" method="post">
			<div class="bs-component">
				<div class="form-group" >
					<label for="dep" class="form-label mt-4">?????? ??????</label>
					<select style="color: #585858;" class="form-select" id="dep" name = "searchtype">
						<option <%if(searchtype.equals("entrpsNm")){%> selected <%}%> value="entrpsNm">?????????</option>
						<option <%if(searchtype.equals("rdnmadr")){%> selected <%}%> value="rdnmadr">????????? ????????? ??????</option>
						<option <%if(searchtype.equals("garageRdnmadr")){%> selected <%}%> value="garageRdnmadr">????????? ????????? ??????</option>
					</select>
				</div>
				<div  class="form-group"> 
					<label for="time" class="form-label mt-4">?????? ??????</label>
					<select class="form-select" name="cartype" style="color: #585858">
						<option <%if(cartype.equals("carHoldCo")){%> selected <%}%> value="carHoldCo">?????????</option>
						<option <%if(cartype.equals("vansHoldCo")){%> selected <%}%> value="vansHoldCo">?????????</option>
						<option <%if(cartype.equals("eleCarHoldCo")){%> selected <%}%> value="eleCarHoldCo">?????? ?????????</option>
						<option <%if(cartype.equals("eleVansCarHoldCo")){%> selected <%}%> value="eleVansCarHoldCo">?????? ?????????</option>
					</select>		
				</div>
				<div class="form-group">
					<label class="form-label mt-4">?????? ??????</label>
					<input class="form-control" style="color: black" type="text" name="content" <%if(content!=null){%> value="<%=content%>"<%}%> >
				</div>
				<div>
				<input type="submit" class="btn btn-outline-primary" value="??????" style="margin: 5% 5% 5% 45%">
				</div>
			</div>
		</form>
	</div>
	<section style="margin-left: 25%; margin-right: 5%">
	<%if(list.size()==0){ %>
		
		
	<div style="margin-left: 35%; margin-top: 20%; margin-bottom: 17%;">????????? ????????? ????????????.</div>
		
	<%}else{
		int j = 0;%>
		<%for(Map<String, String> map : list){ %>
	<div id = "ticket<%=j%>" class="cars" style="<%if(j>=10){ %>display: none;<%} %>">
		<div class="bs-component">
		<table class="table table-hover">
			<col width="200px" />
			<col width="500px" />
			<col width="500px" />
			<thead>
				<tr class="table-primary">
					<th align="center" scope="col">??????</th>
					<th align="center" scope="col">?????? ??????</th>
					<th align="center" scope="col">??????</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">?????????</td>
					<td><%=map.get("entrpsNm") %></td>
					<td rowspan="12"> <div id="<%="carId"+j %>" style="width:800px;height:500px;"></div></td>
				</tr>
				<tr>
					<td scope="row">???????????????</td>
					<td><%=map.get("bplcType") %></td>
				</tr>
				<tr>
					<td scope="row">????????? ?????? ?????????</td>
					<td><%=map.get("rdnmadr")%></td>
				</tr>
				<tr>
					<td scope="row">????????? ????????? ??????</td>
					<td><%=map.get("garageRdnmadr") %></td>
				</tr>
				<tr>
					<td scope="row">????????????????????????</td>
					<td><%=map.get("vhcleHoldCo") %></td>
				</tr>
				<tr>
					<td scope="row">????????? ?????? ??????</td>
					<td><%=map.get("carHoldCo") %></td>
				</tr>
				<tr>
					<td scope="row">????????? ????????????</td>
					<td><%=map.get("vansHoldCo") %></td>
				</tr>
				<tr>
					<td scope="row">?????? ????????? ?????? ?????????</td>
					<td><%=map.get("eleCarHoldCo") %></td>
				</tr>
				<tr>
					<td scope="row">?????? ????????? ????????????</td>
					<td><%=map.get("eleVansCarHoldCo") %></td>
				</tr>
				<tr>
					<td scope="row">????????????</td>
					<td><%=map.get("weekdayOperOpenHhmm")+" ~ "+map.get("weekdayOperColseHhmm") %></td>
				</tr>
				<tr>
					<td scope="row">????????????</td>
					<td><%=map.get("phoneNumber") %></td>
				</tr>
				<tr>
				<td colspan="2">	
				<%if(map.get("homepageUrl")!=null&&!map.get("homepageUrl").equals("??????")){ %>
					<a href="<%="http://"+map.get("homepageUrl") %>"><b>????????????</b></a><br/>
					<%}else{%>
					<span>??????????????? ???????????? ?????? ???????????????.</span><br/>
				<%} %>
				</td>
				</tr>
				
			</tbody>
		</table>	
			<script type="text/javascript">
				function remap<%=j%>(){
					var container<%=j%> = document.getElementById("<%="carId"+j %>"); //????????? ?????? ????????? DOM ????????????
					var options<%=j%> = { //????????? ????????? ??? ????????? ?????? ??????
						center: new kakao.maps.LatLng(<%=map.get("latitude") %>, <%=map.get("longitude") %>), //????????? ????????????.
						draggable: false,
						level: 4 //????????? ??????(??????, ?????? ??????)
					};
					// ????????? ????????? ??????????????? 
					var markerPosition<%=j%>  = new kakao.maps.LatLng(<%=map.get("latitude") %>, <%=map.get("longitude") %>); 
					// ????????? ???????????????
					var marker<%=j%> = new kakao.maps.Marker({
					    position: markerPosition<%=j%>
					});
					
					var map<%=j%> = new kakao.maps.Map(container<%=j%>, options<%=j%>); //?????? ?????? ??? ?????? ??????
					marker<%=j%>.setMap(map<%=j%>);// ????????? ?????? ?????? ??????????????? ???????????????
				}
			</script>
		</div>
		</div>
				<%j++; %>
			
		<%} %>
		<div id="defaultSearch" style="display: inline-block; margin-left: 35%;margin-top: 5%;">
			<ul class="pagination">
				<li onclick="pagingBefore()"> <a class="page-link" ><<</a>  </li>
		<%for(int i = 0;i<=list.size()/10;i++){%>
					<li id="pageList<%=i%>" <%if(i>9){ %> style="display: none;" <%}else {%> style="display: block;"<%} %>class="page-item" onclick="paging(<%=i%>)"><a class="page-link" ><%=i+1 %></a></li>						
		<%} %>
				<li onclick="pagingNext()"> <a class="page-link" >>></a>  </li>
			</ul>
		</div>
	</section>
	<%} %>
</div>
	<jsp:include page="./footer.jsp" />

</body>
</html>