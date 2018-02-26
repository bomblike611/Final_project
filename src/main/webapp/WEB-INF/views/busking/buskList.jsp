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
					src="../resources/upload/mic.gif" onclick="mailSendArea()">
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

				<div class="right">
					<button id="start_button" onclick="startButton(event)">
						<img id="start_img" src="../resources/upload/mic.gif" alt="Start">
					</button>
				</div>
				<div id="results">
					<span id="final_span" class="final"></span> <span id="interim_span"
						class="interim"></span>
					<p>
				</div>
				<div>
					<div id="div_language">
						<select id="select_language" onchange="updateCountry()"></select>
						&nbsp;&nbsp; <select id="select_dialect"></select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none;">
		<h1 class="center" id="headline">
			<a
				href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html">
				Web Speech API</a> Demonstration
		</h1>
		<div id="info">
			<p id="info_start">Click on the microphone icon and begin
				speaking.</p>
			<p id="info_speak_now">Speak now.</p>
			<p id="info_no_speech">
				No speech was detected. You may need to adjust your <a
					href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
					microphone settings</a>.
			</p>
			<p id="info_no_microphone" style="display: none">
				No microphone was found. Ensure that a microphone is installed and
				that <a
					href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
					microphone settings</a> are configured correctly.
			</p>
			<p id="info_allow">Click the "Allow" button above to enable your
				microphone.</p>
			<p id="info_denied">Permission to use microphone was denied.</p>
			<p id="info_blocked">Permission to use microphone is blocked. To
				change, go to chrome://settings/contentExceptions#media-stream</p>
			<p id="info_upgrade">
				Web Speech API is not supported by this browser. Upgrade to <a
					href="//www.google.com/chrome">Chrome</a> version 25 or later.
			</p>
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/voice.js"></script>
</body>
</html>