<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/calendar/upcoming.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
				<!--================================ 일정리스트 시작 ================================-->
				<div class="imgbox">
					<img alt="" src="../resources/calendar_img/4.jpg" style="width: 100%" height="100%">
					
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
					<div class="si">
						<ul>
							<li>
							<img alt="" src="../resources/calendar_img/clock.png">
							<span>시간: ${month.busk_date}</span>
							</li>
							<li>
							<img alt="" src="../resources/calendar_img/location.png">
							<span>위치: ${month.busk_date}</span>
							</li>
						</ul>				
					</div>
				</div>
				
				<div class="imgbox"  id="yoilbox">
					<div class="yo" id="feb">
						<p>25 FEB
						${month.busk_date}
						</p>
					</div>
					<div class="si" id="yobup">
						<ul>
							<li>
							심각한 개구리 ${month.busk_date}
							</li>
						</ul>
					</div>
					<div class="si" id="si1">
						<ul>
							<li>
							<img alt="" src="../resources/calendar_img/clock.png">
							<span>시간: ${month.busk_date}</span>
							</li>
							<li>
							<img alt="" src="../resources/calendar_img/location.png">
							<span>위치: ${month.busk_date}</span>
							</li>
						</ul>				
					</div>
				</div>

				<!-- 일정리스트 끝 -->

			<!-- ================================ 연습장 ================================ -->

	</section>
</body>
</html>