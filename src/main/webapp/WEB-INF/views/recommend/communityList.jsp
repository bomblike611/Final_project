<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/recommend/commnuityList.css" rel="stylesheet"> <!-- css불러오는 주소 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시 리스트</title>

</head>

<body>
<%@include file="../temp/header.jsp" %>
<section id="main">

	<!--CONTAINER -->
	
<div id="container">
	<div class="my_wrap">
		<table id="notice" border="1">
		<thead>
			<tr>
				<th id="sortation">번호</th>
				<th id="sortation1">구분</th>
				<th id="sortation2">제목</th>
				<th id="sortation3">등록일</th>
				<th id="sortation4">조회수</th>
			</tr>
		</thead>
			
			<tr>
				<td>번호</td>
				<td>구분</td>
				<td>제목</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
			
			
		</table>
	
	</div>
	
	<div class="L_pager">
		<ul class="paging">
			<li img=""></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	
	
	</div>

</div>
	<!--//CONTAINER -->
</section>

</body>
</html>