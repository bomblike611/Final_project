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
		<table id="notice">
		<thead>
			<tr>
				<th id="sortation">번호</th>
				<th id="sortation1">구분</th>
				<th id="sortation2">제목</th>
				<th id="sortation3">등록일</th>
				<th id="sortation4">조회수</th>
			</tr>
		</thead>
			
			
			
			
		</table>
	
	</div>
	
	<div class="L_pager">
		<ul class="paging">
<li><img src="/paging_first.gif"> &nbsp;&nbsp; </li> 
<li><img src="/paging_prev.gif"> &nbsp;&nbsp; </li> 
<li>&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=2';">&nbsp;&nbsp;2&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=3';">&nbsp;&nbsp;3&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=4';">&nbsp;&nbsp;4&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=5';">&nbsp;&nbsp;5&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=6';">&nbsp;&nbsp;6&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=7';">&nbsp;&nbsp;7&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=8';">&nbsp;&nbsp;8&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=9';">&nbsp;&nbsp;9&nbsp;&nbsp;</li>
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=2';"> &nbsp;&nbsp; <img src="/kr/img/common/paging_next.gif"> </li> 
<li onclick="location.href='counsel.asp?sPageType=r&amp;m=&amp;txtPageR=94';"> &nbsp;&nbsp; <img src="/kr/img/common/paging_last.gif"> </li> 
</ul>
	</div>

</div>
	<!--//CONTAINER -->
</section>

</body>
</html>