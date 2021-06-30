<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function festivalSearch(val) {
		window.scrollTo({top:0, left:0, behavior:'auto'});
		if (val == null) {
			val = 1;
		}
		var pageNo = val;

		var sdate = $('#eventStartDate').val();
		if (sdate == "") {
			alert("시작 날짜를 선택해주세요.");
			return;
		}
		var edate = $('#eventEndDate').val();
		var ssdate = sdate.split('-');
		var eedate = edate.split('-');
		
		var eventStartDate = ssdate[0] + ssdate[1] + ssdate[2];
		var eventEndDate = eedate[0] + eedate[1] + eedate[2];

		var areaCode = $('#areaCode option:selected').val();
		var arrange = $('#arrange option:selected').val();
		 $.ajax({
			 url: './festivallist.do',
			 type: 'GET',
			 data: {
				 'pageNo': pageNo,
				 'eventStartDate' : eventStartDate,
				 'eventEndDate' : eventEndDate,
				 'areaCode' : areaCode,
				 'arrange' : arrange
			 },
			 dataType: 'json',
			 success: function(data) {
				console.log(data);
				document.getElementById("paging").innerHTML = "";
				var myData = data.response.body.items.item;
				if (myData == null) {
					alert("해당하는 조건에 만족하는 결과가 없습니다. 조건을 다시 설정해주세요.");
					var output = "";
					document.getElementById("festivalSearchList").innerHTML = output;
				} else {
					var festivalSearchList = $("#festivalSearchList");
					festivalSearchList.html("");
					var output = "";
					var count = 0;
					for(var i = 0; i < myData.length; i++){
						count++;
						output = "";
						// 제목, 시작일, 종료일, 주소
						title = myData[i].title;
						firstimage = myData[i].firstimage;
						eventstartdate = myData[i].eventstartdate;
						eventenddate = myData[i].eventenddate;
						addr1 = myData[i].addr1;
						
						contentid = myData[i].contentid;
						contenttypeid = myData[i].contenttypeid;
						
						
						
						output += "<div onclick=\"location.href='festivaldetail.do?contentid=" + contentid +"&eventstartdate="+eventstartdate+"&eventenddate="+eventenddate+"'\"><img src=\""+firstimage+"\" alt='image'>";
						output += "<h5>"+title+"</h5></div>";
						output += "<p>시작일 : " + eventstartdate + "</p>"; 
						output += "<p>종료일 : " + eventenddate + "</p>"; 
						output += "<p>" + addr1 + "</p><br><br><br>"
						

						document.getElementById("festivalSearchList").innerHTML += output;
					}
					// 한 페이지에 출력될 게시글 수
					var numOfRows = data.response.body.numOfRows;
					// 현재 페이지 넘버
					var pageNo = data.response.body.pageNo;
					// 전체 게시글
					var totalCount = data.response.body.totalCount;
					
					var pageCount = 5;
					var totalPage = Math.ceil(totalCount/numOfRows);
					var pageGroup = Math.ceil(pageNo/pageCount);
					
					
					var last = pageGroup * pageCount;
					if (last > totalPage) {
						last = totalPage;
					}
					var first = last - (pageCount-1);
					if (last%pageCount != 0 && pageGroup != 1) {
						first = (pageCount * (pageGroup - 1)) + 1
					}
					if (first < 1) {
						first = 1;
					}
					var next = last + 1;
					var prev = first - 1;


					var page = "";
					
					if(prev > 0) {
						page += "<input type=\"button\" name=\""+prev+"\" value=\"이전\" onclick=\"festivalSearch(this.name);\">"
					}

					for(var i=first; i <= last; i++){
						page += "<input type=\"button\" value=\""+i+"\" onclick=\"festivalSearch(this.value);\">"
					}

					if(last < totalPage) {
						page += "<input type=\"button\" name=\""+next+"\" value=\"다음\" onclick=\"festivalSearch(this.name);\"></input>"
					}
					document.getElementById("paging").innerHTML += page;

					
				}
				
			 },
			 error: function() {
				 alert("통신 실패");
			 }
		 });
		 
		
	}
	
	function pagingTest(){
		
	}
	

	
</script>
</head>
<body>

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

</body>
</html>