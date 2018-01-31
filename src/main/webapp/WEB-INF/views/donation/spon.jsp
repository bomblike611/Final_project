<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/busk/resources/css/donation/spon.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var money;
		$("#temporary").click(function(){
			$("#amount").html("<div class='money' title='50000'>5만원</div><div class='money' title='30000'>3만원</div><div class='money' title='20000'>2만원</div><div class='money' title=''>기타</div>");
		}); 
		$("#amount").on("click",".money",function(){
			money=$(this).attr("title");
			alert(money);
		});
		$("#next").click(function(){
			$("#myprogress").css("width", "70%");
		});
	});
</script>
</head>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">
		<div id="main_spon">
				<div id="busker_info"></div>
				<div id="donate">
					<div id="progress">
						<ul>
							<li>
								<p>1</p>
								<span>후원금액</span>
							</li>
							<li>
								<img alt="" src="/busk/resources/images/rightB_icon2.png">
							</li>
							<li>
								<p>2</p>
								<span>후원자 정보</span>
							</li>
							<li>
								<img alt="" src="/busk/resources/images/rightB_icon2.png">
							</li>
							<li>
								<p>3</p>
								<span>결제 방식</span>
							</li>
						</ul>
					</div>
					<div id="loading">
						<div id="myprogress"></div>
					</div>
					<div>
						<p>후원금을 선택해 주세요</p>
						<button id="regular">정기후원</button>
						<button id="temporary">일시후원</button>
						<div id="amount">
							<div class="money" title="30000">3만원</div>
							<div class="money" title="20000">2만원</div>
							<div class="money" title="10000">1만원</div>
							<div class="money" title="">기타</div>
						</div>
						<button id="next">다음 -></button>
					</div>
				</div>
			<div></div>
		</div>
	</section>
</body>
</html>