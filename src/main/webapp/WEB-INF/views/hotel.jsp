<%@page import="com.lan.tour.model.dto.HotelDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lan.tour.model.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function StarSetting() {
		var score = document.getElementsByClassName('score')
		var scoreStar = document.getElementsByClassName('scoreStar')
		for (i = 0; i < score.length; i++) {
			var scoreint = parseInt(score[i].innerHTML)
			switch (scoreint) {
			case 1:
				scoreStar[i].innerHTML = '★☆☆☆☆'
				break;
			case 2:
				scoreStar[i].innerHTML = '★★☆☆☆'
				break;
			case 3:
				scoreStar[i].innerHTML = '★★★☆☆'
				break;
			case 4:
				scoreStar[i].innerHTML = '★★★★☆'
				break;
			case 5:
				scoreStar[i].innerHTML = '★★★★★'
			}
		}

	}
	window.onload = function() {
		StarSetting()
	}
	function SetValue(this) {
		$("#hotel_maxprice").val(this.val());
	}
</script>
<style type="text/css">
#hotel {
	display: grid;
	margin-left: 100px;
	margin-right: 500px;
	min-height: 1000px;
	margin-right: 500px;
}

.nav-hotel {
	width: 30%;
	height: 550px;
	float: left;
	border: 2px solid #3984F3;
	margin-right: 30px;
	font-weight: bold;
	font-size: 20px;
	color: black;
}

.hotel-list {
	width: 65%;
	float: left;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1>숙소 list</h1>
	<div id="hotel">
		<div>
			<div class="nav-hotel">
				<form action="./hotelsearch.do" method="post">
					<fieldset class="form-group">
						<legend class="mt-4">숙소 타입</legend>
						<div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="호텔" checked="checked"> 호텔
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="모텔">모텔
								</label>
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="게스트 하우스">게스트 하우스
								</label>
							</div>
						</div>
					</fieldset>
					<fieldset class="form-group">
						<legend class="mt-4">가격</legend>
						<label for="customRange1" class="form-label">최소 가격</label>
						<input type="range" class="form-range" value="0" min="0" max="300000" step="10000" name="hotel_minprice" oninput="document.getElementById('value1').innerHTML=this.value;">
						<p id="value1"></p>
						<label for="customRange3" class="form-label">최대 가격</label>
						<input type="range" class="form-range" value="9999999" min="300000" max="9999999" step="10000" name="hotel_maxprice" oninput="document.getElementById('value2').innerHTML=this.value;">
						<p id="value2"></p>
					</fieldset>
					<button type="submit" class="btn btn-primary">검색</button>
				</form>
			</div>
			<div class="hotel-list">
				<c:choose>
					<c:when test="${empty list}">
						<span>--------------------------------등록된 숙소가 없습니다--------------------------------------</span>
					</c:when>
					<c:otherwise>
						<c:set var="i" value="0" />
						<c:forEach items="${list }" var="dto">
							<div class="card mb-3" style="width: 30%; float: left; min-height: 400px; margin-right: 20px; border: 1px solid #3984F3;" onclick="location.href='./hoteldetail.do?hotel_no=${dto.hotel_no } '">
								<div class="card-body">
									<h5 class="card-title">${dto.hotel_title }</h5>
									<h6 class="card-subtitle text-muted">${dto.hotel_addr }</h6>
								</div>
								<img src="${dto.hotel_image }">
								<div class="card-body">
									<p class="card-text">${dto.hotel_content }</p>
								</div>
								<ul class="list-group list-group-flush">
									<c:choose>
										<c:when test="${dto.hotel_no eq scorelist[i].hotel_no}">
											<li class="list-group-item"><span class="scoreStar"></span> <span class="score">${scorelist[i].review_score }</span> <span>/5(${scorelist[i].review_no })</span></li>
											<c:set var="i" value="${i+1 }"></c:set>
										</c:when>
										<c:otherwise>
											<li class="list-group-item">☆☆☆☆☆ 0/5(0)</li>
										</c:otherwise>
									</c:choose>
								</ul>
								<div class="card-footer text-muted">
									<fmt:formatDate value="${dto.hotel_regdate }" pattern="yyyy-MM-dd" />
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div>
			<div class="form-group">
				<input type="button" class="btn btn-primary" value="숙소 등록" onclick="location.href='./hotelinsert.do'" />
			</div>
		</div>



	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>