<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(search)입니다</title>
<link href="../resources/css/calendar/search.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44dc488bb7ee1b14cd2765f0530ea05b&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		$('#fromDate').on('change', function() {
			$('#toDate').prop('min', $(this).val());
		});
		$('#toDate').on('change', function() {
			$('#fromDate').prop('max', $(this).val());
		});
		$("#btn").click(function(){
			if($("#fromDate").val() && !$("#toDate").val()){
				alert("종료 날짜를 선택해 주세요.");
				return false;
			}
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
		 	var busktime = $(this).attr("title");	 	
		 	$(this).html(busktime.substr(11,5)); 		 	
		 });
	  	/* 장소검색 대소문자 변경 */
	  	$("#place").on('keyup', function(){
	  		$(this).val($(this).val().toUpperCase());
	  	});	  	
	  	/* 가수검색 대소문자 변경 */
	  	$("#sing").on('keyup', function(){
	  		$(this).val($(this).val().toUpperCase());
	  	});
	  
	});
	  	/* 날짜검색 */
 		/* $("#btn").click(function(){ */
 			/* if(!$("#fromDate").val()){
				alert("시작선택"); return false;
			}
			if(!$("#toDate").val()){
				alert("끝선택"); return false;
			}
			var date1 = new Date($("#fromDate").val());
			var date2 = new Date($("#toDate").val());
			if(date2 - date1 <0){
				alert("다시확인"); return false;
			}
			
		  	/* 날짜 선택한날 이후로 안보이기 */	
			/* var startDate = $("#fromDate").val().split('-');
			var endDate = $("#toDate").val().split('-');
			alert(startDate);
			alert(endDate);
			var startDateCompare = new Date(startDate[0], startDate[1]-1, startDate[2]);
			alert(startDateCompare);
			var endDateCompare = new Date(endDate[0], endDate[1]-1, endDate[2]);
			alert(endDateCompare);
			 if(startDateCompare.getTime() > endDateCompare.getTime()){
				alert("시작날짜와 종료날짜를 확인해 주세요.");
				return;}			
			var result = Math.ceil(endDateCompare - startDateCompare);
			var oneDay = result/(1000*60*60*24);
			alert(result);
			alert(oneDay);
			 $("").submit();
		});  */
/* 		$(".page").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.search.value = '${page.search}';
			document.frm.kind.value = '${page.kind}';
			document.frm.fromDate.value = '${page.fromDate}';
			document.frm.toDate.value = '${page.toDate}';
			documnet.frm.submit();
		}); */

	
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
					<span><input name="search" class="balloon" id="sing" type="text"
						placeholder="메리플레인, 하진우, 현이..." /><label for="sing">Singer</label></span>
						
					<span><input name="fromDate" class="balloon" id="fromDate"
						type="date" /><label for="Fromdate">From date</label></span>
					<span> ~ </span> 
					<span><input name="toDate" class="balloon" id="toDate" type="date"
						 /><label for="toDate">To date</label></span>
						
					<span><input name="kind" class="balloon" id="place" type="text"
						placeholder="Seoul, Hongdae, CGV..."/><label for="place">Place</label></span>

					<input type="submit" id="btn" value="Search" style="cursor: pointer;">
				</div>
			</div>
			<!--================================ 보여지는 폼 ================================-->
			<c:forEach items="${list}" var="dto" begin="0" end="5">
			<input type="hidden" name="num" value="${dto.num}">
						<div id="bigbox">
							<div id="singer">${dto.writer}</div>
							<div id="singerle">
							<p class="nalja" title="${dto.busk_date}"></p><!-- 요 -->
							<p class="nalil" title="${dto.busk_date}"></p><!-- 일 -->
							</div>
							<div id="singerri1">${dto.teamname}</div>
							<div id="singerri2">
								<div id="singerri3">
									<div id="singerri4">
										<div id="pic">
											<img src="../resources/upload/${dto.fname}" style="width: 100%; height: 200px;"><!-- 사진 -->
										</div>
										<div id="info">
										<p>${dto.location}</p>
										<p>${dto.busk_date}</p>
										</div>
										<div id="spon"><a href="./upcoming">후원하기</a></div>
										</div>
									<div id="map" style="width: 70%; height: 390px;"></div>
								</div>
							</div>
						</div>						
	<script>
		$(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56573, 126.97879), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
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
/* ======================================================================= */
		// 지도에 마커를 생성하고 표시한다
		  var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.56573, 126.97879), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="width:150px;padding:5px;text-align:center;">${dto.location}</div>' // 인포윈도우에 표시할 내용
		});
		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker); 
		
/* ======================================================================= */
		// 주소-좌표 변환 객체를 생성합니다
		/*  var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${loca.area}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="padding:5px;">${dto.location}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		});	 */	
/* ======================================================================= */
		});
	</script>	
				
				</c:forEach>
		</form>

		<!--================================ 페이징처리 ================================-->
<%-- 		<div id="page">
			<c:if test="${page.curBlock > 1}">
				<span class="page" title="${page.startNum-1}">《</span>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<span class="page" title="${i}">${i}</span>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock }">
				<span class="page" title="${page.lastNum+1}">》</span>
			</c:if>
		</div> --%>
	</section>
	
</body>
</html>