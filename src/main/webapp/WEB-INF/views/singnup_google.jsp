<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
</script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="googlesignupres.do" method="post">
		<input type="hidden" name="member_grade" value="U" />
		<input type="hidden" name="idtoken" value="<%=request.getAttribute("idtoken") %>" />
		<table border="1">
		
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="member_age" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
				</td>
			</tr>

			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="member_gender" value="M" checked>
					남
					<input type="radio" name="member_gender" value="F">
					여
				</td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="member_phone" placeholder="-없이 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
				</td>
			</tr>

		</table>

		<div>
			<input type="submit" value="회원가입" />
			<input type="button" value="취소" onclick="location.href=''" />
		</div>

	</form>
	<jsp:include page="footer.jsp" />
</body>

</html>