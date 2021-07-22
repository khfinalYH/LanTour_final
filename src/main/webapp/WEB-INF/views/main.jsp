<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/currentWeather.js" charset='utf-8'></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section id="booking">
		<div class="bg-holder" style="background-image: url(./resources/assets/img//gallery/main.jpg); background-position: center; background-size: cover;"></div>
		<!--/.bg-holder-->
		<div class="container">
			<div class="row">
				<div class="col-12 py-8 text-white">
					<div class="d-flex flex-column flex-center">
						<h2 class="text-white fs-2 fs-md-3">LanTour</h2>
						<h1 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">여러가지를 누려보세요</h1>
					</div>
				</div>
				<div id="js-weather" style="text-align: center;"></div>
			</div>
		</div>
	</section>
	<section class="pt-5">
		<div class="container">
			<div class="row flex-center mb-5">
				<div class="col-lg-8 text-center">
					<h1 class="fw-bold fs-md-3 fs-lg-4 fs-xl-5">숙소</h1>
					<hr class="mx-auto text-primary my-4" style="height: 3px; width: 70px;" />
					<p class="mx-auto">저희 사이트에서 예약 할 수 있는 숙소 리스트입니다</p>
				</div>
			</div>
			<div style="display: inline-block;">
				<div class="col-6 col-sm-4 col-xl-2 mb-3 hover-top px-2" style="float: left; margin-right: 20px;">
					<div class="card h-100 w-100 text-white">
						<a class="stretched-link" href="!#">
							<img class="img-fluid" style="height: 200px;" src="./resources/imgtest/test.jpg" alt="" />
						</a>
						<div class="card-img-overlay d-flex align-items-end bg-dark-gradient">
							<h5 class="text-white fs--1">${h_list.get(0).hotel_title }</h5>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-4 col-xl-2 mb-3 hover-top px-2" style="float: left; margin-right: 20px;">
					<div class="card h-100 w-100 text-white">
						<a class="stretched-link" href="!#">
							<img class="img-fluid" style="height: 200px;" src="./resources/imgtest/test.jpg" alt="" />
						</a>
						<div class="card-img-overlay d-flex align-items-end bg-dark-gradient">
							<h5 class="text-white fs--1">${h_list.get(1).hotel_title }</h5>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-4 col-xl-2 mb-3 hover-top px-2" style="float: left; margin-right: 20px;">
					<div class="card h-100 w-100 text-white">
						<a class="stretched-link" href="!#">
							<img class="img-fluid" style="height: 200px;" src="./resources/imgtest/test.jpg" alt="" />
						</a>
						<div class="card-img-overlay d-flex align-items-end bg-dark-gradient">
							<h5 class="text-white fs--1">${h_list.get(2).hotel_title }</h5>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-4 col-xl-2 mb-3 hover-top px-2" style="float: left; margin-right: 20px;">
					<div class="card h-100 w-100 text-white">
						<a class="stretched-link" href="!#">
							<img class="img-fluid" style="height: 200px;" src="./resources/imgtest/test.jpg" alt="" />
						</a>
						<div class="card-img-overlay d-flex align-items-end bg-dark-gradient">
							<h5 class="text-white fs--1">${h_list.get(3).hotel_title }</h5>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-4 col-xl-2 mb-3 hover-top px-2" style="float: left; margin-right: 20px;">
					<div class="card h-100 w-100 text-white">
						<a class="stretched-link" href="!#">
							<img class="img-fluid" style="height: 200px;" src="./resources/imgtest/test.jpg" alt="" />
						</a>
						<div class="card-img-overlay d-flex align-items-end bg-dark-gradient">
							<h5 class="text-white fs--1">${h_list.get(4).hotel_title }</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>