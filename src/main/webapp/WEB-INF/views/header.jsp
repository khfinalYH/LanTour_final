<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/assets/css/theme.min.css">
<link rel="stylesheet" href="./resources/assets/css/theme-rtl.min.css">
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'ko',
			includedLanguages : 'ko,en,ja,zh-CN,zh-TW',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay : false
		}, 'google_translate_element');
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
		auth2.disconnect();
		location.href = "logout.do"
	}
	window.onload = function() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}
</script>
<style type="text/css">
.header {
	height: 100px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="header">
		<div class="navbar navbar-expand-lg py-3">
			<div class="container">
				<a class="navbar-brand d-flex align-items-center fw-bold fs-2" href="main.do">
					<img class="d-inline-block align-top img-fluid" src="./resources/assets/img/gallery/logo-icon.png" alt="" width="50" />
					<span class="text-primary fs-4 ps-2">LanTour</span>
				</a>
				<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto pt-2 pt-lg-0">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="./main.do">Home</a></li>
						<li class="nav-item"><a class="nav-link text-600" href="./hotellist.do">숙소</a></li>
						<li class="nav-item"><a class="nav-link text-600" href="lantourlist.do">랜선투어</a></li>
						<li class="nav-item"><a class="nav-link text-600" href="airportSearch.do">항공 검색 </a></li>
						<li class="nav-item"><a class="nav-link text-600" href="rentCarSearch.do">렌트카 검색 </a></li>
						<li class="nav-item"><a class="nav-link text-600" href="festival.do">축제 검색 </a></li>
						<li class="nav-item"><a class="nav-link text-600" href="community.do">정보게시판 </a></li>
						<li class="nav-item"><a class="nav-link text-600" href="noticeList_category.do?nowPage=1">공지사항 </a></li>
						<c:if test="${not empty login }">
							<c:choose>
								<c:when test="${login.member_grade == 'A' }">
									<li class="nav-item"><a class="nav-link text-600" href="adminmember.do">공지사항 </a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link text-600" href="mypage.do">공지사항 </a></li>
								</c:otherwise>
							</c:choose>
						</c:if>

					</ul>
					<div id="google_translate_element"></div>
					<form class="ps-lg-5">
						<c:if test="${empty login }">
							<button class="btn btn-lg btn-outline-primary order-0" type="button" onclick="location.href='loginform.do'">로그인</button>
						</c:if>
						<c:if test="${not empty login }">
							<button class="btn btn-lg btn-outline-primary order-0" type="button" onclick="signOut()">로그아웃</button>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>