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
		$("#show").html('<span></span> 닫기');
		$("#show").click(function(){
			$("#yoilbox2").slideUp("slow");
			$("#show").html('<span></span> 열기');
		}); 
	}); 
 	

  	/* 공연날짜 */
   	$(".nalja").each(function(){
 		var nal=$(this).attr("title");
 		$(this).html(nal.substr(5,5)); 
 	});
	
	/* 공연시간 */
   	$(".siin").each(function(){
 		var busktime=$(this).attr("title");
 		$(this).html(busktime.substr(11,5));	
 	});
  
	/* 유진이코드 */
		/* $(".nalja").each(function(){
		var buskdate=$(this).attr("id");
			if($(this).attr("id")==buskdate){
			var nal=$(this).attr("title");
			$(this).html(nal.substring(8,10));			
			}
		}); */
	
});

</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
<!--================================ 사진 부분 ================================-->
			<form id="frm" action="upcoming">

				<div class="imgbox">
					<img alt="" src="../resources/images/calendar_img/4.jpg" style="width: 100%" height="100%">
					<div id="hh"></div>
						<div id="hd">Upcoming Busk</div>
						
				<c:forEach items="${list}" var="dto" varStatus="status">	
				 	<c:if test="${status.first}">
		 			<div class="yo">
						<p class="nalja" title="${dto.busk_date}"></p>
					</div>
					<div id="ga">
						<p>
						${dto.teamname}
						</p>
					</div>
							<!-- ========== 그레이박스 부분 =========== -->				
				<div class="imgbox" id="graybox">
					<div class="si">
						<ul>
							<li id="tim">
							<img src="../resources/images/calendar_img/clock.png">
							시간: <span class="siin" title="${dto.busk_date}"></span>
							</li>
							<li id="loca">
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
				</div>
				</c:if>
				</c:forEach>
				</div>
<!-- ================================ 보이는 부분 ================================ -->
	
<c:forEach items="${list}" var="dto" begin="1" end="1">
				<div class="imgbox"  id="yoilbox">
					<div class="yo" id="feb">
						<p class="nalja" title="${dto.busk_date}"></p>
					</div>
					<div class="yobup">
						<ul>
							<li>${dto.teamname}</li>
						</ul>
					</div>
					<div class="si" id="si1">
						<ul>
							<li id="tim">
							<img src="../resources/images/calendar_img/clock.png">
							시간: <span class="siin" title="${dto.busk_date}"></span>
							</li>
							<li id="loca">
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
					</div>
</c:forEach>
				
<!-- ================================ 가려지는 부분 ================================ -->
<c:forEach items="${list}" var="dto" begin="2" end="4">
 				<div class="imgbox" id="yoilbox2">
					<div class="yo" id="feb2">
						<p class="nalja" title="${dto.busk_date}"></p>
					</div>
					<div class="yobup">
						<ul>
							<li>${dto.teamname}</li>
						</ul>
					</div>
					<div class="si" id="si2">
						<ul>
							<li id="tim">
							<img src="../resources/images/calendar_img/clock.png">
							시간: <span class="siin" title="${dto.busk_date}"></span>
							</li>
							<li id="loca">
							<img src="../resources/images/calendar_img/location.png">
							<span>위치: ${dto.location}</span>
							</li>
						</ul>				
					</div>
				</div> 
</c:forEach>

				</form>
<!-- ================================ 더보기 ================================ -->
					<button id="show"><span></span> 더보기 </button>

	</section>
</body>
</html>