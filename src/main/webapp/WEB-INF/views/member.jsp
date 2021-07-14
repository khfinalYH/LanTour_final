<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#memberchk").hide();    
	});
	
	function member(){
		var membergrade = $("#membergrade").val().trim();
		console.log(member_grade + "/" );
		
		if(member_grade == null || member_grade == "" ){
			alert("회원정보를 확인하세요");
		}else{
			var loginVal = {
					"member_grade" : member_grade,
			}
			
			$.ajax({
				type:"post",
				url:"ajaxmember.do",
				data: JSON.stringify(memberVal),   
				contentType:"application/json",   
				dataType: "json",        
				success: function(msg){
					if(msg.check == true){
						location.href="Member.do";
					}else{
						$("#memberchk").show().text("회원의 등급을 확인하세요");
					}
				},
				error: function(){
					alert("통신 실패.");
				}
			});
		}
	}
</script>

</head>

<body>
	<jsp:include page="header.jsp" />
	<h1>회원조회</h1>

	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="300"/>
		<col width="300"/>
		<col width="50"/>
		<col width="50"/>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>성별</th>
			<th>등급</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<th colspan="6">-----------------등록된 회원이 없습니다.------------------</th>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">

				<form action="memberupdate.do" method="post">
					<input type="hidden" name="member_no" value="${dto.member_no}" >
						<tr>
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
								<option value="U" >U</option>
								<option value="A">A</option>
								</c:when>
								
								<c:otherwise>
								<option value="H">H</option>
								<option value="U" selected>U</option>
								<option value="A">A</option>
								</c:otherwise>
								</c:choose>
								</select>
							</td>	
							<td>
								<input type="submit" value="수정"/>
							</td>		
						</tr>
				</form>
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
		
	</table>
	<jsp:include page="footer.jsp" />
</body>
</html>