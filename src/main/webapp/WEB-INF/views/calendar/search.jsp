<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(search)입니다</title>
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
		
 		$('.page').click(function(){
			var cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.sing.value='${page.search}';
			document.frm.place.value='${page.kind}';
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
		<div id="sec">
					<form id="frm" name="frm" action="" method="POST" enctype="multipart/form-data">
				<div class="row">
					<input type="hidden" name="curPage" value="1">
						<span><input name="search" class="balloon" id="sing" type="text" placeholder="메리플레인, 하진우, 현이..." /><label for="sing">Singer</label></span>
						<span><input name="fromDate" class="balloon" id="fromDate" type="date" /><label for="Fromdate">From date</label></span>
						~
						<span><input name="toDate" class="balloon" id="toDate" type="date" value="2018-02-28"/><label for="toDate">To date</label></span>
						<span><input name="kind" class="balloon" id="place" type="text" placeholder="Seoul, Hongdae, CGV..." /><label for="place">Place</label></span>
				
						<input type="submit" id="btn" value="Search" style="cursor: pointer;">
				</div>
				
<!--================================ 보여지는 폼 ================================-->
			<%-- 	<c:forEach items="${list}" var="dto"> --%>
					<div id="singer">ACOUSTIC ${dto.position}</div>
					<div id="singerle">17 OCT ${dto.reg_date}</div>
					<div id="singerri1">Serious Frog ${dto.teamname}</div>
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
							
								<div id="map" style="width: 70%; height: 390px;"></div>
								
						</div>
					</div>
				<%-- </c:forEach> --%>
					</form>

		</div>
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
$(function(){
	var addr="";
	var name="";
	$("#main").ready(function(){
		$("#main").click(function(){
		addr= $("#area").val();
		name= $("#area").attr("title");
		
		
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.545875, 127.107935), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	if(addr==""){
		geocoder.addressSearch("서울특별시 광진구 구천면로 20 광진구공연장", function(result, status) {

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
		            content: '<div style="width:100px;text-align:center;padding:3px 0;">yes24라이브홀</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	}else{
	geocoder.addressSearch(addr, function(result, status) {

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
	            content: '<div style="width:100px;text-align:center;padding:3px 0;">'+name+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	}
		});
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(37.545875, 127.107935), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	if(name==""){
		geocoder.addressSearch("서울특별시 광진구 구천면로 20 광진구공연장", function(result, status) {

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
		            content: '<div style="width:180px;text-align:center;padding:4px 0;">yes24라이브홀</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	}else{
	geocoder.addressSearch(addr, function(result, status) {

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
	            content: '<div style="width:180px;text-align:center;padding:4px 0;">'+name+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	}
	});


});    
</script>
</body>
</html>