<%@page import="com.lan.tour.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function session(){
		var member_no = $('#member_no').val();
		
	}
</script>
<% MemberDto Mdto =  (MemberDto)session.getAttribute("login"); %>

<body>
<jsp:include page="header.jsp" />
<div class="container">

	<br><br>
	<ul class="nav nav-pills" >
		  <li class="nav-item">
		    <a class="nav-link active" href="mypage.do">정보 확인</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="mypageupdate.do">정보 수정</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="mypost.do">게시글 확인</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="mypayment.do">결제내역 확인</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="mytrip.do?member_no=${login.member_no }">여행일정 확인</a>
		  </li>
		  <%if(Mdto.getMember_grade().equals("H")){ %>
		  <li class="nav-item">
		    <a class="nav-link" href="mypagehost.do">호스트 관리</a>
		  </li>
		  <%} %>
	</ul>
	<br><br>
	
	<form action="./mypage.do" method="post" >
	<input type ="hidden" name = "member_no" value = "${login.member_no }">
	<!--  목록 -->
	<div>


	

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

</div>
<jsp:include page="footer.jsp" />
</body>
</html>