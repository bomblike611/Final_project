<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Happy New Year</title>
    
    
    
<link rel='stylesheet prefetch' href='../resources/css/calendar/style.css'>
<link rel='stylesheet prefetch' href='../resources/css/calendar/flipclock.css'>
<link rel='stylesheet prefetch' href='../resources/css/calendar/animate.css'>
<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Great+Vibes'>
</head>

<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
			

	    <div class="wrapper">
			  <div class="clock animated flipInX"></div>
		</div>
		<canvas id="confetti"></canvas>
		<div class="message">Happy New Year !!!</div>
		<div class="stars"></div>
		<div class="twinkling"></div>
		<div class="clouds"></div>
		
		<script src='http://code.jquery.com/jquery-1.11.2.min.js'></script>
		<script src='../resources/js/flipclock.js'></script>
		<script src='../resources/js/newyear.js'></script>

    
    	</section>
</body>
</html>
