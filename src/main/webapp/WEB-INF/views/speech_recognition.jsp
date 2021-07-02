<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	/*
	 * 
	 recognition.interimResults : 중간결과값 리턴 여부
	 recognition.continuous : 중간중간 결과값 리턴 / 내부 필드
	 recognition.start() : 음성 인식 시작
	 recognition.stop() : 음성 인식 끝, continuous가 false이면 recognition.onresult 마지막에 실행 아니면 중간중간 실행
	 recognition.onresult 의 내부에는 SpeechRecognitionResultList객체가 있음 [i][j]배열이며 음성이 인식 될 때마다 첫번째칸이 추가, 두번째칸은 정확도 구분
	
	 */
	var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition
	var SpeechRecognitionEvent = SpeechRecognitionEvent
			|| webkitSpeechRecognitionEvent
	var string = "" // 음성인식 결과 뭉치

	var recognition = new SpeechRecognition();
	var recognition2 = new SpeechRecognition();

	recognition.continuous = true; // 인식 중간중간 결과 값 리턴 
	recognition.interimResults = false; //중간 결과값도 리턴

	recognition2.continuous = true; // 인식 중간중간 결과 값 리턴 
	recognition2.interimResults = false; //중간 결과값도 리턴

	var diagnostic = document.querySelector('.output');

	function start() {
		alert("녹음 시작")
		var lang = document.getElementById("lang")
		recognition.lang = lang.options[lang.selectedIndex].value
		recognition.lang2 = lang.options[lang.selectedIndex].value
		recognition.start()
		console.log('Ready to receive a color command.')
	}

	var i = 0;
	recognition.onspeechstart = function() {
		i = 0
	}

	recognition2.onspeechstart = function() {
			i = 0
	}
	recognition.onresult = function(event) {
		//
		// The SpeechRecognitionEvent results property returns a SpeechRecognitionResultList object
		// The SpeechRecognitionResultList object contains SpeechRecognitionResult objects.
		// It has a getter so it can be accessed like an array
		// The first [0] returns the SpeechRecognitionResult at the last position.
		// Each SpeechRecognitionResult object contains SpeechRecognitionAlternative objects that contain individual results.
		// These also have getters so they can be accessed like arrays.
		// The second [0] returns the SpeechRecognitionAlternative at position 0.
		// We then return the transcript property of the SpeechRecognitionAlternative object
		var lang = document.getElementById("lang")
		recognition.lang = lang.options[lang.selectedIndex].value
		var res = event.results[i][0].transcript; // 음성인식 결과값
		string = string + " " + res
		console.log('Confidence: ' + event.results[i][0].confidence);
		document.getElementById("result").innerHTML = string
		trans(res) 
		i = i + 1
	}
	recognition2.onresult = function(event) {
		var lang = document.getElementById("lang")
		recognition2.lang = lang.options[lang.selectedIndex].value
		var res = event.results[i][0].transcript;
		console.log('Confidence: ' + event.results[i][0].confidence);
		string = string + " " + res
		document.getElementById("result").innerHTML = string
		trans(res) 
		i = i + 1
	}

	recognition.onspeechend = function() {
		recognition2.start()
	}

	recognition.onnomatch = function(event) {
		recognition2.start()
	}

	recognition.onerror = function(event) {
		recognition2.start()

	}

	recognition2.onspeechend = function() {
		recognition.start()
	}

	recognition2.onnomatch = function(event) {
		recognition.start()
	}

	recognition2.onerror = function(event) {
		recognition.start()
	}

	function reAbort() {
		recognition.abort()
		recognition2.abort()
	}

	function reStop() {
		i = 0
		recognition.stop()
		recognition2.stop()
	}

	$(function() {
		playpapago = setInterval(function() {
			$("#translate").trigger("click");
		}, 600000)
	});
	function trans(text) {
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
					
						$("#langtext").text($("#langtext").text()+" "+msg.lang)
				    	const selectLang = document.getElementById("target");	//어느나라말로 말할지
						speak(msg.lang, {
			                 rate: 0.9,	//속도 설정 0.1 ~ 10
			              	 pitch: 1,	//음높이 설정 0 ~ 2
			             	 volume: 1.0,	//목소리 크기 0 ~ 1
			              	 lang: selectLang.options[selectLang.selectedIndex].value	//선택한 언어의 옵션값을 받아와 해당 음성 출력
			     	   })
					
				},
				error : function() {
					alert("통신 실패");
				}
			});
		}
	}
	
	
	function speak(text, opt_prop) {
        if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
            alert("이 브라우저는 음성 합성을 지원하지 않습니다.");
            return;
        }
        
        window.speechSynthesis.cancel();// 현재 읽고있다면 초기화

        const prop = opt_prop;

        //speechmsg에있는 값을 저장
        const speechMsg = new SpeechSynthesisUtterance();
        speechMsg.rate = prop.rate;
        speechMsg.pitch = prop.pitch;
        speechMsg.lang = prop.lang;
        speechMsg.text = text;
        speechMsg.volume = prop.volume;
        
        // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
        window.speechSynthesis.speak(speechMsg);
    }


    // 이벤트 영역


</script>



<body>
	<h1>SPEECH API 분석</h1>
	<h1>
		링크
		<a href="https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition">바로기가</a>
	</h1>

	<!-- BCP 47 언어 구분을 따른다. -->
	<span>인식 언어</span>
	<select id="lang">
		<option value="ko-KR">한국어</option>
		<option value="en">영어</option>
		<option value="ja">일본어</option>
		<option value="zh-CN">중국어 간체</option>
		<option value="zh-TW">중국어 번체</option>

	</select>
	<br>
	<span>번역 언어</span>
	<select id = "target" name="target">
		<option value="ko">한국어</option>
		<option value="en">영어</option>
		<option value="ja">일본어</option>
		<option value="zh-CN">중국어 간체</option>
		<option value="zh-TW">중국어 번체</option>
	</select>
	<p class="output">
		<button onclick="start()">누르고 말해주세요</button>
	</p>
	<button onclick="reAbort()">음성인식 중지(abort)</button>
	<button onclick="reStop()">음성인식 중지(stop)</button>

	

	<button type="button" id="translate" onclick="trans()">번역하기</button>
	<textarea rows="10" cols="60" id="result"></textarea>

	<div style="position: relative; height: 590; width: 1049">
		<iframe width="1049" height="590" src="https://www.youtube.com/embed/z9o5BuWzbe8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
			<div id="langtext" style="position: absolute; bottom:10px; background-color: white;" ></div>
	</div>




</body>
</html>