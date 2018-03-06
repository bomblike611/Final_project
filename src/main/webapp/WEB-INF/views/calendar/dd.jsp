<%@page import="com.kh.cal.CalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>## 노래왕 버스킹 -(Month)입니다</title>
<link href="../resources/css/calendar/dd.css" rel="stylesheet">
<link href='../resources/css/calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='../resources/css/calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='../resources/js/moment.min.js'></script>
<script src='../resources/js/jquery.min.js'></script>
<script src='../resources/js/fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: new Date, //$('#calendar').fullCalendar('today'),
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events

      events: 	  
    	  ${obj}
    });
  });

</script>

</head>
<body>
<section id="main">
<div id="space"></div>
		<%@ include file="./calHeader.jsp"%>
  <div id='calendar'></div>
</section>
</body>
</html>