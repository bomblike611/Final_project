<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(에러404페이지)입니다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/error.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#homeBtn").click(function() {
			window.location = '/busk/';
		});
	});

</script>
</head>
<body>
	<div id="error">
		<p id="error404">500</p>
		<p id="oops">OOPS, SORRY WE CAN'T FIND THAT PAGE!</p>
		<p id="enter">Enter something went wrong or the page exist anymore.</p>
	
		<input type="button" value="GO HOME" id="homeBtn">	
	</div>
</body>
</html>