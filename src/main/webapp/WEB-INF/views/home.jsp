<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<title>Home</title>
	<link href="./resources/css/common/index.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btn").click(function() {
			location.href = "./busking/buskList";

		});
	});
	</script>
</head>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>

<%@include file="/WEB-INF/views/temp/header.jsp" %>
<div id="indexvideo">
	<video src="/busk/resources/upload/index.mp4" style="width: 100%; height: 100%;" autoplay="autoplay" loop="loop"></video>
</div>
<p class="hh" id="hh1">"노래왕 버스킹"</p>
<p class="hh" id="hh2">인디밴드를 위한 장소제공 홈페이지!! 노래왕 버스킹에 오신것을 환영합니다.</p>
<img id="img" alt="" src="./resources/images/down.gif" style="height: 50px; width: 50px;">
<div id="btn">Busking List</div>
</body>
</html>
