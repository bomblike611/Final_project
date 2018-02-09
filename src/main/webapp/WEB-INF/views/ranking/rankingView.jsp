<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="/busk/resources/css/ranking/rankingView.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".rankingKind").click(function() {
			$(".rankingKind").css({"font-weight": "normal", "border-bottom": "none"});
			$(this).css({"font-weight": "bold","border-bottom": "1px solid #582D32"});
		});
	});
</script>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">
		<div id="listmain">
			<div id="rank">
				<img src="../resources/upload/acoustic-guitar.png" style="width:80px;height: 80px;">
				<h2>Ranking</h2>
				<p>랭킹을 검색해보세요.</p>
				<form action="./rankingView" method="post">
					<div id="search">
						<div id="search2">
							<select>
								<option>아이디</option>
								<option>팀명</option>
							</select> 
							<input type="text" name="search" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="/busk/resources/upload/search.png" style="width:20px;height: 20px;">
						</div>
					</div>
				</form>
				<a class="rankingKind" style="font-weight: bold; border-bottom: 1px solid #582D32;">후원을 많이 한 회원랭킹</a><a class="rankingKind">후원을 많이 받은 가수랭킹</a><a class="rankingKind">추천을 많이 받은 가수랭킹</a><a class="rankingKind">게시글 작성 많이한 회원랭킹</a><a class="rankingKind">버스킹 참여자가 많은 가수랭킹</a>
			</div>
			<div id="ranking_list">
				<div id="ranking_chart">
					<table id="ranking_table">
						<tr>
							<td></td>
							<td>아이디</td>
							<td>후원금</td>
							<td>게시글 작성수</td>
						</tr>
						<tr>
							<td>1</td>
							<td><span class="profile_pic"><img src="/busk/resources/images/busker/4.jpg">456red</span></td>
							<td><div class="graph"><div></div></div><p>10000</p></td>
							<td><div class="graph"><div></div></div><p>5</p></td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</section>
</body>
</html>