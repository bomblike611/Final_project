<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(회원가입 완료)입니다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css"  rel="stylesheet">
<script type="text/javascript">
$(function() {
	$(".cancelBtn").click(function() {
		window.location = '../';
	});
	
	$(".nextBtn").click(function() {
		window.location = '/busk/member/memberLogin';
	});
});
</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<div class="join_OK" >
		<h2 class="tit_bk_left pt30">JOIN OK</h2>
		<div class="join_wrapper">
			<ul class="stepGuide">
				<li class="stepGuide_off"><p>1</p> <span style="color: gray;">약관동의</span></li>
				<li class="stepGuide_off"><p>2</p> <span style="color: gray;">회원정보
						입력</span></li>
				<li class="stepGuide_on2"><p id="a">3</p> <span>회원가입 완료</span></li>
			</ul>
		</div>
		
			<div class="Join_Thank">
			</div>
			<div style="margin-top: 50px">
			<h3 style="text-align: center;">고객님의 회원가입을 진심으로 감사드립니다</h3>
			</div>			
		
		<ul class="btnBox2">
				<button class="nextBtn" type="submit">LOG-IN</button>
				<button class="cancelBtn" type="button">HOME</button>		
		</ul>
	</div>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>