<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>랜선투어 글쓰기</h1>
	<form action="./lantourinsertres.do" method="post">
		<table border="1">
			<tr>
				<th>투어 제목</th>
				<td>
					<input type="text" name="lantour_title">
				</td>
			</tr>
			<tr>
				<th>최대인원</th>
				<td>
					<input type="text" name="lantour_maxcount">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="lantour_price">
				</td>
			</tr>
			<tr>
				<th>투어 주소</th>
				<td>
					<input type="text" name="lantour_addr">
				</td>
			</tr>
			<tr>
				<th>투어 내용</th>
				<td>
					<textarea rows="10" cols="60" name="lantour_content"></textarea>
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기"/>
					<input type="button" value="취소"	 onclick="location.href='lantour.do';"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>