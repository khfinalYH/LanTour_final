<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<style type="text/css">


</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:set var="member_grade" value="${login.member_grade }" />
	
	<div class="container">
	<div class="row flex-center mb-5">
	<div class="col-lg-8 text-center">
		<h1 class="fw-bold fs-md-3 fs-lg-4 fs-xl-5">${dto.notice_title }</h1>
		<hr class="mx-auto text-primary my-4" style="height:3px; width:570px;" />
		<p class="mx-auto">${dto.notice_content }</p>
		<c:if test="${member_grade == 'A' }">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='noticeUpdateForm.do?notice_no=${dto.notice_no}'">수정</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='noticeDelete.do?notice_no=${dto.notice_no}'">삭제</button>
		</c:if>
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='noticeList_category.do?nowPage=1'">목록</button>
	</div>
	</div>
	</div>


	<jsp:include page="footer.jsp" />
</body>	
</html>