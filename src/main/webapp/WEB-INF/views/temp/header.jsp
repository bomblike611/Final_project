<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<link href="/busk/resources/css/header.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</head>
	<header>
		<section class="dropdown dropbtn" id="main_nav">
			<ul>
				<li class="sub_nav"><a href="#">Community</a></li>
				<li class="sub_nav"><a href="#">Busker</a></li>
				<li class="sub_nav"><a href="#">Busking</a></li>
				<li class="sub_nav"><a href="#">Calendar</a></li>
				<li class="sub_nav"><a href="#">Event</a></li>
			</ul>
			<div class="dropdown-content">
						
			</div>
		</section>
		<div id="main_session">
			<select>
				<c:if test="${empty member}">
					<option>LOG IN</option>
					<option>JOIN</option>
				</c:if>
				<c:if test="${not empty member}">
					<option>MY PAGE</option>
					<option>LOG OUT</option>
				</c:if>
			</select>
		</div>
	</header>
