  
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
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
var MailRandNum = "";
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
						document.getElementById("idChk").setAttribute("readonly","readonly")
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
	
	function Emailceck(){
		var email = document.getElementById("email")
		var emailVal = {"email" : email.value}
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
						document.getElementById("EmailRandom").removeAttribute("disabled")
						document.getElementById("mailRandceck").removeAttribute("disabled")
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
	
	function EmailRandceck(){
		var rand = document.getElementById("EmailRandom").value
		var random = {"random":rand}
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
						document.getElementById("mailceck").setAttribute("readonly","readonly")
						document.getElementById("email").setAttribute("readonly","readonly")
						document.getElementById("EmailRandom").setAttribute("readonly","readonly")
						document.getElementById("mailRandceck").setAttribute("readonly","readonly")
						document.getElementById("submit").removeAttribute("disabled")
					}else{
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
	<br><br><br><br>
	<div class="container">
		<h4>일반 회원가입</h4>
		<br><br>
		<form action="./registerres.do" method="post">
			<input type="hidden" name="member_grade" value="U" />
			<fieldset>
			<div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">아이디</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" id="idChk" name="member_id" title="n" style="color: black;" required>
		        <button type="button" class="btn btn-primary btn-sm" onclick="idCheck();" style="float: right;">중복체크</button>
		      </div>
		    </div>
		    <br>
		    
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">비밀번호</label>
		      <div class="col-sm-10">
		        <input type="password" class="form-control" id="pw" name="member_password" onclick="idCheckConfirm();" onchange="pwCheck()" style="color: black;" required>
		      </div>
		    </div>
		    <br>
		    
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">비밀번호 확인</label>
		      <div class="col-sm-10">
		        <input type="password" class="form-control" id="pw2" onclick="idCheckConfirm();" onchange="pwCheck()" style="color: black;" required>&nbsp;<span id="check"></span>
		      </div>
		    </div>
		    <br>
		    
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">이름</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name="member_name" style="color: black;" required>
		      </div>
		    </div>
		    <br>
		    
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">나이</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name="member_age" style="color: black;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
		      </div>
		    </div>
		  	<br>
		  	
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">성별</label>
		      <div class="col-sm-10">
		        <input type="radio" name="member_gender" value="M" checked>남
				<input type="radio" name="member_gender" value="F">여
		      </div>
		    </div>
		    <br>
		    
		    <div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">이메일</label>
		      <div class="col-sm-10">
		        <input type="text" id="email" name="member_email" style="color: black;" required />
		        <button type="button" class="btn btn-primary btn-sm" id="mailceck" onclick="Emailceck();">인증메일 발송</button>
		        <br>
				<input type="text" id="EmailRandom" disabled>
				<button type="button" name="" class="btn btn-primary btn-sm" id="mailRandceck" style="color: black;" onclick="EmailRandceck();" disabled>확인</button>
		      </div>
		    </div>
		  	<br>

			<div class="form-group row" style="margin:0 auto; width: 60%;">
		      <label class="col-sm-2 col-form-label">전화번호</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name="member_phone" placeholder="-없이 입력하세요" style="color: black;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  required />
		      </div>
		    </div>
		  	<br><br>

			<div style="float: right;">
				<input id="submit" class="btn btn-outline-primary" type="submit" value="회원가입" disabled/>
				<input type="button" class="btn btn-outline-primary" value="취소" onclick="location.href='main.do'" />
			</div>
			</fieldset>
		</form>

	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>