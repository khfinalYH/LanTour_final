<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function () {
		$("#second").css("display","none");
		$("#third").css("display","none");
	});
	function upload() {
		var form = new FormData();
		form.append("mpfile", $("#file1")[0].files[0])
		$.ajax({
			type : "post",
			enctype : 'multipart/form-data',
			url : "hotelupload.do",
			processData : false,
			contentType : false,
			data : form,
			dataType : "json",
			success : function(msg) {
				$("#hotel_img").prop("src", msg.path);
				$("#hotel_image").val(msg.path);
			},
			error : function() {
				alert("통신 실패");
			}
		})
	}
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
            }
        }).open();
    }
	function before_first() {
		$("#first").css("display","");
		$("#second").css("display","none");
	}
	function next_second() {
		$("#first").css("display","none");
		$("#second").css("display","");
	}
	function before_second() {
		$("#third").css("display","none");
		$("#second").css("display","");
	}
	function next_third() {
		$("#third").css("display","");
		$("#second").css("display","none");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1>숙소 insert, ${login.member_id },${login.member_no }</h1>
	<form action="./hotelinsertres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" id="hotel_image" name="hotel_image" value="" />
		<div id = "first">
			<span>숙소 종류</span>
			<span><input type="text" name="hotel_type"></span>
			<br>
			<span>숙소 이름</span>
			<span><input type="text" name="hotel_title"></span>
			<br>
			<span>숙소 인원</span>
			<span><input type="text" name="hotel_maxcount"></span>
			<br>
			<span>숙소 위치</span>
			<span></span>
			<span>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="sample6_address" name="hotel_addr" placeholder="주소">
					<br>
			</span>
			<br>
			<button type="button" onclick="next_second()">계속</button>
		</div>
		<div id="second">
			<span>숙소 설명</span>
			<span><textarea rows="10" cols="60" name="hotel_content"></textarea></span>
			<br>
			<span>대여 가격</span>
			<span><input type="text" name="hotel_price"></span>
			<br>
			<span>사진 등록</span>
			<span>
					<img id="hotel_img" src="" />					
					<input type="file" id="file1" name="file1">
					<button type="button" id="img_button" onclick="upload()">사진 업로드</button>
			</span>
			<br>
			<button type="button" onclick="before_first()">이전</button>
			<button type="button" onclick="next_third()">계속</button>
		</div>
		<div id="third">
			<span>사용 가능 일정</span>
			<span><input type="text" name="hotel_date"></span>
			<br>
			<span>편의 시설</span>
			<span><input type="text" name="hotel_convinence"></span>
			<br>
			<button type="button" onclick="before_second()">이전</button>
			<button type="submit">제출</button>
		</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>