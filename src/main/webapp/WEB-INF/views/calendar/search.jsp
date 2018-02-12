<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(search)입니다</title>
<link href="../resources/css/calendar/search.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fromDate').on('change', function() {
			$('#toDate').prop('min', $(this).val());
		});
		$('#toDate').on('change', function() {
			$('#fromDate').prop('max', $(this).val());
		});
		
		$('.page').click(function(){
			var cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.sing.value='${page.sing}';
			document.frm.fromDate.value='${page.fromDate}';
			document.frm.toDate.value='${page.toDate}';
			document.frm.place.value='${page.place}';
		});
		
	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>

<!--================================ 서치부분 ================================-->
		<div id="sec">
					<form id="frm" name="frm" action="search" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="curPage" value="1">
				<div class="row">
						<span> 
							<input name="sing" class="balloon" id="sing" type="text" placeholder="메리플레인, 하진우, 현이..." /><label for="sing">Singer</label>
						</span>
						<span>
							<input name="fromDate" class="balloon" id="fromDate" type="date" /><label for="Fromdate">From date</label>
						</span>
						~
						<span>
							<input name="toDate" class="balloon" id="toDate" type="date" value="2018-02-28"/><label for="toDate">To date</label>
						</span>
						<span> 
							<input name="place" class="balloon" id="place" type="text" placeholder="Seoul, Hongdae, CGV..." /><label for="place">Place</label>
						</span>
				
							<input type="submit" id="btn" value="Search" style="cursor: pointer;">
						
				</div>
				
<!--================================ 보여지는 폼 ================================-->
				<c:forEach items="${list}" var="dto">
					<div id="singer">ACOUSTIC ${dto.position}</div>
					<div id="singerle">17 OCT ${dto.reg_date}</div>
					<div id="singerri1">Serious Frog ${dto.teamname}</div>
					<div id="singerri2">
						<div id="singerri3">
							<div id="singerri4">
								<div id="pic">
									<p>사진</p>
								</div>
									<p>SOMEWHERE IN NY</p>
									<p>from 27/02/18 to 27/02/18</p>
									<p>19:00 to 21:00</p>
									<p>Somewhere 128, New York</p>
							<input id="do" type="submit" value="후원하기">
							</div>
								<div id="singerri5">
								지도
								</div>
						</div>
					</div>
				</c:forEach>
					</form>

		</div>
<!--================================ 페이징처리 ================================-->
		<div>
			<c:if test="${page.curBlock > 1}">
				<span class="page" title="${page.startNum-1}">《</span>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}"var="i">
				<span class="page" title="${i}">${i}</span>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock }">
				<span class="page" title="${page.lastNum+1}">》</span>
			</c:if>
		</div>
	
	</section>
</body>
</html>