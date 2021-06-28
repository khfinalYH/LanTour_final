<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>숙소 insert, ${login.member_id },${login.member_no }</h1>
	<form action="./insertres.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" name="hotel_image" value="aaaaaa" />
		<table border="1">
			<tr>
				<th>숙소 종류</th>
				<td>
					<input type="text" name="hotel_type">
				</td>
			</tr>
			<tr>
				<th>숙소 이름</th>
				<td>
					<input type="text" name="hotel_title">
				</td>
			</tr>
			<tr>
				<th>숙소 설명</th>
				<td>
					<input type="text" name="hotel_content">
				</td>
			</tr>
			<tr>
				<th>숙소 가격</th>
				<td>
					<input type="text" name="hotel_price">
				</td>
			</tr>
			<tr>
				<th>숙소 주소</th>
				<td>
					<input type="text" name="hotel_addr">
				</td>
			</tr>
			<tr>
				<th>숙소 편의시설</th>
				<td>
					<input type="text" name="hotel_convinence">
				</td>
			</tr>
			<tr>
				<th>숙소 최대 인원</th>
				<td>
					<input type="text" name="hotel_maxcount">
				</td>
			</tr>
			<tr>
				<th>숙소 쉬는 요일</th>
				<td>
					<input type="text" name="hotel_date">
				</td>
			</tr>
			<tr>
				<td colspan ="2">
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>