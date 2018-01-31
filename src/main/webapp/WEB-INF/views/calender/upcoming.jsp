<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/calender/upcoming.css" rel="stylesheet">
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
				<!--================================ 일정리스트 시작 ================================-->
				<div id="imgbox">
					<div id="hh">
					</div>
						<h1>Upcoming Busk</h1><span><a href="./calender/memo">memo</a></span>
						
					<div class="yo">
					<p>25 FEB
					${month.busk_date}
					</p>
					</div>
					
					<div id="ga">
					<p>심각한 개구리
					${month.busk_date}
					</p>
					</div>
				
				</div>
				
				<div id="graybox">
					<div id="si">
					<img alt="" src="../resources/calender_img/clock.png">
					<span>시간:
					${month.busk_date}</span>
					<img alt="" src="../resources/calender_img/location.png">
					<span>위치:
					${month.busk_date}</span>
					</div>
				</div>
				
				<div id="yob">
					<div class="yo" id="feb">
						<p>25 FEB
						${month.busk_date}
						</p>
					</div>
					<div id="yobup">
						<img alt="" src="../resources/calender_img/clock.png">
						<span>시간:
						${month.busk_date}</span>
					</div>
				</div>
				
				
				<div id="yobdown">
					<div id="si2">
					<img alt="" src="../resources/calender_img/location.png">
					<span>위치:
					${month.busk_date}</span>
					</div>
				</div>
				<!-- 일정리스트 끝 -->

			<!-- ================================ 연습장 ================================ -->

	</section>
</body>
</html>