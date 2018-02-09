<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -Location List페이지입니다 ##</title>
<link href="../resources/css/location/list.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#adminWrite").click(function(){
			location.href="./locationWrite";
		});
		
	});
	</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="listmain">
			<div id="loc">
				<img src="../resources/upload/acoustic-guitar.png"
					style="width: 80px; height: 80px;">
				<h2>Location List</h2>
				<p>대여 가능한 장소를 찾아보세요.</p>
				<form action="./locationList" method="post">
					<div id="search">
						<div id="search2">
							<select name="area">
								<option value="location">장소명</option>
								<option value="addr">주소</option>
							</select> <input type="text" name="search" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="../resources/upload/search.png"
								style="width: 20px; height: 20px;">
						</div>
						<div id="adminWrite">Write</div>
					</div>
				</form>
			</div>
			<div id="loc_list">
				<ul>
					<li class="list_item"><img
						src="../resources/upload/location/busk1.jpg">
					<h3>버스킹 장소</h3>
						<p>주소</p>
						<div class="link">Link</div></li>
					<li class="list_item"><img
						src="../resources/upload/location/busk2.jpg">
					<h3>버스킹 장소</h3>
						<p>주소</p>
						<div class="link">Link</div></li>
					<li class="list_item"><img
						src="../resources/upload/location/busk3.jpg">
					<h3>버스킹 장소</h3>
						<p>주소</p>
						<div class="link">Link</div></li>
					<li class="list_item"><img
						src="../resources/upload/location/busk4.jpg">
					<h3>버스킹 장소</h3>
						<p>주소</p>
						<div class="link">Link</div></li>
					<li class="list_item"><img
						src="../resources/upload/location/busk5.jpg">
					<h3>버스킹 장소</h3>
						<p>주소</p>
						<div class="link">Link</div></li>

				</ul>
			</div>
		</div>
	</section>
	<a href="./locationList" id="top"><img
		src="../resources/upload/acoustic-guitar.png"><br>Top</a>
</body>
</html>