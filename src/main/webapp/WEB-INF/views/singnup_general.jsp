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
	// 아이디 중복 확인
	function idCheck() {
		var member_id = document.getElementsByName("member_id")[0].value;

		var idVal = {
			"member_id" : member_id
		}

		if (member_id.trim() == "" || member_id == null) {
			alert("아이디를 입력해 주세요");
		} else {
			$.ajax({
				type : 'POST',
				url : 'idCheck.do',
				data : JSON.stringify(idVal),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					if (data.check == false) {
						$("#idChk").attr("title", "y");
						alert("사용가능한 아이디입니다.");
					} else {
						alert("이미 존재하는 아이디입니다.");
					}
				},
				error : function() {
					alert("실패냐?");
				}
			})
		}
	}

	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "n") {
			alert("아이디 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	};

	// 비밀번호 일치 확인
	function pwCheck() {
		if (document.getElementById('pw').value != ''
				&& document.getElementById('pw2').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pw2').value) {
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('check').style.color = 'blue';
			} else {
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
</script>

</head>
<body>
	<form action="./registerres.do" method="post">
		<input type="hidden" name="member_grade" value="U" />
		<table border="1">

			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="idChk" name="member_id" title="n" required>
					<input type="button" value="중복체크" onclick="idCheck();">
				</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pw" name="member_password" onclick="idCheckConfirm();" onchange="pwCheck()" required>
				</td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="pw2" onclick="idCheckConfirm();" onchange="pwCheck()" required>
					&nbsp;<span id="check"></span>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="member_name" required>
				</td>
			</tr>

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
				<th>이메일</th>
				<td>
					<input type="email" name="member_email" required />
					<input type="button" name="" value="인증" onclick="">
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
</body>

</html>