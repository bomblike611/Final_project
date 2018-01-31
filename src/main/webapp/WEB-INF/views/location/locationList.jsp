<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/location/list.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="loc">
			<img src="../resources/upload/acoustic-guitar.png" style="width:80px;height: 80px;">
			<h2>Location List</h2>
			<p>대여 가능한 장소를 찾아보세요.</p>
			<form action="./locationList" method="post">
			<div id="search">
			<select>
				<option>장소명</option>
				<option>주소</option>
			</select> <input type="text" name="search">
			<button>Search</button>
			</div>
			</form>
		</div>
	</section>
</body>
</html>