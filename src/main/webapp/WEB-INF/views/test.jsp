<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function () {
		playpapago=setInterval(function () {
			$("#but").trigger("click");
		},100000)
	});
	function papago() {
		var text = $("#testpapago").val();
		var target = $("select[name=target]").val();
		if (text != "") {
			$.ajax({
				type : "post",
				url : "papagolang.do",
				data : {
					"papagolang" : text,
					"target" : target
				},
				datatype : "json",
				success : function(msg) {
					$("#lang").val(msg.lang)
				},
				error : function() {
					alert("통신 실패");
				}
			});
		}
	}
</script>
</head>
<body>

	<h3>파파고 언어감지 및 번역</h3>
	<br>
	<span>입력</span>
	<input type="text" id="testpapago">
	<button type="button" id="but" onclick="papago()">test</button>
	<br>
	<span>번역 언어</span>
	<select name="target">
		<option value="ko">한국어</option>
		<option value="en">영어</option>
		<option value="ja">일본어</option>
		<option value="zh-CN">중국어 간체</option>
		<option value="zh-TW">중국어 번체</option>
	</select>
	<br>
	<input type="text" id="lang" value="">


</body>
</html>