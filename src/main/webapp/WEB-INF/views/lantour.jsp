<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function StarSetting() {
		var score = document.getElementsByClassName('score')
		var scoreStar = document.getElementsByClassName('scoreStar')
		for (i = 0; i < score.length; i++) {
			var scoreint = parseInt(score[i].innerHTML)
			switch (scoreint) {
			case 1:
				scoreStar[i].innerHTML = '★☆☆☆☆'
				break;
			case 2:
				scoreStar[i].innerHTML = '★★☆☆☆'
				break;
			case 3:
				scoreStar[i].innerHTML = '★★★☆☆'
				break;
			case 4:
				scoreStar[i].innerHTML = '★★★★☆'
				break;
			case 5:
				scoreStar[i].innerHTML = '★★★★★'
			}
		}
	}
	window.onload = function() {
		StarSetting()
	}
</script>
<style type="text/css">
#tour{
	display:grid;
	
}
.tour-list {
	margin: auto;
	width: 60%;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />


	<div id="tour">
		<div class="tour-list">
			<div>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<th colspan="4">------------등록된 투어가 없습니다------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="i" value="0" />
						<c:forEach items="${list }" var="dto">
							<div class="card mb-3"
								style="width: 30%; float: left; min-height: 400px; margin-right: 20px; border: 1px solid #3984C0;"
								onclick="location.href='./lantourdetail.do?lantour_no=${dto.lantour_no } '">

								<div class="card-body">
									<h5 class="card-title">${dto.lantour_title }</h5>
								</div>
								<img src="${dto.lantour_image }">
								<div class="card-body">
									<p class="card-text">${dto.lantour_content }</p>
								</div>
								<ul class="list-group list-group-flush"
									style="border-bottom: 1px solid #adadad;">
									<c:choose>
										<c:when test="${dto.lantour_no eq scorelist[i].lantour_no}">
											<li class="list-group-item"><span class="scoreStar"></span>${scorelist[i].review_score }<span>/5(${scorelist[i].review_no })</span></li>
											<c:set var="i" value="${i+1 }"></c:set>
										</c:when>
										<c:otherwise>
											<li class="list-group-item">☆☆☆☆☆0/5(0)</li>
										</c:otherwise>
									</c:choose>
								</ul>
								<div class="card-footer">${dto.lantour_date }</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

					
			</div>
		</div>
		<div class="form-group" align="center">
						<input type="button" class="btn btn-primary" value="투어 등록"
							onclick="location.href='./lantourinsert.do'" />
					</div>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>