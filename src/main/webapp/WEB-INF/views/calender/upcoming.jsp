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
				<div class="imgbox">
					<img alt="" src="../resources/calender_img/upcoming3.jpg" style="width: 100%" height="500px">
					
					<div id="hh"></div>
						<div id="hd">Upcoming Busk</div>
						
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
				
				<div class="imgbox" id="graybox">
					<div class="si" id="si1">
						<ul>
							<li>
							<img alt="" src="../resources/calender_img/clock.png">
							<span id="ti">시간: ${month.busk_date}</span>
							</li>
							<li>
							<img alt="" src="../resources/calender_img/location.png">
							<span>위치: ${month.busk_date}</span>
							</li>
						</ul>
						
					</div>

				</div>
				
				<div class="imgbox"  id="yob">
					<div class="yo" id="feb">
						<p>25 FEB
						${month.busk_date}
						</p>
					</div>
				
				
				<div id="yobup">
						<img alt="" src="../resources/calender_img/clock.png">
						<span> 가수명:
						${month.busk_date}</span>
				</div>
				
				<%-- <div id="yobdown">
					<div id="si1">
					<img alt="" src="../resources/calender_img/clock.png">
					<span>시간:
					${month.busk_date}</span>
					<img alt="" src="../resources/calender_img/location.png">
					<span>위치:
					${month.busk_date}</span>
					</div>
				</div>
				</div> --%>
				<!-- 일정리스트 끝 -->

			<!-- ================================ 연습장 ================================ -->

	</section>
</body>
</html>