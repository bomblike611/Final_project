<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='../jquery-1.7.2.js'></script>
<script src='../jquery-ui.custom.js'></script>
<script src='cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.js'></script>
<link href='../jquery-ui-1.7.2.custom.css' rel='stylesheet' /> 
<link href='cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.css' rel='stylesheet' />
<link href='cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.print.css' rel='stylesheet' /> 
<script type="text/javascript">
$(function(){
		
});


</script>
</head>
<body>
<h1>memo</h1>
	<!--================================ 일정조회 시작 ================================-->
				<div id="sc">
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
				</div>
		<!--================================ 일정조회 끝 ================================-->
</body>
</html>