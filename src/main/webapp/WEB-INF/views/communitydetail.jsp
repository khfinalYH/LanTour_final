<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		commentlist();
		$(document).on("click",".commentupdate",function () {
			$(this).val("수정완료");
			$(this).parent().prev().children().prop("readonly","");
			$(this).parent().prev().children().focus();
			$(this).attr("value","수정완료").click(function () {
				var comment_content = $(this).parent().prev().children().val();
				var comment_no = $(this).prop("name");
				$.ajax({
					type : "post",
					url : "commentupdate.do",
					data : {"comment_content" : comment_content,"comment_no":comment_no},
					dataType : "json",
					success : function (msg) {
						if(msg.check == true){
							commentlist();
						}else {
							alert("댓글 수정 실패");
						}
					},
					error : function () {
						alert("통신 실패");
					}
					
				});
			});
		});
	})
	function commentinsert(no) {
		var member_no = no;
		var comment_content = $("#comment_content").val();
		var community_no = ${dto.community_no };
		$.ajax({
			type : "post",
			url : "commentinsert.do",
			data : {"member_no":member_no,"comment_content":comment_content,"community_no":community_no},
			dataType : "json",
			success : function (msg) {
				if(msg.check == true){
					$("#comment_content").val("");
					commentlist();
				} else {
					alert("댓글 등록 실패");
				}
			},
			error : function () {
				alert("통신 실패");
			}
		});
	}
	function commentlist() {
		$("#commenttable").empty();
		var community_no = ${dto.community_no };
		$.ajax({
			type:"post",
			url : "commentlist.do",
			data : {"community_no":community_no},
			datatype : "json",
			success : function (msg) { 
				var list = msg.list;
				for(var i = 0; i < list.length; i++){
					var $tr = $("<tr>");
					$tr.append($("<th>"+list[i].member_name+"</th>"));
					if(list[i].comment_delflag == 'Y'){
						$tr.append($("<td colspan='2'>-----------------삭제된 댓글입니다----------------<td>"))
					}else {
						$tr.append($("<td><input type='text' name='comment_content' value="+list[i].comment_content+" readonly='readonly'/></td>"));	
					}	
					$tr.append($("<td><input type='button' name="+list[i].comment_no+" value='수정' class='commentupdate'/></td>"));
					$('#commenttable').append($tr);
				}
			},
			error : function () {
				alert("통신 실패")
			}
		});
	}
</script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<table border="1">
		<tr>
			<th>제목</th>
			<td>
				${dto.community_title }
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				${dto.member_name }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.community_content }</td>
		</tr>
		<c:if test="${dto.member_no eq login.member_no }">
			<tr>
				<td>
					<button type="button" onclick="location.href='communityupdate.do?community_no=${dto.community_no}'">게시글 수정</button>
					<button type="button" onclick="location.href='communitydelete.do?community_no=${dto.community_no}'">게시글 삭제</button>
				</td>
			</tr>
		</c:if>


	</table>

	<div>
		<input type="text" name="comment_content" id="comment_content">
		<button type="button" onclick="commentinsert(${login.member_no})">댓글 등록</button>
	</div>
	<div>
		<table id="commenttable" border="1">
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>