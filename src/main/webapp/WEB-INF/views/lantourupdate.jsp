<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function upload() {
		var form = new FormData();
		form.append("mpfile", $("#file1")[0].files[0])
		$.ajax({
			type : "post",
			enctype : 'multipart/form-data',
			url : "lantourupload.do",
			processData : false,
			contentType : false,
			data : form,
			dataType : "json",
			success : function(msg) {
				$("#lantour_image").val(msg.path)
			},
			error : function() {
				alert("통신 실패");
			}
		})
	}
	function insertDate(){
		var dateTd = document.getElementById("DateTd")
		dateTd.innerHTML = dateTd.innerHTML+"<input class='DateContent' style='display:block;'type='date' name='lantour_date'>"
	}
	
	function deleteDate(){
		var DateContent = document.getElementsByClassName("DateContent")
		if(DateContent.length>1){
			DateContent[DateContent.length-1].remove()
		}
	}
	
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
		<form action="./lantourupdateres.do" method="post" enctype ="multipart/form-data">
		<input type ="hidden" name = "member_no" value = "${login.member_no }">
		<input type ="hidden" name = "lantour_rtc" value = "aaa">
		<input type="hidden" id="lantour_image" name="lantour_image" />
		
		<table class="table table-hover" >
		<thead>
			<tr style="backgound-color:#adadad; color:#ffffff;">
				<th colspan="2" scope="col" class="text-center" style="text-align: center;">투어정보</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<th scope="row" style="text-align: center;"><p>투어명</p></th>
			<td>${dto.lantour_title }</td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>투어소개</p></th>
			<td><textarea rows="10" cols="60">${dto.lantour_content }</textarea></td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>RTC</p></th>
			<td>${dto.lantour_rtc }</td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>투어장소</p></th>
			<td><textarea rows="2" cols="60">${dto.lantour_addr }</textarea></td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>미리보기</p></th>
			<td><img src = "${dto.lantour_image }"></td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>최대인원</p></th>
			<td><select id="count" name="count">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
					</select>
			</td>
		</tr>
		<tr>
			<th scope="row" style="text-align: center;"><p>가격</p></th>
			<td>${dto.lantour_price }</td>
		</tr>
		
	</tbody>
			<tr>
				<th>투어 일정</th>
				<td id="DateTd">
					<input class="DateContent" type="date" name="lantour_date">
					<input type="button" onclick="insertDate()" value="추가">
					<input type="button" onclick="deleteDate()" value="삭제">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary" value="글 수정" onclick="location.href='lantourinsert.do?lantour_no=${dto.lantour_no}'"/>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>