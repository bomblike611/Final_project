<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -버스커리스트페이지입니다 ##</title>
</head>
<link href="/busk/resources/css/busker/buskerlist.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".link").click(function(){
			location.href = "./buskerView";
		});
	});
</script>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
<section id="main">
		<div id="listmain">
			<div id="busk">
				<img src="../resources/upload/acoustic-guitar.png" style="width:80px;height: 80px;">
				<h2>Busker List</h2>
				<p>찾고싶은 버스커를 검색해보세요.</p>
				<form action="./BuskerList" method="post">
					<div id="search">
						<div id="search2">
							<select>
								<option>팀명</option>
								<option>팀원</option>
							</select> 
							<input type="text" name="search" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="/busk/resources/upload/search.png" style="width:20px;height: 20px;">
						</div>
					</div>
				</form>
			</div>
			<div id="busker_list">
				<ul>
					<li class="list_item"><img src="/busk/resources/images/busker/twice.jpg"><h3>트와이스</h3><p>팀원 : 나연 사나 쯔위 모모 기타등등</p><div class="link">Link</div></li>
				</ul>
			</div>
		</div>
</section>
</body>
</html>