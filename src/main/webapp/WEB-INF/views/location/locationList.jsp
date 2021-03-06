<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -Location List페이지입니다 ##</title>
<link href="../resources/css/location/list.css" rel="stylesheet">
<link href="../resources/css/common/paging.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.1.6/css/swiper.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.1.6/css/swiper.min.css">


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
	
		$(".btn_now").click(function(){
			cur=$(this).attr("title");
			document.frrm.curPage.value=cur;
			document.frrm.submit();
		});
		
		var curPage='${page.curPage}';
		$(".btn_now").each(function(){
			if($(this).attr("title")==curPage){
				$(this).css("background-color","#582D32");
				$(this).css("color","white");
			} 
		});
		
		
	});
</script>
</head>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
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
					<input type="hidden" value="1" name="curPage">
					<div id="search">
						<div id="search2">
							<select name="kind">
								<option value="loc_name">장소명</option>
								<option value="area">주소</option>
							</select> <input type="text" name="search" placeholder="검색어를 입력해주세요">
							<img id="searchw" src="../resources/upload/search.png"
								style="width: 20px; height: 20px;">
						</div>
						<c:if test="${member.id eq 'admin'}">
						<div id="adminWrite">Write</div>
						</c:if>
					</div>
				</form>
			</div>
			<div id="loc_list">
				<ul>
					<c:forEach items="${loc_list}" var="l">
						<li class="list_item">
								<div class="swiper-container">
									<div class="swiper-wrapper">
						<c:forEach items="${files}" var="f">
										<c:if test="${f.loc_name eq l.loc_name}">
											<img class="swiper-slide"
												src="../resources/upload/${f.fname}">
										</c:if>
							</c:forEach>
									</div>
									<!-- Add Pagination -->
									<div class="swiper-pagination"></div>
									<!-- Add Arrows -->
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							<h3>${l.loc_name}</h3>
							<p>${l.area}</p>
							<div class="link" onclick="locationView(${l.num})">자세히 보기</div></li>
					</c:forEach>
				</ul>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.1.6/js/swiper.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.1.6/js/swiper.min.js"></script>

				<script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
			</div>
		</div>
		<div id="paging">
			<div id="pagination">
				<c:if test="${page.curBlock > 1}">
					<button title="${page.startNum-1}" class="page list pageing">＜</button>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<button title="${i}" class="page list btn_now pageing">${i}</button>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<button title="${page.lastNum+1}" class="page list pageing">＞</button>
				</c:if>
			</div>
			<c:if test="${member.job eq 'singer'}">
				<div id="write">Write</div>
			</c:if>
		</div>
	</section>
	<a href="./locationList" id="top"><img
		src="../resources/upload/acoustic-guitar.png"><br>Top</a>
</body>
</html>