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
<link href="../resources/css/calendar/headerhea.css" rel="stylesheet">
<script>
$(function(){
	$("#select").click(function() {
		  var open = $(this).data("isopen");
		  if(open) {
		    window.location.href = $(this).val()
		  }
		  //set isopen to opposite so next time when use clicked select box
		  //it wont trigger this event
		  $(this).data("isopen", !open);
		});
	$("#logo").click(function() {
		location.href="/busk/"
	});
	$("#action").click(function() {
		
	});
});
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
    	  ${obj},
    	  
      eventClick: function(event){
    	  if(event.url){
    		  window.open(event.url);
    		  return false;
    		}
    	}
    });
  });

</script>

</head>
<body>
<section id="main">
	<header>
		<img src="/busk/resources/images/logo.png" id="logo">
		<div id="action">
			<img src="/busk/resources/images/action.png">
			<div id="action_nav">
				<ul>
					<li><a href="/busk/notice/noticelist">Community</a></li>
					<li><a href="/busk/busker/buskerList">Busker</a></li>
					<li><a href="/busk/busking/buskList">Busking</a></li>
					<li><a href="/busk/location/locationList">Location</a></li>
					<li><a href="/busk/calendar/upcoming">Calendar</a></li>
					<li><a href="/busk/event/pointRotate">Roulette</a></li>
					<li><a href="/busk/event/pointRotate">Ranking</a></li>
				</ul>
			</div>
		</div>
		<div class="dropdown dropbtn" id="main_nav">
			
			<ul>
				<li class="sub_nav"><a href="/busk/notice/noticelist">Community</a></li>
				<li class="sub_nav"><a href="/busk/busker/buskerList">Busker</a></li>
				<li class="sub_nav"><a href="/busk/busking/buskList">Busking</a></li>
				<li class="sub_nav"><a href="/busk/calendar/upcoming">Calendar</a></li>
				<li class="sub_nav"><a href="/busk/event/pointRotate">Event</a></li>
			</ul>
			<div class="dropdown-content" id="sub_nav">
				<table id="sub_main">
					<tr>
						<td><a href="/busk/recommend/buskerRecommend">RECOMMEND</a></td>
						<td></td>
						<td><a href="/busk/location/locationList">LOCATION</a></td>
						<td><a href="/busk/calendar/upcoming">COMMING</a></td>
						<td><a href="/busk/event/pointRotate">ROULETTE</a></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><a href="/busk/busking/buskList">BUSKING INFO</a></td>
						<td><a href="/busk/calendar/dd">MONTH</a></td>
						<td><a href="/busk/ranking/rankingView">RANKING</a></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="/busk/calendar/search">SEARCH</a></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="main_session">
			<select id="select">
				<c:if test="${empty member}">
					<option value="/busk/member/memberLogin">LOG IN</option>
					<option value="/busk/member/memberAgree">JOIN</option>
				</c:if>
				<c:if test="${not empty member}">
					<option value="/busk/member/member1?id=${member.id}">MY PAGE</option>
					<option value="/busk/member/memberLogOut">LOG OUT</option>
				</c:if>
			</select>
		</div>
	</header>
<div id="space"></div>
		<%@ include file="./calHeader.jsp"%>
  <div id='calendar'></div>
 </section>
</body>
</html>