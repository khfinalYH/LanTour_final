<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form action="./findpasswordres.do" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" />
				</td>
			</tr>
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
					<button type="submit">비밀번호 찾기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>