<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" " rel="stylesheet">
</head>
<body>
<%@include file="../temp/header.jsp"%>

	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">JOIN</h2>
		<div class="join_wrapper">
			<ul class="stepGuide">
				<li class="stepGuide_off"><p>1</p> <span style="color: gray;">약관동의</span></li>
				<li class="stepGuide_on"><p id="a">2</p> <span id="a2">회원정보
						입력</span></li>
				<li><p>3</p> <span style="color: gray;">회원가입 완료</span></li>
			</ul>
		</div>
		
		<form action="member/memberJoin", method="post">
		<span style="float: right;"><span style="font-size: 12px; font-weight: 700; color: red; line-height: 16px; t">
							* </span>는 필수사항 입니다</span>
			<table style="border: solid 1px; ">
				<tr>
					<input type="hidden" name="idCheck" value="0" >
					<td>아이디 :</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>패스워드 :</td>
					<td><input type="password"></td>
				</tr>
			</table>
			<button>회원가입</button>		
		</form>
		<button>회원가입 취소</button>
	</div>





</body>
</html>