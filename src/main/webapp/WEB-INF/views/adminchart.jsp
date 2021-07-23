<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "adminreservationchart.do",
			type : "post",
			dataType : "json",
			success : function(msg) {
				var list = msg.list;
				var label = [];
				var mydata = [];
				for (var i = 0; i < list.length; i++) {
					label.push(list[i].pay_date);
					mydata.push(list[i].count);  
				}
				var reservationchart = $("#reservationchart");
				charbar(reservationchart,label,mydata);
			},
			error : function() {
				alert("통신 실패");
			}
		});
	});
	function charbar(reservationchart,label,mydata) {
		var myChart = new Chart(reservationchart,{
			type : 'bar',
			data : { // 차트에 들어갈 데이터
				labels : label,
				datasets : [ { //데이터
					label : '날짜 별 예약 횟수', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : mydata,
					backgroundColor : [
					//색상
					'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [
					//경계선 색상
					'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				}]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	}
	var context = document.getElementById('testchart')
	var myChart = new Chart(context,
			{
				type : 'bar', // 차트의 형태
				data : { // 차트에 들어갈 데이터
					labels : [
					//x 축
					'1', '2', '3', '4', '5', '6', '7' ],
					datasets : [ { //데이터
						label : 'test1', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : [ 21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
						],
						backgroundColor : [
						//색상
						'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					//경계선 굵기
					}]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
</script>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link" href="adminmember.do">회원관리</a></li>
			<li class="nav-item"><a class="nav-link" href="admincommunity.do">커뮤니티 게시판 글 목록</a></li>
			<li class="nav-item"><a class="nav-link active" href="adminchart.do">차트 보기</a></li>
		</ul>

		<div style="width: 450px; height: 450px;">
			<canvas id="reservationchart">
			
			</canvas>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>