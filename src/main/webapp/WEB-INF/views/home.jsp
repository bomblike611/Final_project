<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<title>Home</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>


<%@include file="/WEB-INF/views/temp/header.jsp" %>

	<section id="main">
		<a href="./location/locationWrite">Location_write</a>
	</section>


<a href="./recommend/communityList">리스트</a>
<a href="./busker/buskerList">busker</a>
<a href="./ranking/rankingView">ranking</a>
<a href="./review/reviewList"></a>
	<%@include file="/WEB-INF/views/temp/footer.jsp"%>
</body>
</html>
