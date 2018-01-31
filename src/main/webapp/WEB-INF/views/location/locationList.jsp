<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div>
			<p>Location List</p>
			<p>대여 가능한 장소를 찾아보세요.</p>
			<select>
				<option>장소명</option>
				<option>주소</option>
			</select> <input type="text" name="search">
		</div>
	</section>
</body>
</html>