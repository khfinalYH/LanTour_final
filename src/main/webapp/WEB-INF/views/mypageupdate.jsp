<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
	<br><br>
	
	<ul class="nav nav-pills" >
	  <li class="nav-item">
	    <a class="nav-link" href="mypage.do">정보 확인</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" href="mypageupdate.do">정보 수정</a>
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
	</ul>
	<br><br>
	
	<form action="./mypageupdateres.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no }">
		<!--  목록 -->
		<div>

			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_name" readonly="readonly" value="${login.member_name }">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="member_name" value="${login.member_name }">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="text" name="member_password" value="${login.member_password }">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="member_email" value="${login.member_email }">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="member_phone" value="${login.member_phone }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정완료" />
						<input type="button" value="취소" onclick="location.href='mypage.do?mypage=${login.member_id}';" />
					</td>
				</tr>
			</table>

		</div>
	</form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>