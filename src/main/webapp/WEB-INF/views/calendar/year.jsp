<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(year)입니다</title>
<link href="../resources/css/calendar/year.css" rel="stylesheet">
<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
<script type='text/javascript' src='fullcalendar/gcal.js'></script>
<script type='text/javascript'>

$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'AIzaSyCSuGXIqEufRYzmOoNhRvk56Rr8Z-5IpQ0',
        events: {
            googleCalendarId: 'abcd1234@group.calendar.google.com'
        }
    });
});

</script>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
		<section id="main">
	<%@ include file="./calHeader.jsp" %>
	
	
	
</section>
</body>
</html>