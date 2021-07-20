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

	<div id="js-weather"></div>

	<jsp:include page="footer.jsp" />
</body>
</html>