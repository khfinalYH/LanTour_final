<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>랜선투어 상세페이지</h1>

	<table border="1">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<col width ="100">
		<tr>
			<th>제목</th>
			<td>${dto.lantour_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.lantour_content }</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.lantour_regdate }</td>
		</tr>
		<tr>
			<th>RTC</th>
			<td>${dto.lantour_rtc }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.lantour_addr }</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>${dto.lantour_image }</td>
		</tr>
		<tr>
			<th>최대인원</th>
			<td>${dto.lantour_maxcount }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.lantour_price }</td>
		</tr>
		<tr>
			<th>제한요일</th>
			<td>${dto.lantour_date }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="삭제" onclick="location.href='lantourdelete.do?lantour_no=${dto.lantour_no}'" />
				<input type="button" value="목록" onclick="location.href='lantourlist.do'" />
			</td>
		</tr>
	</table>
</body>
</html>