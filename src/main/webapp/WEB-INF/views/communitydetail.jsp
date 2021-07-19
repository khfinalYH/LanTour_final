<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="./resources/css/board_detail.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript">
	$(function () {
		commentlist();
		$(document).on("click",".commentupdate",function () {
			$(this).val("수정완료");
			$(this).parent().prev().children().children().prop("readonly","");
			$(this).parent().prev().children().children().focus();
			$(this).attr("value","수정완료").click(function () {
				var comment_content = $(this).parent().prev().children().children().val();
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
		$(document).on("click",".commentdelete",function (){
			var comment_no = $(this).prop("name");
			$.ajax({
				type : "post",
				url : "commentdelete.do",
				data : {"comment_no":comment_no},
				dataType:"json",
				success : function (msg) {
					if(msg.check == true){
						commentlist();
					}else {
						alert("댓글 삭제 실패");
					}
				},
				error : function() {
					alert("통신 실패");
				}
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
		$(".replyListParent").empty();
		var community_no = ${dto.community_no };
		$.ajax({
			type:"post",
			url : "commentlist.do",
			data : {"community_no":community_no},
			datatype : "json",
			success : function (msg) { 
				var list = msg.list;
				for(var i = 0; i < list.length; i++){
					var $div = $("<div>");
					$div.append($("<div>"+list[i].member_name+"</div>"))
					$(".replyListParent").append($div);
					$div = $("<div>");
					if(list[i].comment_delflag == 'N'){
						$div.append($("<div><textarea rows='1' cols='80' disable='disable' readonly='readonly' class='reply_content'>"+list[i].comment_content+"</textarea></div>"))
					} else {
						$div.append($("<div>---------삭제된 댓글입니다------------</div>"));
					}
					$(".replyListParent").append($div);
					if(list[i].member_name == "${login.member_name}"){
						$div = $("<div>");
						$div.append($("<input type='button' value='수정' name="+list[i].comment_no+" class='commentupdate'/>"))
						$div.append($("<input type='button' value='삭제' name="+list[i].comment_no+" class='commentdelete'/>"))
						$(".replyListParent").append($div);
					}
					
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
	<div class="finalproject_board">
		<div class="board_main">
			<div>
				<div class="board_category">
					<span class="board_category">
						<span class="board_category_input"> 정보게시판 </span>
					</span>
				</div>
				<div class="board_info">
					<div>
						<span class="board_title">
							<span class="board_title_input"> ${dto.community_title } </span>
						</span>
					</div>
					<div>
						<span> 작&nbsp;성&nbsp;자&nbsp; : </span>
						<span>
							<input style="border: none" type="text" value="${dto.member_name }" readonly="readonly">
						</span>
					</div>
				</div>
				<div class="board_date">
					<span class="board_date">
						<span class="board_info_date">
							<fmt:formatDate value="${dto.community_regdate }" pattern="yyyy.MM.dd hh:mm" />
						</span>
					</span>
				</div>
			</div>
			<hr>
			<div class="board_content">${dto.community_content }</div>
			<c:if test="${dto.member_no eq login.member_no }">
				<div class="board_button_div">
					<div>
						<button type="button" class="btn btn-primary" onclick="location.href='communityupdate.do?community_no=${dto.community_no}'">게시글 수정</button>
						<button type="button" class="btn btn-primary" onclick="location.href='communitydelete.do?community_no=${dto.community_no}'">게시글 삭제</button>
					</div>
				</div>
			</c:if>
		</div>
		<br /> <br /> <br /> <br />

		<div class="comment">
			<c:if test="${login ne null }">
				<div class="comment_nicname">
					<span> ${login.member_name } </span>
				</div>
				<input type="text" class="comment_content"  id="comment_content">

				<div class="comment_btn">
					<span class="comment_input">
						<button type="button" class="btn btn-primary" onclick="commentinsert(${login.member_no})">등록</button>
					</span>
				</div>
			</c:if>
		</div>
		<hr>
		<div class="comment_watch">
			<div class="replyListParent"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>