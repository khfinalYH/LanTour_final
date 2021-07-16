<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="869891537807-u606s04umnomhs5tg7sufpd9c5g7fv6a.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  var id_token = googleUser.getAuthResponse().id_token;
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', 'googleTokensignin.do');
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  
	  xhr.onload = function() {
  		  console.log('Signed in as: ' + xhr.responseText);
  		  switch(xhr.responseText){
	  		  case "InvalidEmain":
	  			  alert("구글 이메일 인증이 되어있지 않습니다.")
	  			  break;
	  		  case "signup":
	  			  document.getElementById("id_token").value=id_token
	  			  alert("회원가입 페이지로 넘어갑니다")
  			      var f=document.google
			      f.idtoken.value = id_token; //POST방식으로 넘기고 싶은 값
			      f.action="googlesignup.do";//이동할 페이지
			      f.method="post";//POST방식
			      f.submit();
	  			  break;
	  		  case "login":
	  			  alert("로그인되었습니다.")
	  			  location.href="main.do"
	  			  break;
	  		  case "hasemail":
	  			  alert("이미 가입되어있는 이메일입니다")
	  			  break;
	  		  default : 
	  			  alert("부적합한 접근입니다(이메일과 토큰이 일치하지 않습니다.)")
	  			  break;
  		  }
	  };
	  xhr.send('idtoken=' + id_token);
	}
	

	$(function(){
	    $("#loginChk").hide();
	});
	
	
	function login() {
	    var member_id = $('#member_id').val().trim();
	    var member_password = $('#member_password').val().trim();
	
	    var sendByIdPw = {
	        "member_id" : member_id,
	        "member_password" : member_password
	    }
	
	    if (member_id == null || member_id == "" || member_password == null || member_password == "") {
	        alert("Id와 Password를 다시 확인해주세요");
	    } else {
	        $.ajax({
	            url: 'loginCheck.do',
	            type: 'post',
	            data: JSON.stringify(sendByIdPw),
				contentType : "application/json",
	            dataType: 'json',
	            success: function(data) {
	                if(data.check == true) {
	                    alert("성공적으로 로그인되었습니다.");
	                    location.href="main.do";
	                } else {
	                    $("#loginChk").show();
	                    $("#loginChk").html("Id 혹은 Password를 다시 확인해주세요.");
	                }
	            },
	            error: function() {
	                alert("통신 실패");
	            }
	        });
	    }
	}

</script>

</head>
<body>
<form name="google">
	<input type="hidden" name="idtoken" id="id_token" value="">
</form>

	<jsp:include page="header.jsp" />

	<table style="display:inline;">
		<tbody>
			<tr>
				<td>
					<input type="text" id="member_id" placeholder="Id" /><br/>
				</td>
				<td rowspan="2">
					<input type="button" value="login" onclick="login();">
				</td>
				<tr>
					<td>
						<input type="password" id="member_password" placeholder="Password" /><br/><br/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="loginChk"></td>
				</tr>
				<tr>
					<td colspan = "2">
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
						<a href="findid.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
						<a href="findpassword.do">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
						<a href="registselect.do">회원가입</a>
					</td>
				</tr>
		</tbody>
	</table>
	<jsp:include page="footer.jsp" />

</body>
</html>