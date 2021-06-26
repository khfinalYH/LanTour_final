<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

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
	                if(data) {
	                    alert("성공적으로 로그인되었습니다.");
	                    location.href="home.do";
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
						<a href="">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
						<a href="">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
						<a href="">회원가입</a>
					</td>
				</tr>
		</tbody>
	</table>

</body>
</html>