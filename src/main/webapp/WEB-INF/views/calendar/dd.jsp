<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
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
      defaultDate: '2018-02-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      
      
      
      events: [
        {
          title: 'All Day Event',
          start: '2018-02-01'
        },
        {
          title: 'Long Event',
          start: '2018-02-07',
          end: '2018-02-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-02-09T16:00:00'
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
    margin: 0 auto;
  }

</style>
</head>
<body>
<section id="main">
		<%@ include file="./calHeader.jsp"%>
  <div id='calendar'></div>
  <div>
  <c:forEach items="${list}" var="v">
  <h3>DD:${v.teamname }</h3>
  </c:forEach>
</div>
</section>
</body>
</html>