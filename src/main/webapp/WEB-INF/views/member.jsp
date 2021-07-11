<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<body>

	<h1>회원조회</h1>
	
	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="300"/>
		<col width="300"/>
		<col width="50"/>
		<col width="50"/>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>성별</th>
			<th>등급</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<th colspan="6">-----------------등록된 회원이 없습니다.------------------</th>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<form action="memberupdate.do" method="post">
					<input type="hidden" name="member_no" value="${dto.member_no}" >
						<tr>
							<td>${dto.member_id }</td>
							<td>${dto.member_name }</td>
							<td>${dto.member_phone }</td>
							<td>${dto.member_email }</td>
							<td>${dto.member_gender }</td>
							<td>
								<select name="member_grade">
								<c:choose>
								<c:when test='${dto.member_grade eq "H" }'>
								<option value="H" selected>H</option>
								<option value="U" >U</option>
								<option value="A">A</option>
								</c:when>
								
								<c:otherwise>
								<option value="H">H</option>
								<option value="U" selected>U</option>
								<option value="A">A</option>
								</c:otherwise>
								</c:choose>
								</select>
							</td>	
							<td>
								<input type="submit" value="수정"/>
							</td>		
						</tr>
				</form>
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
		
	</table>

</body>
</html>