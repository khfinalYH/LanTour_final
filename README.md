# LanTour_final

### 개요 : 숙박 및 비대면 투어 컨텐츠 제공 사이트


### 팀장 : 이장근
### 팀원 : 양나림, 이수연, 곽채호, 최태준


### 구현기능
#### - 회원가입(Spring PasswordEncoder, SMTP 이메일인증)
#### - SNS로그인(kakao, google , naver Auth)
#### - 지도(kakao Map)
#### - 결제(import)
#### - 국내 축제, 렌트카, 항공편 정보 검색 및 위치확인(공공 API)
#### - 현재 날씨 정보 제공(공공API)
#### - RTC(nodejs 활용, express 서버 구축, socket.io활용 통신)
#### - 통역기능(음성인식, 언어번역, tts api로 RTC 기능과 연동되어 실시간 음성번역 및 자막 출력 기능)
#### - 페이지 다국어 번역 기능( google api를 통해 페이지를 원하는 언어로 번역 가능)
#### - 캘린더 기능 : 이용자가 예약한 일정 및 내용 확인
#### - 이미지 업로드
#### - summerNote 활용 게시판
#### - Spring interceptor를 활용한 보안
#### - Spring passwordEncoder를 활용한 비밀번호 암호화

### 역할

#### 이장근
#### 기능 : 공공 API (항공,렌트카), 음성인식, 채팅, 구글 Auth(SNS로그인), import 결제,SMTP 메일발송,카카오 지도
#### 게시판(항공, 렌트카, 예약, 후기)

#### 곽채호
#### 기능 : TTS , 채팅, 카카오 Auth(SNS로그인)
#### 게시판(마이페이지)

#### 양나림
#### 게시판(랜선투어, RTC 페이지,관리자 페이지) 관리자 회원가입

#### 이수연
#### 기능 : 공공 API(축제), RTC(1:N 화상송출),OpenWeatherMap API, FullCalendar API, 카카오 지도, summerNote API
#### 게시판(랜선투어, RTC페이지, 공지사항, 축제게시판)

#### 최태준
#### 기능 : papago api, google 페이지 번역 api, 카카오 지도, chart.js, summernote API, Naver Auth(SNS로그인)
#### 메인,게시판(숙박, 정보, 관리자 페이지)
