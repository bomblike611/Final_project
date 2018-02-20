<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskView.css" rel="stylesheet">
<title>## 노래왕 버스킹 -Busking View페이지입니다</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae88eb2c4820eb8b91b58f0cfc8ea570&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function donation(){
		location.href="#";
	}
	function update(){
		location.href="./buskUpdate?num=${view.num}";
	}
	function o_delete(){
		location.href="./buskDelete?num=${view.num}";
	}
	function participant(){
		location.href="./entryUpdate?num=${view.num}&writer=${view.writer}";
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
	geocoder.addressSearch('${loc.area}', function(result, status) {

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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${view.location}</div>'
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
		<div id="container">
			<div id="singerView">
				<div id="busktitle">
					<img src="../resources/upload/acoustic-guitar.png" id="guitarImg">
					<h3>
					${view.title}</h3>
					<p>${view.teamname}</p>
				</div>
				<div id="buskcontents">
					<div id="img">
						<img src="../resources/upload/${view.fname}">					
					</div>
					<div id="singerProfile">
						<table>
							<tr>
								<th><span style="color: red;">*</span> TITLE</th>
								<td>${view.title}</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> SINGER</th>
								<td>${view.teamname}</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> AREA</th>
								<td>${view.location}</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> TIME</th>
								<td>${view.busk_date}</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> GENRE</th>
								<c:catch>
								<td>${team.genre}</td>
								</c:catch>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> SNS</th>
								<td>${team.sns}</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> PARTICIPANT</th>
								<td>${view.entry_member}/${view.entry}</td>
							</tr>
						</table>
					</div>
					<div id="sulmyung">
						<div id="nayong">
							<span></span>
							<p>위의 참여자수는 가수들이 어느정도 참여자가 올 것인지 측정하기 위해</p>
							<p>쓰여진 것이므로 실제 참여자수와 다를 수 있습니다.</p>
							<p>후원을 원하시는 경우 밑의 후원버튼을 클릭시 후원창으로 연결됩니다.</p>
							<c:if test="${not empty member}">
							<span></span>
							<div onclick="donation()">후원하기</div>
							<div onclick="participant()">참가신청</div>
							<c:if test="${member.id eq view.writer}">
							<div onclick="update()">수정</div>
							<div onclick="o_delete()">삭제</div>
							</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div id="introduce">
				<p>소개</p>
				<div id="map"></div>
				<div>
				${view.contents}
				</div>
			</div>
		</div>
	</section>
</body>
</html>