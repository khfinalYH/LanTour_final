<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<!-- view -> controller전달(res.do) ->모델 통해 db에 저장. 다오에서 (마이바티스: 쿼리문 만들기) 디비. lantour_no_seq(seq:1씩 증가)   -->
	<h1>랜선투어 글쓰기</h1>
	<form action="./lantourinsertres.do" method="post">
	<input type ="hidden" name = "member_no" value = "${login.member_no }">
	<input type ="hidden" name = "lantour_rtc" value = "aaa">
		<table border="1">
			<tr>
				<th>투어 제목</th>
				<td>
					<input type="text" name="lantour_title">
				</td>
			</tr>
			<tr>
				<th>투어 내용</th>
				<td>
					<textarea rows="10" cols="60" name="lantour_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>투어 주소</th>
				<td>
					<input type="text" name="lantour_addr">
				</td>
			</tr>
			<tr>
				<th>투어 이미지</th>
				<td>
					<input type="text" name="lantour_image">
				</td>
			</tr>
			<tr>
				<th>최대 인원</th>
				<td>
					<input type="text" name="lantour_maxcount">
				</td>
			</tr>
			<tr>
				<th>투어 가격</th>
				<td>
					<input type="text" name="lantour_price">
				</td>
			</tr>
			<tr>
				<th>제한 요일</th>
				<td>
					<input type="text" name="lantour_date">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기"/>
					<input type="button" value="취소"	 onclick="location.href='lantourlist.do';"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>