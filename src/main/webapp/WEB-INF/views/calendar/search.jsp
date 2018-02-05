<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(search)입니다</title>
<link href="../resources/css/calendar/search.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

					<form id="frm" action="" method="">
				<div class="row">
						<span> 
							<input class="balloon" id="place" type="text" name="place" placeholder="Seoul, Hongdae, CGV..." /><label for="place">Place</label>
						</span>
						<span>
							<input class="balloon" id="fromDate" type="date" /><label for="Fromdate">From date</label>
						</span>
						~
						<span>
							<input class="balloon" id="toDate" type="date" value="2018-02-28"/><label for="toDate">To date</label>
						</span>
				
							<input type="submit" id="btn" value="Search" style="cursor: pointer;">
						
				<div id="singer">Serious Frog</div>
				<div id="singerle">17 OCT</div>
				<div id="singerri1">Serious Frog</div>
				<div id="singerri2">
					<div id="singerri3">SOMEWHERE IN NY</div>
				</div>
				</div>
					</form>

		
			<!--================================ 일정조회 끝 ================================-->




	
	</section>
</body>
</html>