<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(회원가입 약관동의)입니다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" " rel="stylesheet">
</head>
<body>
	<%@include file="../temp/header.jsp"%>

	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">회원정보</h2>
		
	<div class="mypage">
		<h5 class="inpo">노래왕 버스킹 프로필</h5>
		<div><img id="poto2" src="../resources/upload/${member.fname}" style="width: 100px; 
		height: 100px; border-radius: 50%; margin-left: 5%; margin-top: 3%;">
		<table class="memberinfo">
			<tr>
				<td style="width: 55%;">이름</td>
				<td>${member.name}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">아이디</td>
				<td>${member.id}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">나이</td>
				<td>${member.age}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">생년월일</td>
				<td>${member.birth}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">이메일</td>
				<td>${member.email}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">핸드폰번호</td>
				<td>${member.phone}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;">직업</td>
				<td>${member.job}</td>
			</tr>
		</table>
		</div>
	</div>	
	
	<div class="mypage1">
		<h5 class="inpo">노래왕 버스킹 게시한 글 보기</h5>
	</div>
	
	<div class="mypage2">
		<h5 class="inpo">노래왕 버스킹 후원목록</h5>
	</div>
	
	<div class="mypage3">
		<h5 class="inpo">노래왕 버스킹 포인트내역 확인</h5>
	</div>	
	</div>






</body>
</html>