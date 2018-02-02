<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/calendar/search.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fromDate').on('change', function() {
			$('#toDate').prop('min', $(this).val());
		});
		$('#toDate').on('change', function() {
			$('#fromDate').prop('max', $(this).val());
		});
	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>

	<!--================================ 일정조회 시작 ================================-->

			<div id="sc">
					<div id="scin">
					
						<select name="kind" class="area">
							<option value="seoul">Seoul</option>
							<option value="gg">Gyeonggi</option>
							<option value="incheon">Incheon</option>
						</select>	
						<input type="date" id="fromDate" class="area"> ~ <input type="date" id="toDate" class="area">
						<input  class="area" type="text" name="search" placeholder="busking place">
						<input  class="area" type="submit" id="btn" value="Search">
						
					</div>
			</div>
		<!--================================ 일정조회 끝 ================================-->
	</section>
</body>
</html>