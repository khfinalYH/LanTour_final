<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/board_detail.css">
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />

</head>
<body>
	<jsp:include page="header.jsp" />
	<c:set var="member_grade" value="${login.member_grade }" />
	
	
	<br><br>
	<div class="finalproject_board">
		<div class="board_main">
			<div>
				<div class="board_category">
					<span class="board_category">
						<span class="board_category_input"> 공지사항 </span>
					</span>
				</div>
				<div class="board_info">
					<div>
						<span class="board_title">
							<span class="board_title_input"> ${dto.notice_title } </span>
						</span>
					</div>

				</div>
				<div class="board_date">
					<span class="board_date">
						<span class="board_info_date">
							<fmt:formatDate value="${dto.notice_date }" pattern="yyyy-MM-dd" />
						</span>
					</span>
				</div>
			</div>
			<hr>
			<div class="board_content">${dto.notice_content }</div>

				<div class="board_button_div">
					<c:if test="${member_grade == 'A' }">
					<button type="button" class="btn btn-primary" onclick="location.href='noticeUpdateForm.do?notice_no=${dto.notice_no}'">수정</button>
					<button type="button" class="btn btn-primary" onclick="location.href='noticeDelete.do?notice_no=${dto.notice_no}'">삭제</button>
					</c:if>
					<button type="button" class="btn btn-primary" onclick="location.href='noticeList_category.do?nowPage=1'">목록</button>
				</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>	
</html>