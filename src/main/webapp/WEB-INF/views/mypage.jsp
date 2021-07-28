<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜선투어</title>

</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function session(){
		var member_no = $('#member_no').val();
		
	}
function mypagesecession() {
		
		Kakao.init('b0ad0b9e43ffa36c9151c79f86f2db3d');
		Kakao.Auth.setAccessToken("<%=(String)session.getAttribute("token") %>");
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
		  console.log('User signed out.');
		});
		auth2.disconnect();
		//카카오 로그아웃
		if (!Kakao.Auth.getAccessToken()) {
		  console.log('Not logged in.');
		  
		}
		if("<%=(String)session.getAttribute("token") %>" != ""){
			Kakao.Auth.logout(function() {
				  console.log(Kakao.Auth.getAccessToken());
				  location.href="https://kauth.kakao.com/oauth/logout?client_id=0051e1df68b8e3c9d056c9adaf343151&logout_redirect_uri=https://ec2-3-17-76-13.us-east-2.compute.amazonaws.com:8443/tour/mypagesecession.do";
				});
		} 
		location.href="mypagesecession.do"
	}
	
	
</script>
<body>`
	<jsp:include page="header.jsp" />
	
	
	
	<div class="container">
      <div class="row">
        <h1>내 정보</h1>
        <div class="col-2">
          <br><br><br>
          <h3>마이페이지 목록</h3>
          <ul class="list-group">
            <li class="list-group-item active"><a href="mypage.do" style="color:white"> 내 정보 확인</a></li>
            <li class="list-group-item"><a href="mypageupdate.do" style="color:black"> 내 정보 수정</a></li>
            <li class="list-group-item" ><a href="mypost.do" style="color:black"> 내 게시글 확인</a></li>
            <li class="list-group-item"><a href="mypayment.do" style="color:black"> 내 결제내역 확인</a></li>
            <li class="list-group-item"><a href="mytrip.do?member_no=${login.member_no }" style="color:black"> 내 여행 계획</a></li>
          </ul>
        </div>
      </div>
    </div>
    
    
	<form action="./mypage.do" method="post" >
	<input type ="hidden" name = "member_no" value = "${login.member_no }">
	<!--  목록 -->
	<div>


		<table class="container col-1 col-lg-2" border="1">
		 	 <tr>
	            <th class="list-group-item">아이디</th>
	            <td>
	               ${login.member_id }
	            </td>
	         </tr>
	         <tr>
	            <th class="list-group-item">이름</th>
	            <td>
	               ${login.member_name }
	            </td>
	         </tr>
	         <tr>
	            <th class="list-group-item">나이</th>
	            <td>
	               ${login.member_age }
	            </td>
	         </tr>
	         <tr>
	            <th class="list-group-item">성별</th>
	            <td>
	               ${login.member_gender }
	            </td>
	         </tr>
	         <tr>
	            <th class="list-group-item">이메일</th>
	            <td>
	               ${login.member_email }
	            </td>
	         </tr>
	         <tr>
	            <th class="list-group-item">전화번호</th>
	            <td>
	               ${login.member_phone }
	            </td>
	         </tr>
	         <tr>
	         <th>
	            <td colspan="2">
	                <input class="btn btn-primary float-right" type="button" value="수정하기" onclick="location.href='mypageupdate.do';"/>
	                <input class="btn btn-primary float-right" type="button" value="회원탈퇴" onclick="location.href='mypagesecession.do'"/>               
	            </td>
	         </tr>
	      </table>
      </div>
      </form>
<jsp:include page="footer.jsp" />
</body>
</html>