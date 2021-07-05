
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//아이디 중복 체크
	function idCheck() {
		var member_id = document.getElementsByName("member_id")[0].value;

		var idVal = {
			"member_id" : member_id
		}

		if (member_id.trim() == "" || member_id == null) {
			alert("아이디를 입력해 주세요");
		} else {
			$.ajax({
				type : "POST",
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
					alert("통신 실패");
				}
			})
		}
	}

	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "c") {
			alert("아이디 중복체크 해주세요");
			document.getElementsByName("member_id")[0].focus();
		}
	};

	//비밀번호 중복 확인
	function pwCheck() {
		if (document.getElementById('pw').value != ''
				&& document.getElementById('pw02').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pw02').value) {
				document.getElementById('check').innerHTML = '비밀번호 일치'
			} else {
				document.getElementById('check').innerHTML = '비밀번호 불일치';
			}
		}
	}
</script>
</head>
<body>

	<form action="./registerres.do" method="post">
		<input type="hidden" name="member_grade" value="H"/>
		<table border="1">


		<tr>
			<th>ID</th>
			<td>
			<input type="text" id="idChk" name="member_id" title="c" required="required">
			<input type="button" value="중복확인" onclick="idCheck();">
			</td>
		</tr>
		

		<tr>
			<th>PW</th>
			<td>
			<input type="password" id="pw" name="member_password" onclick="idCheckfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
			<input type="password" id="pw02" onclick="idCheckConfirm();" onchange="pwCheck()" required> &nbsp;<span id="check"></span>
			</td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td>
			<input type="text" id="memeber_name" name="member_name" required="required">
			</td>
		</tr>
		
		<tr>
			<th>나이</th>
			<td>
			<input type="text" name="member_age" required="required">
			</td>
		</tr>
		
		<tr>
			<th>성별</th>
			<td>
			<input type="radio" name="member_gender" value="M" checked="checked">남자
			<input type="radio" name="member_gender" value="F">여자
			</td>
		</tr>

		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="member_phone" required="required">
			</td>
		</tr>

		<tr>
			<th>Email</th>
			<td>
			<input type="text" name="member_email" required="required">
			<br/>
			<input type="button" value="인증받기">
			</td>
		</tr>
	</table>

		<div>
			<input type="submit" value="회원가입_host">
			<input type="button" value="취소" onclick="loction.href=''" />
		</div>

	</form>


</body>
</html>