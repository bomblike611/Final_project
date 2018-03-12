<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/notice/View.css"rel="stylesheet">
<title>## 노래왕 버스킹 -(View)입니다</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
<h1 id="top_view">NoticeView</h1>

	<h1 class="view_title">Title : ${view.title}</h1>
	<h1 class="view_Contents">Contents : ${view.contents}</h1>
	
	<!-- 첨부파일 a 태그 사용 -->
	<c:forEach items="${view.files}" var="file">
		<a href="../file/fileDown?fname=${file.fname}&oname=${file.oname}">${file.oname}</a>
	</c:forEach>	
	
	
	<div class="center">
		<div class="button large dark">
			<c:if test="${member.id eq 'admin'}">  <!--게시판 del 키 버튼이 관리자만이 볼수 있게끔 -->
				<a href="Update?num=${view.num}">Update</a>
				<a href="Delete?num=${view.num}">Delete</a>
			</c:if>
		</div>
	</div>
	</section>
</body>
</html>