<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="community_title" value="${dto.community_title }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" value="${dto.member_name }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.community_content }</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="location.href='communityupdate.do?community_no=${dto.community_no}'">게시글 수정</button>
				<button type="button" onclick="location.href='communitydelete.do?community_no=${dto.community_no}'">게시글 삭제</button>
			</td>
		</tr>


	</table>
</body>
</html>