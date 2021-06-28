<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LanTour</title>
</head>
<body>


<h1>렌트카 검색</h1>

<form action="rentCarList.do">
	<div>
		<sapn>지역검색</sapn>
		<input type="text" name="addr">
		<input type="submit" value="검색">
		
		
		
	</div>

</form>

</body>
</html>