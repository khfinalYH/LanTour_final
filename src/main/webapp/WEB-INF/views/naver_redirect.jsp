<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("NiPSHx6Om9O_VYFPHn9A","YOUR_CALLBACK_URL");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			var member_id = naver_id_login.getProfileData('id');
			var member_name = naver_id_login.getProfileData('name');
			var member_email = naver_id_login.getProfileData('email');
			
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', "./naverloginres.do");
			
			var objs_1;
			objs_1 = document.createElement('input');
			objs_1.setAttribute('type', 'hidden');
			objs_1.setAttribute('name', 'member_id');
			objs_1.setAttribute('value', member_id);
			form.appendChild(objs_1);
			var objs_2;
			objs_2 = document.createElement('input');
			objs_2.setAttribute('type', 'hidden');
			objs_2.setAttribute('name', 'member_name');
			objs_2.setAttribute('value', member_name);
			form.appendChild(objs_2);
			var objs_3;
			objs_3 = document.createElement('input');
			objs_3.setAttribute('type', 'hidden');
			objs_3.setAttribute('name', 'member_email');
			objs_3.setAttribute('value', member_email);
			form.appendChild(objs_3);
			
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>