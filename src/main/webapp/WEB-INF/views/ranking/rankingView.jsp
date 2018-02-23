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
		$("#${kindof}").css({"font-weight": "bold","border-bottom": "1px solid #582D32"});
		$("#kind").val("${kindof}");
		$(".rankingKind").click(function() {
			$("#kind").val($(this).attr("id"));
			$("#search3").val("");
			$("#frm").submit();
		});
		$("#searchw").click(function(){
			$("#frm").submit();
		});
	})
</script>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">
		<div id="listmain">
			<div id="rank">
				<img src="../resources/upload/acoustic-guitar.png" style="width:80px;height: 80px;">
				<h2>Ranking</h2>
				<p>랭킹을 검색해보세요.</p>
				<form id="frm" action="./rankingView" method="post">
					<div id="search">
						<div id="search2">
							<input type="hidden" name="kind" id="kind" value="">
							<input type="text" name="search" id="search3" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="/busk/resources/upload/search.png" style="width:20px;height: 20px;">
						</div>
					</div>
				</form>
				<a class="rankingKind" id="다후원회원">후원을 많이 한 회원랭킹</a><a class="rankingKind" id="다후원가수">후원을 많이 받은 가수랭킹</a><a class="rankingKind" id="다게시회원">게시글 작성 많이한 회원랭킹</a><a class="rankingKind" id="다참여가수">버스킹 참여자가 많은 가수랭킹</a>
			</div>
			<div id="ranking_list">
				<div id="ranking_chart">
					<c:if test="${not empty rankList}">
						<table id="ranking_table">
							<tr>
								<td></td>
								<td>${idorteam}</td>
								<td>${priceor}</td>
							</tr>
							<c:forEach items="${rankList}" var="list" varStatus="index">
								<tr>
									<td>${index.count}</td>
									<td><span class="profile_pic"><img src="/busk/resources/upload/${buskList[index.index].fname}">${list.id}${list.teamName}</span></td>
									<td><div class="graph"><div></div></div><span>${list.price}</span></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${empty rankList}">
						<div>해당자료가 없습니다.</div>
					</c:if>
				</div>
			</div>

		</div>
	</section>
</body>
</html>