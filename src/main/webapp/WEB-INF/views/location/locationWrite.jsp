<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/location/write.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>## 노래왕 버스킹 -Location Write페이지입니다</title>
<script type="text/javascript">
	$(function() {
		var count = 0;
		$("#add")
				.click(
						function() {
							if (count < 3) {
								count++;
								$("#picture").append('<div class="p" id="'+count+'"><div class="filebox bs3-primary preview-image"><input class="upload-name" value="파일선택" disabled="disabled"style="width: 200px;"> <label for="input_file">업로드</label><input type="file" id="input_file" class="upload-hidden" name="file"></div></div>');
							} else {
								alert("사진은 4개까지 등록 가능합니다.");
							}
						});
		$("#remove").click(function() {
			if (count > 0) {
				$(".p").each(function() {
					if ($(this).attr("id") == count) {
						$(this).remove();
						count--;
					}
				});
			} else {
				alert("사진 1개는 반드시 등록해야합니다.");
			}
		});
		$("#search").click(function() {
							window.open("./locationMap","장소검색하기","top=100,status=no, left=200,width=1500, height=800, toolbar=no, menubar=no, location=no, scrollbars=no, resizable=no");
						});

		$("#btn").click(function() {
			var check = true;
			$(".oo").each(function() {
				if ($(this).val() == "") {
					check = false;
				}
			});
			if (check) {
				document.frm.submit();
			} else {
				alert("모든 항목을 채워주세요.");
			}
		});

		 var fileTarget = $('.filebox .upload-hidden');

		    fileTarget.on('change', function(){
		        if(window.FileReader){
		            // 파일명 추출
		            var filename = $(this)[0].files[0].name;
		        } 

		        else {
		            // Old IE 파일명 추출
		            var filename = $(this).val().split('/').pop().split('\\').pop();
		        };

		        $(this).siblings('.upload-name').val(filename);
		    });

		    //preview image 
		    var imgTarget = $('.preview-image .upload-hidden');

		    imgTarget.on('change', function(){
		        var parent = $(this).parent();
		        parent.children('.upload-display').remove();

		        if(window.FileReader){
		            //image 파일만
		            if (!$(this)[0].files[0].type.match(/image\//)) return;
		            
		            var reader = new FileReader();
		            reader.onload = function(e){
		                var src = e.target.result;
		                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
		            }
		            reader.readAsDataURL($(this)[0].files[0]);
		        }

		        else {
		            $(this)[0].select();
		            $(this)[0].blur();
		            var imgSrc = document.selection.createRange().text;
		            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

		            var img = $(this).siblings('.upload-display').find('img');
		            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
		        }
		    });
		
	});
</script>

</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="writepage">
			<div id="loc_logo">
				<img src="../resources/upload/acoustic-guitar.png"
					style="width: 100px; height: 100px;">
				<h2>Location register</h2>
				<p>버스킹 할 수 있는 장소를 입력해주세요. 사진은 최대 4개까지 등록이 가능합니다.</p>
			</div>
			<div id="WriteForm">
				<div id="realForm">
					<form action="locationWrite" method="post" name="frm"
						enctype="multipart/form-data">
						<table id="formdata">
							<tr>
								<td><span style="color: red;">*</span>장소명</td>
								<td><input type="text" class="oo" name="loc_name"
									placeholder="장소를 입력해주세요"></td>
							</tr>
							<tr>
								<td><span style="color: red;">*</span>주소</td>
								<td><input type="text" class="oo" id="area" name="area"
									placeholder="검색버튼을 눌러주세요" readonly="readonly" title="">
									<div id="search">검색</div></td>
							</tr>
							<tr>
								<td colspan="2"><div id="map"
										style="width: 100%; height: 500px;"></div></td>
							</tr>
							<tr>
								<td><span style="color: red;">*</span>최대인원</td>
								<td><input type="number" class="oo" name="entry"
									placeholder="인원수를 입력해주세요"></td>
							</tr>
							<tr>
								<td><span style="color: red;">*</span>사진
									<p id="add">ADD</p>
									<p id="remove">REMOVE</p></td>
								<td id="picture">
								<div><div
										class="filebox bs3-primary preview-image">
										<input class="upload-name" value="파일선택" disabled="disabled"
											style="width: 200px;"> <label for="input_file">업로드</label>
										<input type="file" id="input_file" class="upload-hidden"
											name="file">
									</div>
									</div></td>
							</tr>
							<tr>
								<td>설명</td>
								<td><textarea name="memo"></textarea></td>
							</tr>
						</table>
					</form>
					<button class="btn btn--stripe" id="btn">Location Write</button>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae88eb2c4820eb8b91b58f0cfc8ea570&libraries=services"></script>
	<script>
		$(function() {
			var addr = "";
			var name = "";
			$("#main")
					.ready(
							function() {
								$("#main")
										.click(
												function() {
													addr = $("#area").val();
													name = $("#area").attr(
															"title");
													var mapContainer = document
															.getElementById('map'), // 지도를 표시할 div 
													mapOption = {
														center : new daum.maps.LatLng(
																33.450701,
																126.570667), // 지도의 중심좌표
														level : 3
													// 지도의 확대 레벨
													};

													// 지도를 생성합니다    
													var map = new daum.maps.Map(
															mapContainer,
															mapOption);

													// 주소-좌표 변환 객체를 생성합니다
													var geocoder = new daum.maps.services.Geocoder();

													// 주소로 좌표를 검색합니다
													if (addr == "") {
														geocoder
																.addressSearch(
																		"서울 서초구 서초동 산 130-6",
																		function(
																				result,
																				status) {

																			// 정상적으로 검색이 완료됐으면 
																			if (status === daum.maps.services.Status.OK) {

																				var coords = new daum.maps.LatLng(
																						result[0].y,
																						result[0].x);

																				// 결과값으로 받은 위치를 마커로 표시합니다
																				var marker = new daum.maps.Marker(
																						{
																							map : map,
																							position : coords
																						});

																				// 인포윈도우로 장소에 대한 설명을 표시합니다
																				var infowindow = new daum.maps.InfoWindow(
																						{
																							content : '<div style="width:150px;text-align:center;padding:6px 0;">예술의 전당</div>'
																						});
																				infowindow
																						.open(
																								map,
																								marker);

																				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																				map
																						.setCenter(coords);
																			}
																		});
													} else {
														geocoder
																.addressSearch(
																		addr,
																		function(
																				result,
																				status) {

																			// 정상적으로 검색이 완료됐으면 
																			if (status === daum.maps.services.Status.OK) {

																				var coords = new daum.maps.LatLng(
																						result[0].y,
																						result[0].x);

																				// 결과값으로 받은 위치를 마커로 표시합니다
																				var marker = new daum.maps.Marker(
																						{
																							map : map,
																							position : coords
																						});

																				// 인포윈도우로 장소에 대한 설명을 표시합니다
																				var infowindow = new daum.maps.InfoWindow(
																						{
																							content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																									+ name
																									+ '</div>'
																						});
																				infowindow
																						.open(
																								map,
																								marker);

																				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																				map
																						.setCenter(coords);
																			}
																		});
													}
												});
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new daum.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new daum.maps.Map(mapContainer,
										mapOption);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								if (addr == "") {
									geocoder
											.addressSearch(
													"서울 서초구 서초동 산 130-6",
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">예술의 전당</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								} else {
									geocoder
											.addressSearch(
													addr,
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																				+ name
																				+ '</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								}
							});

		});
	</script>
</body>
</html>