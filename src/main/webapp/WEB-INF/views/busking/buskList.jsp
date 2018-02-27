<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskList.css" rel="stylesheet">
<link href="../resources/css/busk/search.css" rel="stylesheet">
<link href="../resources/css/common/paging.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>## 노래왕 버스킹 -Busking List페이지입니다</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
</head>
<script type="text/javascript">
	function mailSendArea() {
		$("#myModal").css("display", "block");

	}
	$(function() {
		$(".close").click(function() {
			$("#myModal").css("display", "none");
		});
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});

		$("#write").click(function() {
			location.href = "./buskWrite";

		});

	});
</script>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="loc">
			<h2>Busking List</h2>
			<p>기간에 따라 공연을 골라보실 수 있습니다. 마우스 클릭시 공연 상세페이지로 이동합니다.</p>
		</div>
		<form action="./buskList" method="post">
			<div id="searchForm">
				<select name="kind">
					<option>전체</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="teamname">가수명</option>
				</select> <input id="search" name="search" type="text"
					placeholder="What're we looking for ?"> <input
					id="search_submit" value="Rechercher" type="submit"> <img
					src="../resources/upload/mic.gif" id="voice" onclick="mailSendArea()">
			</div>
		</form>
		<div id="consertList">
			<c:forEach items="${list}" var="l">
				<figure class="snip1200">
					<c:if test="${l.fname eq 'null'}">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg"
							alt="${l.title}" />
					</c:if>
					<c:if test="${l.fname ne 'null'}">
						<img src="../resources/upload/${l.fname}" alt="${l.title}" />
					</c:if>
					<figcaption>
						<p>
							<b>${l.teamname }</b><br>${l.location} / ${l.busk_date}
						</p>
						<div class="heading">
							<h2>
								<span>${l.title}</span>
							</h2>
						</div>
					</figcaption>
					<a href="./buskView?num=${l.num}&id=${l.writer}"></a>
				</figure>
			</c:forEach>
		</div>
		<div id="paging">
			<div id="pagination">
				<c:if test="${page.curBlock > 1}">
					<span class="page" title="${page.startNum-1}">〈</span>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<span class="page" title="${i}">${i}</span>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<span class="page" title="${page.lastNum+1}">〉</span>
				</c:if>
			</div>
			<c:if test="${member.job eq 'singer'}">
				<div id="write">Write</div>
			</c:if>
		</div>
	</section>
	<a href="./buskList" id="top"><img
		src="../resources/upload/acoustic-guitar.png"><br>Top</a>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>음성 검색</h2>
			</div>
			<div class="modal-body">
				<div>
					<div id="info">
						<p id="info_start">음성인식을 시작하시려면, 마이크 아이콘을 클릭해주세요.</p>
						<p id="info_speak_now">지금 말씀해주세요.</p>
						<p id="info_no_speech">
							음성 신호가 잡히지 않았습니다. 컴퓨터에 연결된 <a
								href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
								마이크 설정을</a> 확인해주세요.
						</p>
						<p id="info_no_microphone" style="display: none">
							마이크 신호가 잡히지 않았습니다. <a
								href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
								마이크 설정이</a> 제대로 되어 있나 살펴보거나, 컴퓨터에 연결되어 있는 지 확인해주세요.
						</p>
						<p id="info_allow">위의 허용버튼을 클릭하여 마이크를 활성화해주세요.</p>
						<p id="info_denied">마이크 사용 승인이 이루어지지 않았습니다.</p>
						<p id="info_blocked">마이크 사용이 막혀있습니다. 크롬의
							chrome://settings/contentExceptions#media-stream으로 이동하여 설정을
							바꿔주세요.</p>
						<p id="info_upgrade">
							Web Speech API is not supported by this browser. Upgrade to <a
								href="//www.google.com/chrome">Chrome</a> version 25 or later.
						</p>
					</div>

					<div class="right">
						<button id="start_button" onclick="startButton(event)">
							<img id="start_img" src="../resources/upload/mic.gif" alt="Start">
						</button>
					</div>
					<div id="results">
						<span id="final_span" class="final"></span> <span
							id="interim_span" class="interim"></span>
						<p>
					</div>
					<div>
						<div id="div_language">
							Language : <select id="select_language" onchange="updateCountry()"></select>
							&nbsp;&nbsp; <select id="select_dialect"></select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/voice.js"></script>
</body>
</html>