
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
		if (chk == "n") {
			alert("아이디 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	};

	//비밀번호 중복 확인
	function pwCheck() {
		if (document.getElementById('pw').value != ''
				&& document.getElementById('pw02').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pw02').value) {
				$("#pw2").attr("class", "form-control is-valid");
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('check').style.color = 'green';
			} else {
				$("#pw2").attr("class", "form-control is-invalid");
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
	function Emailceck() {
		var email = document.getElementById("email")
		var emailVal = {
			"email" : email.value
		}
		if (email.value.trim() == "" || email.value == null) {
			alert("이메일을 입력해 주세요");
		} else {
			$.ajax({
				type : 'POST',
				url : 'emailcheck.do',
				data : JSON.stringify(emailVal),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					if (data.success != null) {
						alert("메일이 발송되었습니다.");
						document.getElementById("EmailRandom").removeAttribute(
								"disabled")
						document.getElementById("mailRandceck")
								.removeAttribute("disabled")
						MailRandNum = data.success
					} else {
						alert(data.error);
					}
				},
				error : function() {
					alert("통신 실패");
				}
			})
		}
	}

	function EmailRandceck() {
		var rand = document.getElementById("EmailRandom").value
		var random = {
			"random" : rand
		}
		if (rand.trim() == "" || rand == null) {
			alert("인증번호를 입력해 주세요");
		} else {
			$.ajax({
				type : 'POST',
				url : 'emailrandomcheck.do',
				data : JSON.stringify(random),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					if (data.result) {
						alert("인증되었습니다.")
						document.getElementById("mailceck").setAttribute(
								"readonly", "readonly")
						document.getElementById("email").setAttribute(
								"readonly", "readonly")
						document.getElementById("EmailRandom").setAttribute(
								"readonly", "readonly")
						document.getElementById("mailRandceck").setAttribute(
								"readonly", "readonly")
						document.getElementById("submit").removeAttribute(
								"disabled")
					} else {
						alert("부정확한 값입니다.")
					}
				},
				error : function() {
					alert("통신 실패");
				}
			})
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container" style="width: 1000px;">
		<form action="./registerres.do" method="post">
			<input type="hidden" name="member_grade" value="H" />
			<div class="form-group">
				<label for="exampleInputPassword1" style="display: block;" class="form-label mt-4">아이디</label>
				<input type="text" class="form-control" style="width: 70%; color: black; display: inline; margin-right: 20px;" id="idChk" name="member_id" title="n" required>
				<input type="button" class="btn btn-primary" value="중복체크" onclick="idCheck();">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
				<input type="password" class="form-control" style="width: 70%; color: black;" id="pw" name="member_password" onclick="idCheckConfirm();" onchange="pwCheck()" required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">비밀번호 확인</label>
				<input type="password" class="form-control" style="width: 70%; color: black;" id="pw2" onclick="idCheckConfirm();" onchange="pwCheck()" required>
				&nbsp;
				<span id="check"></span>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">이름</label>
				<input type="text" class="form-control" style="width: 70%; color: black;" name="member_name" required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">나이</label>
				<input type="text" class="form-control" style="width: 70%; color: black;" name="member_age" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" style="display: block;" class="form-label mt-4">이메일</label>
				<input type="text" class="form-control" style="width: 70%; color: black; display: inline; margin-right: 20px;" id="email" name="member_email" required>
				<input type="button" class="btn btn-primary" id="mailceck" value="인증메일 발송" onclick="Emailceck()">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" style="display: block;" class="form-label mt-4">인증번호</label>
				<input type="text" class="form-control" style="width: 70%; color: black; display: inline; margin-right: 20px;" id="EmailRandom" disabled>
				<input type="button" class="btn btn-primary" name="" value="확인" id="mailRandceck" onclick="EmailRandceck()" disabled>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label mt-4">전화번호</label>
				<input type="text" class="form-control" style="width: 70%; color: black;" name="member_phone" placeholder="-없이 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
			</div>
			<div class="form-group">
				<br>
				<label class="col-sm-2 col-form-label">성별</label>
				<label class="form-check-label" style="margin-right: 10px;">
					<input type="radio" class="form-check-input" name="member_gender" value="M">
					남자
				</label>
				<label class="form-check-label" style="margin-right: 10px;">
					<input type="radio" class="form-check-input" name="member_gender" value="F">
					여자
				</label>
			</div>
			<div class="form-group">
				<br>
				<input id="submit" type="submit" class="btn btn-primary" value="회원가입" disabled />
				<input type="button" value="취소" class="btn btn-primary" onclick="location.href='./loginform.do'" />
			</div>

		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>