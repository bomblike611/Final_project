<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(year)입니다</title>
<link href="../resources/css/calendar/year.css" rel="stylesheet">
<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#heart").click(function(){
	 $(this).toggleClass("red");

	});

});
</script>

</head>
<body>
	<%@ include file="../temp/header.jsp" %>
		<section id="main">
	<%@ include file="./calHeader.jsp" %>
	<div id="heart">
	♥<span>ADD TO WISHLIST</span>
	</div>
	
	
</section>
</body>
</html>