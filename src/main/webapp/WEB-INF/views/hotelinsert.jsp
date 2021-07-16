<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#second").css("display", "none");
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
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
		$("#first").css("display", "");
		$("#second").css("display", "none");
	}
	function next_second() {
		$("#first").css("display", "none");
		$("#second").css("display", "");
	}
</script>
<style type="text/css">
.hotel-type {
	float: left;
}

.hotel-type-span {
	text-align: center;
	margin-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<h1>숙소 insert, ${login.member_id },${login.member_no }</h1>
	<form action="./hotelinsertres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" id="hotel_image" name="hotel_image" value="" />
		<div id="first">
			<div style="height: 102px;">
				<div class="hotel-type hotel-type-span">
					<span>숙소 종류</span>
				</div>
				<div class="hotel-type">
					<div class="form-check">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="호텔" checked="checked"> 호텔
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="모텔">모텔
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="hotel_type" value="게스트 하우스">게스트 하우스
						</label>
					</div>
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">숙소 이름</label>
					<input type="text" name="hotel_title" style="width: 50%; color: black;" class="form-control" placeholder="숙소 이름을 입력하세요">
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">숙소 인원</label>
					<input type="text" name="hotel_maxcount" style="width: 50%; color: black;" class="form-control" placeholder="숫자를 입력하세요">
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" style="display: block;" class="form-label mt-4">숙소 위치</label>
					<input type="text" id="sample6_postcode" style="width: 30%; display: inline; color: black;" class="form-control" placeholder="우편번호">
					<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="sample6_address" style="width: 50%; color: black;" class="form-control" name="hotel_addr" placeholder="주소">
					<br>
				</div>
			</div>
			<div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="next_second()">계속</button>
				</div>
			</div>
		</div>
		<div id="second">
			<div>
				<div class="form-group">
					<label for="exampleTextarea" class="form-label mt-4">숙소 설명</label>
					<textarea class="form-control" style="color: black; width: 50%;" name="hotel_content" rows="10"></textarea>
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">대여 가격</label>
					<input type="text" name="hotel_price" style="width: 50%; color: black;" class="form-control" placeholder="숫자를 입력하세요">
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">편의 시설</label>
					<input type="text" name="hotel_convinence" style="width: 50%; color: black;" class="form-control" placeholder="숫자를 입력하세요">
				</div>
			</div>
			<div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">사진 등록</label>
					<input class="form-control" style="width: 50%; color: black;" type="file" id="file1" name="file1">
					<br>
					<button type="button" style="display: block;" class="btn btn-primary" id="img_button" onclick="upload()">사진 업로드</button>
					<img id="hotel_img" src="" />
				</div>
			</div>
			<div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="before_first()">이전</button>
					<button type="submit" class="btn btn-primary" >등록하기</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>