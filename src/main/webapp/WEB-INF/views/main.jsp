<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="869891537807-u606s04umnomhs5tg7sufpd9c5g7fv6a.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="resources/js/currentWeather.js"></script>
<script type="text/javascript">
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
		location.href = "logout.do"
	}
	window.onload = function() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}
</script>
<script type="text/javascript" src="resources/js/currentWeather.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div id="js-weather"></div>

	<jsp:include page="footer.jsp" />
</body>
</html>