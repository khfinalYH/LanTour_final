<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<br><br>
	<div class="container">
	<h1>ID 찾기</h1>
	<fieldset>
	<form action="./findidres.do" method="post">
	<div class="form-group" style="margin:0 auto; width: 50%;">
      <label for="exampleInputEmail1" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name="member_name" placeholder="회원가입 시 등록한 이름을 입력해주세요.">
    </div>
    <div class="form-group" style="margin:0 auto; width: 50%;">
      <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
      <input type="email" class="form-control" id="exampleInputEmail1" name="member_email" placeholder="회원가입 시 등록한 이메일을 입력해주세요.">
      <br><br>
      <button type="submit" class="btn btn-primary" style="float: right;">id 찾기</button>
    </div>
    <br><br><br>
		
	</form>
	</fieldset>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>