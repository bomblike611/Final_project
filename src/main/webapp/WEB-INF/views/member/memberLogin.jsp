<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(로그인)입니다</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<link href="/busk/resources/css/member.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$(".JoinBtn").click(function() {
			window.location = '/busk/member/memberAgree';
		});
	});
</script>
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
							<input name="id" tabindex="1" class="id" type="text"
								placeholder="아이디"> <input name="pw" tabindex="2"
								class="pw" type="password" placeholder="비밀번호"
								style="margin-top: 5px;">

							<ul class="login_info">
								<li><input class="ck" type="checkbox" value=""
									style="height: 12px; width: 12px;">&emsp;아이디 저장</li>
								<li class="id_search"><a href="./memberIDSearch">아이디/비밀번호 찾기</a></li>
							</ul>
							<button class="login_Btn" type="submit" value="LOGIN">
								<span>LOGIN</span>
							</button>
						</fieldset>
					</form>
				</div>

			</div>
			<!--top_wrap end--->

			<div class="login_joinGuide">
				아직 Varoh 회원이 아니신가요?<br> Varoh의 회원이 되시면 할인쿠폰과 <br> 이벤트 참여 등
				더 많은 혜택을 받으실 수 있습니다.
				<button class="JoinBtn" type="submit">JOIN</button>
			</div>
			<div class="fb-login-button" data-max-rows="1" data-size="large"
				data-button-type="login_with" data-show-faces="false"
				data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"></div>
				
		</div>
	</div>

	<!-- 페이스북 로그인 API Start -->
		<script>

		  // SDK를 비동기적으로 호출
		  (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/ko_KR/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));
		
		  window.fbAsyncInit = function() {
		  FB.init({
		    appId      : '1636176719799872',
		    cookie     : true,  // 쿠키가 세션을 참조할 수 있도록 허용
		    xfbml      : true,  // 소셜 플러그인이 있으면 처리
		    version    : 'v2.1' // 버전 2.1 사용
		  });
		
		  // 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다.
		  //.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다.
		  // 그 3가지 상태는 아래와 같다.
		  // 1. 앱과 페이스북에 로그인 되어있다. ('connected')
		  // 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized')
		  // 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다.
		  //
		  // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다.
				
		  };
		
		  // 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다.
		  // onlogin 핸들러를 아래와 같이 첨부하면 된다.
		  function checkLoginState() {
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });
		  }
		
		  
		  // This is called with the results from from FB.getLoginStatus().
		  function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);
		    // response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
		    // 앱에서 현재의 로그인 상태에 따라 동작하면 된다.
		    // FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다.
		    if (response.status === 'connected') {
		      // 페이스북을 통해서 로그인이 되어있다.
		      testAPI();
		    } else if (response.status === 'not_authorized') {
		      // 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
		      document.getElementById('status').innerHTML = 'Please log ' +
		        'into this app.';
		    } else {
		      // 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
		      document.getElementById('status').innerHTML = 'Please log ' +
		        'into Facebook.';
		    }
		  }
		
		  // 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
		  // 이 호출은 statusChangeCallback()에서 이루어진다.
		  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
		    FB.api('/me', function(response) {
		    	FB.api('/me', function(user) {
			location.href='../member/APIUpdate?id='+response.id+"&name="+response.name;
			
		    });
		    });
		  }
		</script>


	<!-- 페이스북 로그인 API And -->

</body>
</html>





















