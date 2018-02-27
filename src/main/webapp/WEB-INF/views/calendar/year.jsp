<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(year)입니다</title>
<!-- <link href="../resources/css/calendar/year.css" rel="stylesheet"> -->
<script src="../resources/js/calendar/jquery.min.js" type="text/javascript"></script>
<script src='../resources/js/calendar/moment.js'></script>
<script src='../resources/js/fullcalendar.min.js'></script>
<link href='../resources/css/calendar/fullcalendar.min.css' rel='stylesheet' />
<script type="text/javascript">
$(function(){
	$('#calendar').fullCalendar({
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
	});
});
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
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
		
  			<div id='calendar'></div>	
  				
    	</section>
</body>
</html>

