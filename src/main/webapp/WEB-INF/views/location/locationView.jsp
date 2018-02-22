<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/location/view.css" rel="stylesheet">
<title>## 노래왕 버스킹 -Location View페이지입니다</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae88eb2c4820eb8b91b58f0cfc8ea570&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function loc_update(num){
		location.href="locationUpdate?num="+num;
	}
	function loc_delete(num,loc_name){
		location.href="locationDelete?num="+num+"&loc_name="+loc_name;
	}
	
	$(function(){
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${view.area}', function(result, status) {

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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${view.loc_name}</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	});
	</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="viewContents">
			<div id="loc_logo">
				<img src="../resources/upload/acoustic-guitar.png"
					style="width: 100px; height: 100px;">
				<h2>${view.loc_name}</h2>
				<p>${view.area}</p>
				<%-- <c:if test="${member.id eq 'admin'}"> --%>
				<div class="adminWrite" onclick="loc_update(${view.num})">Update</div><div class="adminWrite" onclick="loc_delete(${view.num},'${view.loc_name}')">Delete</div>
				<%-- </c:if> --%>
			</div>
			<br>
			<h4>- 장소 안내</h4>
			<div id="map"></div>
			<br>
			<h4>- 장소 설명</h4>
			<p>${view.memo}</p>
			<br>
			<h4>- 장소 수용인원</h4>
			<p>${view.entry}</p>
			<h4>- 장소 사진</h4>
			<c:forEach items="${files}" var="f">
				<c:if test="${f.loc_name eq view.loc_name}">
					<img src="../resources/upload/${f.fname}">
				</c:if>
			</c:forEach>
		</div>
	</section>
</body>
</html>