<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>

</head>
<body>
    <select id="select-lang">
        <option value="ko-KR">한국어</option>
        <option value="ja-JP">日本語 (일본어)</option>
        <option value="en-US">english (영어)</option>
        <option value="zh-CN">汉语 (중국어-간체)</option>
	    <option value="zh-TW">漢語 (중국어-번체)</option> 
    </select>
    
    <textarea id="text" rows="5" cols="20"></textarea>
    <button id="btn-read">읽기</button>

	<script>
    function speak(text, opt_prop) {
        if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
            alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
            return
        }
        
        window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

        const prop = opt_prop || {}

        const speechMsg = new SpeechSynthesisUtterance()
        speechMsg.rate = prop.rate // 속도: 0.1 ~ 10      
        speechMsg.pitch = prop.pitch // 음높이: 0 ~ 2
        speechMsg.lang = prop.lang	//읽어줄 언어
        speechMsg.text = text
        
        // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
        window.speechSynthesis.speak(speechMsg)
    }


    // 이벤트 영역
    const selectLang = document.getElementById("select-lang")
    const text = document.getElementById("text")
    const btnRead = document.getElementById("btn-read")

    btnRead.addEventListener("click", e => {
        speak(text.value, {
            rate: 1.0,	//읽는 속도 설정
            pitch: 1.2,	//앍는 음높이 설정
            lang: selectLang.options[selectLang.selectedIndex].value	//옵션값을 받아와 언어에 입력된 음성 출력
        })
    })
    
</script>

</body>
</html>