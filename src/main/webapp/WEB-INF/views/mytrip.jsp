<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.js'></script>
<script type='text/javascript'>

<form action="./mytrip.do" method="post" >
<!--  목록 -->
<div>
<ul>
	<li ><a href= mypage.do>내정보 확인</a></li>
	<li ><a href= mypageupdate.do>내정보 수정</a></li>
	<li ><a href= mypost.do>내게시글 확인</a></li>
	<li ><a href= mypayment.do>내결제내역 확인</a></li>
	<li ><a href= mytrip.do>내 여행계획 확인</a></li>
</ul>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyAKi01-W2hJIuWBvxz2Fx7CZ8W_9dkQeM4',
    eventSources: [
    {
          googleCalendarId: 'https://calendar.google.com/calendar/u/0?cid=d25hanJ0a3NpZDk1QGdtYWlsLmNvbQ',
          className: '웹디자인기능사',
          color: '#be5683',  
        },
      {
          googleCalendarId: 'https://calendar.google.com/calendar/u/0?cid=d25hanJ0a3NpZDk1QGdtYWlsLmNvbQ',
          className: '정보처리기능사',
            color: '#204051',4
        },
      {
          googleCalendarId: 'https://calendar.google.com/calendar/u/0?cid=d25hanJ0a3NpZDk1QGdtYWlsLmNvbQ',
          className: '정보처리기사',
            color: '#3b6978',
        }
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>