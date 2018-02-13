<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(upcoming)입니다</title>
<link href="../resources/css/calendar/upcoming.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	$("#show").click(function(){
		$("#yoilbox2").slideDown("slow");
	});
});

</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
<!--================================ 사진 부분 ================================-->
				<form id="frm" name="frm" action="upcoming">
				<c:forEach items="${list}" var="dto">	
				<div class="imgbox">
					<img alt="" src="../resources/images/calendar_img/4.jpg" style="width: 100%" height="100%">
					<div id="hh"></div>
						<div id="hd">Upcoming Busk</div>
						
		 			<div class="yo">
						<p>${dto.busk_date}</p>
					</div>
					
					<div id="ga">
						<p>
						${dto.teamname}
						</p>
					</div>	
				</div>
<!-- ================================ 그레이박스 부분 ================================ -->				
				<div class="imgbox" id="graybox">
					<div class="si">
						<ul>
							<li>
							<img src="../resources/images/calendar_img/clock.png">
							시간: ${dto.busk_date}
							</li>
							<li>
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
				</div>
<!-- ================================ 보이는 부분 ================================ -->			
				<div class="imgbox"  id="yoilbox">
					<div class="yo" id="feb">
						<p>26 FEB
						${dto.busk_date}
						</p>
					</div>
					<div class="yobup">
						<ul>
							<li>
							${dto.teamname}
							</li>
						</ul>
					</div>
					<div class="si" id="si1">
						<ul>
							<li>
							<img src="../resources/images/calendar_img/clock.png">
							<span>시간: ${dto.busk_date}</span>
							</li>
							<li>
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
				</div>
<!-- ================================ 가려지는 부분 ================================ -->
				<div class="imgbox"  id="yoilbox2">
					<div class="yo" id="feb2">
						<p>03 MAR
						${dto.busk_date}
						</p>
					</div>
					<div class="yobup">
						<ul>
							<li>
							심각한 개구리 ${dto.teamname}
							</li>
						</ul>
					</div>
					<div class="si" id="si2">
						<ul>
							<li>
							<img src="../resources/images/calendar_img/clock.png">
							<span>시간: ${dto.busk_date}</span>
							</li>
							<li>
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
				</div>
				</c:forEach>
				</form>
<!-- ================================ 더보기 ================================ -->
					<button id="show">더보기</button>

	</section>
</body>
</html>