<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LanTour</title>
</head>
<style>
	
</style>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container">
      <div class="row">
        <h1>내 정보 수정</h1>
        <div class="col-2">
          <br><br><br>
          <h3>마이페이지 목록</h3>
          <ul class="list-group">
            <li class="list-group-item"><a href="mypage.do" style="color:black"> 내 정보 확인</a></li>
            <li class="list-group-item active"><a href="mypageupdate.do" style="color:white"> 내 정보 수정</a></li>
            <li class="list-group-item" ><a href="mypost.do" style="color:black"> 내 게시글 확인</a></li>
            <li class="list-group-item"><a href="mypayment.do" style="color:black"> 내 결제내역 확인</a></li>
            <li class="list-group-item"><a href="mytrip.do?member_no=${login.member_no }" style="color:black"> 내 여행 계획</a></li>
          </ul>
        </div>
      </div>
    </div>
	<br><br>
	
	
	<form action="./mypageupdateres.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no }">
		<!--  목록 -->
		<div>

			<table class="container  col-1 col-lg-2" border="1">
				<tr>
					<th class="list-group-item">아이디</th>
					<td>
						<input type="text" name="member_id" readonly="readonly" value="${login.member_id }">
					</td>
				</tr>
				<tr>
					<th class="list-group-item">이름</th>
					<td>
						<input type="text" name="member_name" value="${login.member_name }">
					</td>
				</tr>
				<tr>
					<th class="list-group-item">비밀번호</th>
					<td>
						<input type="text" name="member_password" value="${login.member_password }">
					</td>
				</tr>
				<tr>
					<th class="list-group-item">이메일</th>
					<td>
						<input type="text" name="member_email" value="${login.member_email }">
					</td>
				</tr>
				<tr>
					<th class="list-group-item">전화번호</th>
					<td>
						<input type="text" name="member_phone" value="${login.member_phone }">
					</td>
				</tr>
				<tr>
					<td class ="flaot-right" colspan="2">
						<input type="submit" class="btn btn-primary float-right" value="수정완료" />
						<input type="button" class="btn btn-primary float-right" value="취소" onclick="location.href='mypage.do?mypage=${login.member_id}';" />
					</td>
				</tr>
			</table>

		</div>
	</form>
	
<jsp:include page="footer.jsp" />
</body>
</html>