<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../resources/css/recommend/commnuityList.css" rel="stylesheet"> <!-- css불러오는 주소 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시 리스트</title>

</head>

<body>
<%@include file="../temp/header.jsp" %>
<section id="main">

	<!--CONTAINER -->
	
<div id="container" >
	<h1 class="title_top">고객센터</h1>
	<div class="my_wrap">
		<table class="table_list">
			<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
		<tbody>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		
			<tr>
				<td class="title"></td>
				<td></td>
				
			</tr>
		</tbody>
		</table>
	
	</div>
	
	<div class="L_pager">
		<ul class="paging">
            <li><img src="../resources/images/hj_images/paging_first.gif"></li> 
            <li><img src="../resources/images/hj_images/paging_prev.gif"></li> 
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>

<li><img src="../resources/images/hj_images/paging_next.gif"></li> 
<li><img src="../resources/images/hj_images/paging_last.gif"></li> 
</ul>
	</div>

</div>
	<!--//CONTAINER -->
</section>

</body>
</html>