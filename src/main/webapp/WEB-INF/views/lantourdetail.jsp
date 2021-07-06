<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function update_hotel() {
	var update = confirm("투어 정보를 수정하시겠습니까?")
	if(update){
		location.href="./lantourupdate.do?lantour_no=${dto.lantour_no }";
	}
}
</script>
<body>
	<h1>랜선투어 상세페이지</h1>
	
	<c:set var="login_member" value="${login.member_no }" />
	<c:set var="host_member" value="${dto.member_no }" />
	<c:set var="lantour_rtc" value="${dto.lantour_rtc }" />


	<c:if test="${login_member eq host_member }">
		<form action="https://localhost:3000/" method="post">
	  		<input type="hidden" value="${login.member_grade }" name="member_grade">
	  		<input type="hidden" value="${login.member_no }" name="member_no">
	  		<input type="hidden" value="${dto.lantour_no }" name="lantour_no">
	  		<input type="submit" id= "open" value="방 생성 (호스트)">
		</form>
	</c:if>
	
	<!--  아직 수정 중 -->
	<c:if test="${lantour_rtc != 'aaa' && lantour_rtc != 'https://localhost:3000/aaa' }">
		<input type="hidden" id="member_no" name="member_no" value="${login.member_no }" />
		<input type="hidden" id="lantour_no" name="lantour_no" value="${dto.lantour_no }" />
		<input type="hidden" id="lantour_rtc" name="lantour_rtc" value="${lantour_rtc}" />
		<input type="button" value="참여하기" onclick="guestrtc()"/>
	</c:if>		


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
			<td><img src = "${dto.lantour_image }"></td>
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
			<th>투어 일정</th>
			<td>${dto.lantour_date }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href='lantourupdate.do?lantour_no=${dto.lantour_no}'"/>
				<input type="button" value="삭제" onclick="location.href='lantourdelete.do?lantour_no=${dto.lantour_no}'" />
				<input type="button" value="목록" onclick="location.href='lantourlist.do'" />
			</td>
		</tr>
	</table>
</body>
</html>