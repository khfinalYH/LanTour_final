<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/currentWeather.js" charset='utf-8'></script>
<style type="text/css">
.table-class {
	float: left;
	width: 45%;
	margin-right: 30px;
}
</style>
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
	<section class="pt-5">
		<div class="container" style="display: flex;">
			<div class="table-class">
				<h4 style="padding-bottom: 15px; border-bottom: 1px solid #adadad">정보게시판</h4>
				<div class="hover-top" onclick="location.href='./communitydetail.do?community_no=${c_list.get(0).community_no }'">
					<h5>${c_list.get(0).community_title }</h5>
					<p style="font-size: 10px;">${c_list.get(0).member_name }</p>
				</div>
				<div class="hover-top" onclick="location.href='./communitydetail.do?community_no=${c_list.get(0).community_no }'">
					<h5>${c_list.get(1).community_title }</h5>
					<p style="font-size: 10px;">${c_list.get(1).member_name }</p>
				</div>
				<div class="hover-top" onclick="location.href='./communitydetail.do?community_no=${c_list.get(0).community_no }'">
					<h5>${c_list.get(2).community_title }</h5>
					<p style="font-size: 10px;">${c_list.get(2).member_name }</p>
				</div>
				<div class="hover-top" onclick="location.href='./communitydetail.do?community_no=${c_list.get(0).community_no }'">
					<h5>${c_list.get(3).community_title }</h5>
					<p style="font-size: 10px;">${c_list.get(3).member_name }</p>
				</div>
			</div>
			<div class="table-class">
				<h4 style="padding-bottom: 15px; border-bottom: 1px solid #adadad">공지사항</h4>
				<div class="hover-top" onclick="location.href='./noticeSelectOne.do?notice_no=${n_list.get(0).notice_no }'">
					<h5>[공지]${n_list.get(0).notice_title }</h5>
					<p style="font-size: 10px;">관리자</p>
				</div>
				<div class="hover-top" onclick="location.href='./noticeSelectOne.do?notice_no=${n_list.get(0).notice_no }'">
					<h5>[공지]${n_list.get(1).notice_title }</h5>
					<p style="font-size: 10px;">관리자</p>
				</div>
				<div class="hover-top" onclick="location.href='./noticeSelectOne.do?notice_no=${n_list.get(0).notice_no }'">
					<h5>[공지]${n_list.get(2).notice_title }</h5>
					<p style="font-size: 10px;">관리자</p>
				</div>
				<div class="hover-top" onclick="location.href='./noticeSelectOne.do?notice_no=${n_list.get(0).notice_no }'">
					<h5>[공지]${n_list.get(3).notice_title }</h5>
					<p style="font-size: 10px;">관리자</p>
				</div>
			</div>

		</div>
	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>