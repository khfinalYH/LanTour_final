<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function session(){
		var member_no = $('#member_no').val();
		
	}
</script>
<body>

	<h1>마이 페이지 정보확인</h1>
	
	<form action="./mypage.do" method="post" >
	<input type ="hidden" name = "member_no" value = "${login.member_no }">
	<!--  목록 -->
	<div>
	<ul>
		<li ><a href= mypage.do>내정보 확인</a></li>
		<li ><a href= mypageupdate.do>내정보 수정</a></li>
		<li ><a href= mypost.do>내게시글 확인</a></li>
		<li ><a href= mypayment.do>내결제내역 확인</a></li>
		<li ><a href= mytrip.do?member_no=${login.member_no }>내 여행계획 확인</a></li>
	</ul>
	

	<table border="1">
	 	 <tr>
            <th>아이디</th>
            <td>
               ${login.member_id }
            </td>
         </tr>
         <tr>
            <th>이름</th>
            <td>
               ${login.member_name }
            </td>
         </tr>
         <tr>
            <th>나이</th>
            <td>
               ${login.member_age }
            </td>
         </tr>
         <tr>
            <th>성별</th>
            <td>
               ${login.member_gender }
            </td>
         </tr>
         <tr>
            <th>이메일</th>
            <td>
               ${login.member_email }
            </td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td>
               ${login.member_phone }
            </td>
         </tr>
         <tr>
            <td colspan="2">
                <input type="button" value="수정하기" onclick="location.href='mypageupdate.do';"/>               
            </td>
         </tr>
      </table>
      </div>
      </form>
</body>
</html>