<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -Location List페이지입니다 ##</title>
<link href="../resources/css/location/list.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		function locationView(num){
			location.href="locationView?num="+num;
		}
	$(function() {
		$("#adminWrite").click(function() {
			location.href = "./locationWrite";
		});
	
		$(".page").click(function(){
			var cur= $(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.search.value='${page.search}';
			document.frm.kind.value='${page.kind}';
			document.frm.submit();
		});
		
		
	});
</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="listmain">
			<div id="loc">
				<img src="../resources/upload/acoustic-guitar.png"
					style="width: 80px; height: 80px;">
				<h2>Location List</h2>
				<p>대여 가능한 장소를 찾아보세요.</p>
				<form action="./locationList" method="post" name="frm">
					<input type="hidden" value="" name="curPage">
					<div id="search">
						<div id="search2">
							<select name="kind">
								<option value="loc_name">장소명</option>
								<option value="area">주소</option>
							</select> <input type="text" name="search" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="../resources/upload/search.png"
								style="width: 20px; height: 20px;">
						</div>
						<div id="adminWrite">Write</div>
					</div>
				</form>
			</div>
			<div id="loc_list">
				<ul>
					<c:forEach items="${loc_list}" var="l">
						<li class="list_item"><c:forEach items="${files}" var="f">
								<c:if test="${f.loc_name eq l.loc_name}">
									<img src="../resources/upload/${f.fname}">
								</c:if>
							</c:forEach>
							<h3>${l.loc_name}</h3>
							<p>${l.area}</p>
							<div class="link" onclick="locationView(${l.num})">Link</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div>
			<c:if test="${page.curBlock > 1}">
				<span class="page" title="${page.startNum-1}">[이전]</span>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<span class="page" title="${i}">${i}</span>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
				<span class="page" title="${page.lastNum+1}">[다음]</span>
			</c:if>
		</div>
	</section>
	<a href="./locationList" id="top"><img
		src="../resources/upload/acoustic-guitar.png"><br>Top</a>
</body>
</html>