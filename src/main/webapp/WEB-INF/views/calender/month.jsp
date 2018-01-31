<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/schedule/month.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fromDate').on('change', function() {
			$('#toDate').prop('min', $(this).val());
		});
		$('#toDate').on('change', function() {
			$('#fromDate').prop('max', $(this).val());
		});
	});
</script>
</head>
<body>
<%-- <%@ include file="../temp/header.jsp" %> --%>
<h1>Upcoming Busk</h1>
	<form action="" method="post">
		<!-- 일정조회 시작 -->
		<div id="area">
			<select name="kind">
					<option value="seoul">Seoul</option>
					<option value="gg">Gyeonggi</option>
					<option value="incheon">Incheon</option>
			</select>
		</div>
		<div id="date">
			<input type="date" id="fromDate"> ~ <input type="date" id="toDate">
		</div>
		<div id="place">
			<input type="text" name="search" placeholder="busking place">
		</div>
		<div>
			<input type="submit" id="btn" value="Search">
		</div>
		<!-- 일정조회 끝 -->
		<!-- 일정리스트 시작 -->
		<p>요일: <h1>${month.busk_date}</h1></p>
		<p>위치: <h1>${month.busk_date}</h1></p>
		<p>시간: <h1>${month.busk_date}</h1></p>
		<!-- 일정리스트 끝 -->
	</form>
</body>
</html>