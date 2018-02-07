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
								$("#picture")
										.append(
												'<p class="p" id="'+count+'"><input type="file" name="file"></p>');
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
			$("#frm").submit();
		});

	});
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae88eb2c4820eb8b91b58f0cfc8ea570&libraries=services"></script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<script src="../resources/css/location/map.js"></script>
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
					<form action="locationWrite" method="post">
						<table id="formdata">
							<tr>
								<td><span style="color: red;">*</span>장소명</td>
								<td><input type="text" id="input" name="loc_name"
									placeholder="장소를 입력해주세요"></td>
							</tr>
							<tr>
								<td><span style="color: red;">*</span>주소</td>
								<td><input type="text" id="input" name="addr"
									placeholder="주소가 입력됩니다"></td>
									<td rowspan="2"><div class="map_wrap"></div></td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td><span style="color: red;">*</span>사진
									<p id="add">ADD</p>
									<p id="remove">REMOVE</p></td>
								<td id="picture"><p class="p">
										<input type="file" name="file">
									</p></td>
							</tr>
							<tr>
								<td>설명</td>
								<td><textarea></textarea></td>
							</tr>
						</table>
						<button class="btn btn--stripe">Location Write</button>
					</form>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;" id="frm">
										키워드 : <input type="text" value="키" placeholder="키워드를 입력해주세요"
											id="keyword" size="15"> <input type="button"
											value="search" id="search">
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>