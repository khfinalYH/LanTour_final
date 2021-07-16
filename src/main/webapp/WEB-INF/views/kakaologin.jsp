<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 카카오 로그인 --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="UTF-8"></script> 
<script type="text/javascript"> 
//sdk를 초기화, 사용할 앱의 javascript키
Kakao.init('b0ad0b9e43ffa36c9151c79f86f2db3d');
//sdk 초기화 여부를 판단
Kakao.isInitialized();
</script>
<body>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=0051e1df68b8e3c9d056c9adaf343151&redirect_uri=http://localhost:8787/tour/kakaologin.do&response_type=code">로그인</a>
	
</body>
</html>
