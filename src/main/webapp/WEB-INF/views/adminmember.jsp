<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".btn").click(
				function() {
					var tr = $(this).parent().parent();
					var td = tr.children();
					var member_no = td.eq(0).text();
					var member_grade = td.eq(6).children().val();

					location.href = "./adminmemberupdate.do?member_no="
							+ member_no + "&member_grade=" + member_grade;
				});
	})
</script>
<style type="text/css">
.admin{
	margin: auto;
	width: 1000px;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">

		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link active" href="adminmember.do">회원관리</a></li>
			<li class="nav-item"><a class="nav-link" href="admincommunity.do">커뮤니티 게시판 글 목록</a></li>
		</ul>
		<br>
		<table border="1" class="table table-hover text-center" >
			<thead>
				<tr style="background-color: #4582ec; color: #ffffff;">
					<th scope="col">번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">전화번호</th>
					<th scope="col">이메일</th>
					<th scope="col">성별</th>
					<th scope="col">등급</th>
					<th scope="col">관리</th>
					<c:choose>
						<c:when test="${empty m_list }">
							<tr>
								<th colspan="7">-----------------등록된 회원이 없습니다.------------------</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${m_list }" var="dto">
								<tr>
									<td>${dto.member_no }</td>
									<td>${dto.member_id }</td>
									<td>${dto.member_name }</td>
									<td>${dto.member_phone }</td>
									<td>${dto.member_email }</td>
									<td>${dto.member_gender }</td>
									<td>
										<select name="member_grade">
											<c:choose>
												<c:when test='${dto.member_grade eq "H" }'>
													<option value="H" selected>H</option>
													<option value="U">U</option>
												</c:when>

												<c:otherwise>
													<option value="H">H</option>
													<option value="U" selected>U</option>
												</c:otherwise>
											</c:choose>
										</select>
									</td>
									<td >
										<button type="button" class="btn btn-primary btn-sm">수정</button>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		</table>
	</div>


	<jsp:include page="footer.jsp" />
	<br />
	<br />
</body>
</html>