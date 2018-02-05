<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskWrite.css" rel="stylesheet">
<title>## 노래왕 버스킹 -Busking Write페이지입니다</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
<section id="main">
<div id="WritePage">
<div id="loc">
<h2>Busking Write</h2>
<p>가수분들은 공연 시간 10분전에 도착하여 공간확보를 미리 부탁드립니다.</p>
</div>
<form action="./buskWrite" method="post" enctype="multipart/form-data">
<table>
<tr><th><span style="color:red;">*</span>공연명</th><td><input type="text" name="title" placeholder="공연명을 입력해주세요"></td></tr>
<tr><th><span style="color:red;">*</span>팀명</th><td><input type="text" name="teamname" placeholder="가수명"></td></tr>
<tr><th><span style="color:red;">*</span>공연지역</th><td><select name="location" ><option>가게</option></select></td></tr>
<tr><th><span style="color:red;">*</span>공연일자</th><td><input type="date" name="busk_date"></td></tr>
<tr><th><span style="color:red;">*</span>참가자수</th><td><input type="text" value="0"></td></tr>
<tr><th><span style="color:red;">*</span>소개</th><td><textarea name="contents"></textarea></td></tr>
</table>
</form>
</div>
</section>
</body>
</html>