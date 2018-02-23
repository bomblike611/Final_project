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
		$("#busker_list").on("click",".link",function(){
			var teamname = $(this).attr("title");
			location.href = "./buskerView?teamname="+teamname;
		});
		$("#searchw").click(function() {
			var kind = $("#kind").val();
			var search = $("#gosearch").val();
			$.post("./buskerList",{kind:kind, search:search}, function(data){
				$("#busker_list").html(data);
		    });
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
					<div id="search">
						<div id="search2">
							<select id="kind">
								<option value="팀명">팀명</option>
								<option value="팀원">팀원</option>
							</select> 
							<input type="text" id="gosearch" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="/busk/resources/upload/search.png" style="width:20px;height: 20px;">
						</div>
					</div>
			</div>
			<div id="busker_list">
				<ul>
					<c:forEach items="${teamname}" var="t">
								<li class="list_item">
										<div class="busker_img">
										<c:forEach items="${list}" var="list1">
											<c:if test="${list1.teamName eq t}">
		 										<img src="/busk/resources/upload/${list1.fname}">
											</c:if>
										</c:forEach>
									</div>
									<h3>${t}</h3>
									<p>팀원 :
									<c:forEach items="${m[t]}" var="membername">
										${membername}
									</c:forEach>
									</p>
									<div class="link" title="${t}">Link</div>
									</li>
						</c:forEach>
				</ul>
			</div>
		</div>
</section>
</body>
</html>