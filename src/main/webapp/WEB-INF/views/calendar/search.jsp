<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	  	/* 공연날짜(달) */
	       $(".nalja").each(function(){
	 		var nal=$(this).attr("title");
	   		var mon=nal.substr(5,2);
	  		switch(mon){
	 		case "01" : mon = "JAN"; break;
	 		case "02" : mon = "FEB"; break; 
	 		case "03" : mon = "MAR"; break; 
	 		case "04" : mon = "APR"; break; 
	 		case "05" : mon = "MAY"; break; 
	 		case "06" : mon = "JUN"; break; 
	 		case "07" : mon = "JUL"; break; 
	 		case "08" : mon = "AUG"; break; 
	 		case "09" : mon = "SEP"; break; 
	 		case "10" : mon = "OCT"; break; 
	 		case "11" : mon = "NOV"; break; 
	 		case "12" : mon = "DEC"; break; 
	 		}
	 		$(this).html(mon); 
	 	}); 
	  	
	    /* 공연날짜(일) */
	      	$(".nalil").each(function(){
	 		var nal=$(this).attr("title");
	 		$(this).html(nal.substr(8,2)); 
	 	});
	  	/* 공연시간 */
	    $(".siin").each(function(){
		 		var nal=$(this).attr("title");
		 		$(this).html(nal.substr(11,5)); 
		 });  
	  	$(".balloon").each(function(){
	  		var com = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	  	});

		$(".page").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.search.value = '${page.search}';
			document.frm.kind.value = '${page.kind}';
			documnet.frm.submit();
		});

	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>

		<!--================================ 서치부분 ================================-->
		<form id="frm" name="frm" action="search">
			<div id="sec">
				<div class="row">
					<input type="hidden" name="curPage" value="1"> 
<!-- 					<select name="kind">
					<option value="teamname">teamname</option>
					
					</select> -->
					
			<span><input name="search" class="balloon" id="sing" type="text"
						placeholder="메리플레인, 하진우, 현이..." /><label for="sing">Singer</label></span>
						
					<span><input name="fromDate" class="balloon" id="fromDate"
						type="date" /><label for="Fromdate">From date</label></span>
					<span> ~ </span> 
					<span><input name="toDate" class="balloon" id="toDate" type="date"
						 /><label for="toDate">To date</label></span>
						
<!-- 					<span><input name="search" class="balloon" id="place" type="text"
						placeholder="Seoul, Hongdae, CGV..." /><label for="place">Place</label></span>
 -->
					<input type="submit" id="btn" value="Search"
						style="cursor: pointer;">
				</div>
			</div>
			<!--================================ 보여지는 폼 ================================-->
				
					<c:if test="${listData.search eq ''}">			
						<p>조회된 정보가 없습니다.</p>
					</c:if>
			<c:forEach items="${list}" var="dto" begin="0" end="5">
					<c:if test="${listData.search ne ''}">
						<div id="bigbox">
							<div id="singer">${dto.writer}</div>
							<div id="singerle">
							<p class="nalja" title="${dto.busk_date}"></p>
							<p class="nalil" title="${dto.busk_date}"></p>
							</div>
							<div id="singerri1">${dto.teamname}</div>
							<div id="singerri2">
								<div id="singerri3">
									<div id="singerri4">
										<div id="pic">
											<p>${f.fname}</p>
										</div>
										<p>${dto.location}</p>
										<p class="siin" title="${dto.busk_date}"></p>
										<div id="spon">후원하기</div>
										</div>
									<div id="map" style="width: 70%; height: 390px;"></div>
								</div>
							</div>
						</div>
					</c:if>
			</c:forEach>
				
		</form>

		<!--================================ 페이징처리 ================================-->
		<div id="page">
			<c:if test="${page.curBlock > 1}">
				<span class="page" title="${page.startNum-1}">《</span>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<span class="page" title="${i}">${i}</span>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock }">
				<span class="page" title="${page.lastNum+1}">》</span>
			</c:if>
		</div>

	</section>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44dc488bb7ee1b14cd2765f0530ea05b&libraries=services"></script>
	<script>
		$(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.545875, 127.107935), // 지도의 중심좌표
				level : 4, // 지도의 확대 레벨
				mapTypeId : daum.maps.MapTypeId.ROADMAP
			// 지도종류
			};

			// 지도를 생성한다 
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();

			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

			// 커스텀 오버레이를 생성하고 지도에 표시한다
			var customOverlay = new daum.maps.CustomOverlay(
					{
						map : map,
						content : '<div style="padding:0 5px;background:#fff;">yes24라이브홀</div>',
						position : new daum.maps.LatLng(37.545875, 127.107935), // 커스텀 오버레이를 표시할 좌표
						xAnchor : 0.5, // 컨텐츠의 x 위치
						yAnchor : 0
					// 컨텐츠의 y 위치
					});
			// 지도에 마커를 생성하고 표시한다
			var marker = new daum.maps.Marker({
				position : new daum.maps.LatLng(37.545875, 127.107935), // 마커의 좌표
				map : map
			// 마커를 표시할 지도 객체
			});

		});
	</script>
</body>
</html>