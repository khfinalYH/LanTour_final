<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="./findupdatepwres.do">
		<input type="hidden" name="member_id" value="${dto.member_id }"/>
		<br>
		<span>새로운 비밀번호 입력</span>
		<input type="password" name="member_password">
		<br>
		<button type="submit">비밀번호 변경</button>
	</form>
</body>
</html>