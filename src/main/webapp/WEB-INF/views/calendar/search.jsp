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
		<div id="sec">
					<form id="frm" action="" method="">
				<div class="row">
						<span> 
							<input class="balloon" id="sing" type="text" name="sing" placeholder="메리플레인, 하진우, 현이..." /><label for="sing">Singer</label>
						</span>
						<span>
							<input class="balloon" id="fromDate" type="date" /><label for="Fromdate">From date</label>
						</span>
						~
						<span>
							<input class="balloon" id="toDate" type="date" value="2018-02-28"/><label for="toDate">To date</label>
						</span>
						<span> 
							<input class="balloon" id="place" type="text" name="place" placeholder="Seoul, Hongdae, CGV..." /><label for="place">Place</label>
						</span>
				
							<input type="submit" id="btn" value="Search" style="cursor: pointer;">
						
				</div>
				<div id="singer">ACOUSTIC</div>
				<div id="singerle">17 OCT</div>
				<div id="singerri1">Serious Frog</div>
				<div id="singerri2">
					<div id="singerri3">
						<div id="singerri4">
						<div id="pic">
						<p>사진</p>
						</div>
						<p>SOMEWHERE IN NY</p>
						<p>from 27/02/18 to 27/02/18</p>
						<p>19:00 to 21:00</p>
						<p>Somewhere 128, New York</p>
						<input id="do" type="submit" value="후원하기">
						</div>
						<div id="singerri5">
						지도
						</div>
					</div>
				</div>
					</form>

		</div>
			<!--================================ 일정조회 끝 ================================-->




	
	</section>
</body>
</html>