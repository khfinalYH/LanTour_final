<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		commentlist();
		$(".commentupdate").click(function () {
			alert("클릭");
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
					$("#commenttable").append("<tr><th>"+list[i].member_name+"</th><td><input type='text' name='comment_content' value="+list[i].comment_content+" readonly='readonly'/></td><td><input type='button' name="+list[i].comment_no+" value='수정' class='commentupdate'/></td></tr>");
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
	<table border="1">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="community_title" value="${dto.community_title }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" value="${dto.member_name }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.community_content }</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="location.href='communityupdate.do?community_no=${dto.community_no}'">게시글 수정</button>
				<button type="button" onclick="location.href='communitydelete.do?community_no=${dto.community_no}'">게시글 삭제</button>
			</td>
		</tr>


	</table>

	<div>
		<input type="text" name="comment_content" id="comment_content">
		<button type="button" onclick="commentinsert(${login.member_no})">댓글 등록</button>
	</div>
	<div>
		<table id="commenttable" border="1">
		</table>
	</div>

</body>
</html>