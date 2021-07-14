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