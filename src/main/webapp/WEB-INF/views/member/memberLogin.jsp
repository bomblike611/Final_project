<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">LOGIN</h2>
		<ul class="loginGuide">
		</ul>

		<div class="login_wrapper clearfix">
			<div class="top_wrap">
				<div class="login_member">
					<h5>회원 로그인</h5>
					<form action="./memberLogin" method="post">
						<fieldset class="login_set">
							<input name="id" tabindex="1" class="id" type="text" placeholder="아이디"> 
							<input name="pw" tabindex="2" class="pw" type="password" placeholder="비밀번호"
								style="margin-top: 5px;"> 

							<ul class="login_info">
								<li><input class="ck" type="checkbox" value=""
								style="height: 12px; width: 12px;">&emsp;아이디 저장</li>
								<li class="id_search"><a href="#">아이디/비밀번호 찾기</a></li>
							</ul>
							<button class="login_Btn" type="button" value="LOGIN">
								<span>LOGIN</span>
							</button>
						</fieldset>
					</form>
				</div>

			</div>
			<!--top_wrap end--->

			<div class="login_joinGuide">
				아직 Varoh 회원이 아니신가요?<br>
				Varoh의 회원이 되시면 할인쿠폰과 <br>
				이벤트 참여 등 더 많은 혜택을 받으실 수 있습니다.
				<button class="JoinBtn" type="submit">JOIN</button>
			</div>
		</div>

	</div>

</body>
</html>