<%@page import="com.lan.tour.model.dto.CalendarDto"%>
<%@page import="com.lan.tour.model.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script type="text/javascript" src="resources/fullcalendar/main.js" ></script>
<script type="text/javascript" src="resources/fullcalendar/locale.js" ></script>

<style type="text/css">

  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
  }

  #calendar {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 10px;
  }

</style>

<script type="text/javascript">
<% List<ReservationDto> listLan = (List<ReservationDto>)request.getAttribute("listLan"); %>
<% List<ReservationDto> listRoom = (List<ReservationDto>)request.getAttribute("listRoom"); %>
<% List<CalendarDto> listCal = (List<CalendarDto>)request.getAttribute("listCal"); %>

document.addEventListener('DOMContentLoaded', function() {
	var initialLocaleCode = 'ko';
	var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },   
      locale: initialLocaleCode,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      dayMaxEvents: true,
      eventClick: function(arg) {
    	  if (arg.event.url) {
    		  var url = arg.event.url;
    		  var name = 'popup';
    		  var option = 'width= 600, height=600, left=500, top=100';
    		  var pop = window.open(url, name, option);
    		  return false;
    	  }
      },
      eventSources : [
    	  {	  // 랜선투어
    		  events : [

<% for (int i = 0; i < listLan.size(); i++) {%>	

    			  {
    				  
    			  title: "랜선투어",
    			  start: "2021-07-20",
    			  constraint: 'lantour',
    			  url: "lantourdetail.do?lantour_no=2"
    			  },
<%} %>						
    			  {
    			  groupId: 'lantour',
    			  display: 'background'
    			  }
    		  ],
    	  	  color: "#2F7AFC",
    	  	  textColor: "#FFFFFF"
    	  },
		  {	  // 숙소예약
    		  events : [

<% for (int i = 0; i < listLan.size(); i++) {%>	

    			  {
    			  title: "숙소예약",
    			  start: "2021-07-07",
    			  end: "2021-07-09",
    			  constraint: 'roomReservation',
    			  url: "hoteldetail.do?hotel_no=3"
    			  },

<%} %>	

    			  {
        	      groupId: 'roomReservation',
        		  display: 'background'
        		  }
        	  ],
	  	  	  color: "#22C07E",
	  	 	  textColor: "#FFFFFF"
		  },
		  {	  // 개인일정
    		  events : [

<% for (int i = 0; i < listCal.size(); i++) {
CalendarDto dto = listCal.get(i);
%>	

    			  {
    			  title: "<%= dto.getCal_title()  %>",
    			  start: "<%= dto.getCal_startdate()  %>",
    			  end: "<%= dto.getCal_enddate()  %>",
    			  url: "popupDetail.do?cal_no=" + "<%= dto.getCal_no()  %>"
    			  },

<%} %>	

        	  ],
	  	      color: "#DB473E",
	  	      textColor: "#FFFFFF"
		  }
      ]
    });

    calendar.render();
    
    // build the locale selector's options
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
      var optionEl = document.createElement('option');
      optionEl.value = localeCode;
      optionEl.selected = localeCode == initialLocaleCode;
      optionEl.innerText = localeCode;
      localeSelectorEl.appendChild(optionEl);
    });

    // when the selected option changes, dynamically change the calendar option
    localeSelectorEl.addEventListener('change', function() {
      if (this.value) {
        calendar.setOption('locale', this.value);
      }
    });

  });
  
  function calInsert() {
	  var url = 'popupInsert.do';
	  var name = 'popup';
	  var option = 'width= 600, height=600, left=500, top=100';
	  var pop = window.open(url, name, option);
  }
</script>
</head>
<body>

  <div id='top'>

    언어 :
    <select id='locale-selector'></select>
	<button type = "button" onclick="calInsert();">일정 등록</button>
  </div>

  <div id='calendar'></div>
	
</body>
</html>