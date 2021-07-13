<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form action="./findidres.do" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="member_name" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_email" />
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">id찾기</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>