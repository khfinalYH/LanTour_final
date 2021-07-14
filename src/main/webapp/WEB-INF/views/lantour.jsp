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
	function StarSetting(){
		var score = document.getElementsByClassName('score')
		var scoreStar =document.getElementsByClassName('scoreStar')
		for(i = 0; i < score.length;i++){
		    var scoreint = parseInt(score[i].innerHTML) 
		    switch(scoreint){
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
	window.onload = function(){
		StarSetting()
	}

</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1>랜선투어</h1>
	<table border="1">
		<col width="50"/>
		<col width="150"/>
		<col width="500"/>
		<col width="150"/>
		<col width="150"/>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<th colspan="4">------------작성된 글이 없습니다------------</th>
			</tr>
			</c:when>
			<c:otherwise>
				<c:set var="i" value="0"/>			
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.lantour_no }</td>
					<td><a href="./lantourdetail.do?lantour_no=${dto.lantour_no }">${dto.lantour_title }</a></td>
					<td>${dto.lantour_content }</td>
					<c:choose>
						<c:when test="${dto.lantour_no eq scorelist[i].lantour_no}">
							<td><span class="scoreStar"></span><br/>
							<span class="score">${scorelist[i].review_score }</span><span>/5(${scorelist[i].review_no })</span></td>
							<c:set var="i" value="${i+1 }"></c:set>
						</c:when>
						<c:otherwise>						
							<td>☆☆☆☆☆<br/>0/5(0)</td>
						</c:otherwise>
					</c:choose>
					<td>${dto.lantour_regdate }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="투어 등록" onclick="location.href='./lantourinsert.do'"/>
			</td>
		</tr>	
	</table>
	
	
	<jsp:include page="footer.jsp" />
	
</body>
</html>