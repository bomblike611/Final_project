<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
<section id="main">
	<h1>BuskerList</h1>
	<table>
		<tr>
			<td>팀이름</td>
			<td>팀원</td>
			<td>프로필</td>
			<td>SNS</td>
		</tr>
		<c:forEach items="${buskerList}" var="list">
			<tr>
				<td><a href="./spon?id=${list.id}">${list.teamName}</a></td>
				<td>${list.position}</td>
				<td>${list.profile}</td>
				<td>${list.sns}</td>
			</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>