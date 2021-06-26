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

<title>idChk</title>

<script type="text/javascript">
	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "n") {
			alert("id 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	}
	function idCheck() {
		var doc = document.getElementsByName("member_id")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("id를 입력해주세요");
		} else {
			open("idcheck.jsp?id=" + doc.value, "",
					"width=250, height=200,location= no,toolbars= no,status= no");
		}
	}
</script>
</head>
<body>

	<form action="register.do" method="post">
	<table border="1">

		<!-- ID -->
		<tr>
			<th>ID</th>
			<td>
			<input type="text" id="memeber_id" name="member_id" placeholder="Id" required="required">
			<input type="button" value="check" onclick="idCheck();">
			</td>
		</tr>

		<!-- PW -->
		<tr>
			<th>PASSWORD</th>
			<td>
			<input type="password" id="memeber_pw" name="member_pw" placeholder="Password" required="required">
			</td>
		</tr>


		<!-- 이름-->
		<tr>
			<th>이름</th>
			<td>
			<input type="text" id="memeber_name" name="member_name" placeholder="NAME" required="required">
			</td>
		</tr>
		<!-- 나이 -->
		<tr>
			<th>나이</th>
			<td>
			<input type="text" name="member_age" required="required">
			</td>
		</tr>			

		<!-- 성별 -->
		<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="member_gender" value="M" checked="checked">
			<input type="radio" name="member_gender" value="F">
			</td>
		</tr>


		<!-- 전화번호 -->
		<tr>
			<th>전화번호</th>
			<td>
			<input type="text" id="memeber_phone" name="member_phone" placeholder="ex)010-1234-5678" required="required">
			</td>
		</tr>


		<!-- Email-->
		<tr>
			<th>이메일l</th>
			<td>
			<input type="text" id="memeber_email" name="member_email" required="required">
			<button type="submit" name="submit">이메일 인증받기</button>
			</td>
		</tr>
</table>


		<div>
			<input type="submit" value="JOIN">
			<input type="button" value="취소" onclick="loction.href=''" />
		</div>

	</form>


</body>
</html>