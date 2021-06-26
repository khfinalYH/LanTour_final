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


		<!-- ID -->
		<div>
			<label for="member_id">ID</label><br>
			<input type="text" id="memeber_id" name="member_id" placeholder="Id" required="required">
			<input type="button" value="check" onclick="idCheck();">
		</div>

		<!-- PW -->
		<div>
			<label for="member_pw">PASSWORD</label><br>
			<input type="password" id="memeber_pw" name="member_pw" placeholder="Password" required="required">
		</div>


		<!-- 이름-->
		<div>
			<label for="member_name">이름</label><br>
			<input type="text" id="memeber_name" name="member_name" placeholder="NAME" required="required">
		</div>
		<!-- 나이 -->
		<div>
			<label for="member_age">나이</label>
			<input type="text" name="member_age" required="required">
		</div>

		<!-- 성별 -->
		<div>
			<label for="member_gender"></label><br> <label> 남 </label>
			<input type="radio" name="member_gender" value="M" checked="checked">
			<label> 여 </label>
			<input type="radio" name="member_gender" value="F">
		</div>


		<!-- 전화번호 -->
		<div>
			<label for="member_phone">Phone</label><br>
			<input type="text" id="memeber_phone" name="member_phone" placeholder="ex)010-1234-5678" required="required">
		</div>


		<!-- Email-->
		<div>
			<label for="member_email">Email</label><br>
			<input type="text" id="memeber_email" name="member_email" required="required">
			<br />
			<button type="submit" name="submit">이메일 인증받기</button>

		</div>



		<div>
			<input type="submit" value="회원가입">
			<input type="button" value="취소" onclick="loction.href=''" />
		</div>

	</form>


</body>
</html>