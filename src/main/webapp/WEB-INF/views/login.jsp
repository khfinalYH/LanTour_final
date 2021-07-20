<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="869891537807-u606s04umnomhs5tg7sufpd9c5g7fv6a.apps.googleusercontent.com">

<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript">
	//sdk를 초기화, 사용할 앱의 javascript키
	Kakao.init('b0ad0b9e43ffa36c9151c79f86f2db3d');
	//sdk 초기화 여부를 판단
	Kakao.isInitialized();
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		var id_token = googleUser.getAuthResponse().id_token;
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'googleTokensignin.do');
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');

		xhr.onload = function() {
			console.log('Signed in as: ' + xhr.responseText);
			switch (xhr.responseText) {
			case "InvalidEmain":
				alert("구글 이메일 인증이 되어있지 않습니다.")
				break;
			case "signup":
				document.getElementById("id_token").value = id_token
				alert("회원가입 페이지로 넘어갑니다")
				var f = document.google
				f.idtoken.value = id_token; //POST방식으로 넘기고 싶은 값
				f.action = "googlesignup.do";//이동할 페이지
				f.method = "post";//POST방식
				f.submit();
				break;
			case "login":
				alert("로그인되었습니다.")
				location.href = "main.do"
				break;
			case "hasemail":
				alert("이미 가입되어있는 이메일입니다")
				break;
			default:
				alert("부적합한 접근입니다(이메일과 토큰이 일치하지 않습니다.)")
				break;
			}
		};
		xhr.send('idtoken=' + id_token);
	}
	

	$(function() {
		$("#loginChk").hide();
	});

	function login() {
		var member_id = $('#member_id').val().trim();
		var member_password = $('#member_password').val().trim();

		var sendByIdPw = {
			"member_id" : member_id,
			"member_password" : member_password
		}

		if (member_id == null || member_id == "" || member_password == null
				|| member_password == "") {
			alert("Id와 Password를 다시 확인해주세요");
		} else {
			$.ajax({
				url : 'loginCheck.do',
				type : 'post',
				data : JSON.stringify(sendByIdPw),
				contentType : "application/json",
				dataType : 'json',
				success : function(data) {
					if (data.check == true) {
						alert("성공적으로 로그인되었습니다.");
						location.href = "main.do";
					} else {
						$("#loginChk").show();
						$("#loginChk").html("Id 혹은 Password를 다시 확인해주세요.");
					}
				},
				error : function() {
					alert("통신 실패");
				}
			});
		}
	}

	function kakologinpage(){
		
		location.href="https://kauth.kakao.com/oauth/authorize?client_id=0051e1df68b8e3c9d056c9adaf343151&redirect_uri=http://localhost:8787/tour/kakaologin.do&response_type=code";
	}
</script>

</head>
<body>
	<form name="google">
		<input type="hidden" name="idtoken" id="id_token" value="">
	</form>

	<jsp:include page="header.jsp" />
	<section class="py-0">
		<div class="bg-holder d-none d-md-block" style="background-image: url(./resources/assets/img/illustrations/hero.png); background-position: right bottom; background-size: contain;"></div>
		<!--/.bg-holder-->
		<div class="container position-relative">
			<div class="row align-items-center min-vh-75 my-lg-8">
				<div class="col-md-7 col-lg-6 text-center text-md-start py-8">
					<h1 class="mb-4 display-1 lh-sm">
						Travel around <br class="d-block d-lg-none d-xl-block" />the world
					</h1>
					<p class="mt-4 mb-5 fs-1 lh-base">
						Plan and book your perfect trip with expert advice, <br class="d-none d-lg-block" />travel tips, destination information and <br class="d-none d-lg-block" />inspiration from us.
					</p>
					<div style="padding-bottom: 50px;">
						<input type="text" style="width: 40%; float: right; color: black; border-color: black;" class="form-control" id="member_id" placeholder="Id" />
					</div>
					<div style="padding-bottom: 50px;">
						<input type="password" style="width: 40%; float: right; color: black; border-color: black;" class="form-control" id="member_password" placeholder="Password" />
					</div>
					<div style="padding-bottom: 10px;">
						<button type="button" class="btn btn-primary" onclick="login();">로그인</button>
					</div>
					<div style="padding-bottom: 50px;">
						<div class="g-signin2" style="float: right;" data-onsuccess="onSignIn"></div>
						<div class ="kakaologin"><img width="120" height ="36"  src="resources/kakaologin/kakao_login_small.png"  onclick="kakologinpage()" ></div>					
					</div>
					<div style="padding-bottom: 50px;">
					</div>
					<div>
						<a href="findid.do">아이디 찾기</a>
						&nbsp;&nbsp;&nbsp;
						<a href="findpassword.do">비밀번호 찾기</a>
						&nbsp;&nbsp;&nbsp;
						<a href="registselect.do">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>