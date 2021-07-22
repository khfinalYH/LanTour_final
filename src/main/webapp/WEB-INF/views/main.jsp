<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/materialize/materialize.css">
<script type="text/javascript" src="resources/js/currentWeather.js" charset='utf-8'></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/materialize.min.js"></script>
<link rel="stylesheet" href="./resources/assets/css/theme.min.css">
<link rel="stylesheet" href="./resources/assets/css/theme-rtl.min.css">
<style type="text/css">
.table-class {
	float: left;
	width: 45%;
	margin-right: 30px;
}

.slider .indicators .indicator-item {
  background-color: #666666;
  border: 3px solid #ffffff;
  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.slider .indicators .indicator-item.active {
  background-color: #ffffff;
}
.slider {
  width: 100%;
  margin: 0 auto;
}
.slider .indicators {
  bottom: 60px;
  z-index: 100;
  /* text-align: left; */
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var options = {'height':600}
    var elems = document.querySelectorAll('.slider');
    var instances = M.Slider.init(elems, options);
  });
 
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	
 <div class="slider">
    <ul class="slides">
		<li>
		<section >
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
		</li>
		<li>
			<section >
			<div class="bg-holder" style="background-image:url(resources/assets/img/gallery/iairport.png);background-position:center;background-size:cover;"></div>
			<div class="container"> 
				<div class="row">
					<div class="col-12 py-8 text-white">
						<div class="d-flex flex-column flex-center">
							<h1 class="text-white fs-2 fs-md-3">국내 비행기 여행</h1>
							<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">내 시간은 아까우니까! 무엇보다 빠르게</h2>
							<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">BOOK RIGHT NOW!</h2>		
							<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold"> <input type="button" class="source-button btn btn-primary btn-xs" value="지금 바로 검색하기" style="font-size: 13pt; font: bold;"onclick="location.href='airportSearch.do'"> </h2>		
						</div>
					</div>
				</div>
			</div>
		</section>
		</li>
		<li>
		<section>
		<div class="bg-holder" style="background-image:url(resources/assets/img/gallery/rentcar.png);background-position:center;background-size:cover;"></div>
		<div class="container"> 
			<div class="row">
				<div class="col-12 py-8 text-white">
					<h1 class="text-white fs-2 fs-md-3">언제 어디서든</h1>
					<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">빠르고 쉽게 예약하세요</h2>
					<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">BOOK RIGHT NOW!</h2>	
					<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold"> <input type="button" class="source-button btn btn-primary btn-xs" value="지금 바로 검색하기" style="font-size: 13pt; font: bold;"onclick="location.href='rentCarSearch.do'"> </h2>		
				</div>
			</div>
		</div>
		</section>
		</li>
		<li>
		
	<section id="booking">
        <div class="bg-holder" style="background-image:url(resources/assets/img/gallery/festivalPic.jpg);background-position:center;background-size:cover;">
        </div>
        <!--/.bg-holder-->
        <div class="container">
          <div class="row">
            <div class="col-12 py-8 text-white">
              <div class="d-flex flex-column flex-center">
                <h2 class="text-white fs-2 fs-md-3">대한민국 구석구석</h2>
                <h1 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">Explore Korea Festival</h1>
				<h2 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold"> <input type="button" class="source-button btn btn-primary btn-xs" value="지금 바로 검색하기" style="font-size: 13pt; font: bold;"onclick="location.href='festival.do'"> </h2>		
              </div>
            </div>
          </div>
        </div>
      </section>
		
		
		</li>
	</ul>
</div>
	
	
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


	<jsp:include page="footer.jsp" />

</body>
</html>