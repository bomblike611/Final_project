<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link href="/busk/resources/css/header.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("select").click(function() {
				  var open = $(this).data("isopen");
				  if(open) {
				    window.location.href = $(this).val()
				  }
				  //set isopen to opposite so next time when use clicked select box
				  //it wont trigger this event
				  $(this).data("isopen", !open);
				});
		});
	</script>
</head>
	<header>
		<section class="dropdown dropbtn" id="main_nav">
			<ul>
				<li class="sub_nav"><a href="#">Community</a></li>
				<li class="sub_nav"><a href="#">Busker</a></li>
				<li class="sub_nav"><a href="#">Busking</a></li>
				<li class="sub_nav"><a href="/busk/calender/upcoming">Calendar</a></li>
				<li class="sub_nav"><a href="#">Event</a></li>
			</ul>
			<div class="dropdown-content" id="sub_nav">
				<a href="#">Link 1</a>
  	  			<a href="#">Link 2</a>
    			<a href="#">Link 3</a>
			</div>
		</section>
		<div id="main_session">
			<select>
				<c:if test="${empty member}">
					<option value="/busk/member/memberAgree">LOG IN</option>
					<option value="/busk/member/memberJoin">JOIN</option>
				</c:if>
				<c:if test="${not empty member}">
					<option>MY PAGE</option>
					<option>LOG OUT</option>
				</c:if>
			</select>
		</div>
	</header>
