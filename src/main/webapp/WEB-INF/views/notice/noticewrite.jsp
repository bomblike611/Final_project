<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="../resources/css/notice/write.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
	<h1>${board}</h1>
	<form action="./noticewrite" method="post">
		<p>Title : <input type="text" name="title"></p>
		<p>Writer : <input type="text" name="writer"></p>
		<p>contents : <textarea rows="" cols="" name="contents"></textarea></p>
		<p><input type="button" value="FileAdd" id="btn"></p>
		<div id="result">
		</div>	
		
		<button>Write</button>
	</form>
			<div id="ex">
				<input type="file" name="file"><span class="remove">X</span><br>
			</div>
			</section>
</body>
</html>