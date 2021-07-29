<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LanTour</title>
<link href='resources/css/bootstrap.min.css' rel='stylesheet' />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
<script type="text/javascript">
	$(function() {
		StarSetting();
		paging(1);
	})
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
	function search() {
		var category = $(".search_category option:selected").val();
		var keyword = $(".search_keyword").val();
		if (keyword.trim() == '') {
			swal('검색어를 입력해주세요.');
			return false;
		}
		location.href = 'lantourlist_category.do?category=' + category
				+ '&keyword=' + keyword + '&curPage=1';
	}
	
	function list(page){
	    console.log("페이지를 이동합니다.");
	    location.href="lantourlist.do?curPage="+page;
	}
	window.onload = function() {
		var cate = document.getElementById("selected_cate").value;
		if (cate == "") {
			$('.search_category').val('l_t').prop("selected", true);
		} else {
			$('.search_category').val(cate).prop("selected", true);
		}
	}
</script>
<style type="text/css">
#tour {
	display: grid;
}

.tour-list {
	margin: auto;
	width: 60%;
}
.paging-div {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

</style>

</head>
<body>
	<jsp:include page="header.jsp" />


	<div id="tour">
		<div class="tour-list">
			<div>
				<input type="hidden" value="${dto.category}"id="selected_cate">
				<div class="searchFrame">
					<select class="search_category">
						<option value="l_t">제목</option>
						<option value="l_c">내용</option>
					</select> 
					<input type="text" class="search_keyword" value="${dto.keyword }">
					<button class="btn btn-primary btn-sm" onclick="search();" >검색</button>
				</div>
				<br>
				<br>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<th colspan="4">------------등록된 투어가 없습니다------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="i" value="0" />
						<c:forEach items="${list }" var="dto">

							<div class="card mb-3" style="width: 30%; float: left; min-height: 400px; margin-right: 20px; border: 1px solid #3984C0;" onclick="location.href='./lantourdetail.do?lantour_no=${dto.lantour_no } '">

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
		<c:if test="${login.member_grade eq 'H' }">
			<div>
				<div class="form-group" align="center">
					<input type="button" class="btn btn-primary" value="투어 등록" onclick="location.href='lantourinsert.do'" />
				</div>
			</div>
		</c:if>
		<br>
		<br>
		</div>
		<div class="paging-div">
			<ul class="pagination">
				<li class="page-item disbled">
				<span class="page-link">
				<a href="#" onclick="list('${pager.prevPage}')">&laquo;</a></span>
				</li>	
				<c:forEach begin="${dto.blockBegin}" end="${dto.blockEnd}" var="index">
					<c:choose>
						<c:when test="${dto.curPage eq index}">
							<li class="page-item disbled"><span class="page-link">
								<a href="#">${index}</a>
								</span>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disbled"><span class="page-link">
								<a href="#" onclick="list('${index}')" >${index}</a>
								</span>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item disbled"><span class="page-link">
				<c:if test="${dto.curBlock <= dto.totBlock}">
                <a href="#" onclick="list('${pager.nextPage}')">&raquo;</a>
	            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
	            </span>
	            </li>
	           </ul>
	          </div>
	          <br/>
	          <br/>
	<jsp:include page="footer.jsp" />

</body>
</html>