<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(year)입니다</title>
<!-- <link href="../resources/css/calendar/year.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="../resources/css/calendar/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="../resources/css/calendar/fullcalendar.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/calendar/fullcalendar.print.min.css">
<script src="../resources/js/jquery.min.js" type="text/javascript"></script>
<script src='../resources/js/moment.min.js' type="text/javascript"></script>
<script src='../resources/js/fullcalendar.min.js' type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	 calendarEvent();
	});

	function calendarEvent(eventData){
	 $("#calender").html("");
	 var date = new Date();
	 var d = date.getDate();
	 var m = date.getMonth();
	 var y = date.getFullYear();
	 var calendar = $('#calender').fullCalendar({
	  header: {
	   left: "",
	   center: "title",
//	    right: "month,basicWeek,basicDay"
	   right: "today prev,next"
	   },
	   editable: true,
	   titleFormat: {
	   month: "yyyy년 MMMM",
	   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
	   day: "yyyy년 MMM d일 dddd"
	   },
	   allDayDefault: false,
	   defaultView: "month",
	   editable: false,
	   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	   dayNamesShort: ["일","월","화","수","목","금","토"],
	   buttonText: {
	   today : "오늘",
	   month : "월별",
	   week : "주별",
	   day : "일별",
	   },
	   events : eventData,
	   timeFormat : "HH:mm",
	 });
	};
/* 	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		defaultDate: new Date(),
		navLinks: true, // can click day/week names to navigate views
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'All Day Event',
				start: '2017-04-01'
			},
			{
				title: 'Long Event',
				start: '2017-04-07',
				end: '2017-04-10'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2017-04-09T16:00:00'
			}
		]
	}); */

</script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin-top: 500px;
    z-index: 999;
  }

</style>
</head>
<body>
<div id="calendar"></div>	
	<%-- <%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
		
  			
  				
    	</section> --%>
</body>
</html>

