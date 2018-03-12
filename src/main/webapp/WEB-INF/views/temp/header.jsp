<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/busk/resources/css/common/header.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
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
	</script>
</head>
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
		<section class="dropdown dropbtn" id="main_nav">
			
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
		</section>
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
