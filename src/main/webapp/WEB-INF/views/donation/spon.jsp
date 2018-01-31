<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/busk/resources/css/donation/spon.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">
		<div id="main_spon">
				<div id="busker_info"></div>
				<div id="donate">
					<div id="progress">
						<ul>
							<li class="myprogress">
								<p>1</p>
								<span>후원금액</span>
							</li>
							<li class="myprogress">
								<p>2</p>
								<span>후원자 정보</span>
							</li>
							<li>
								<p>3</p>
								<span>결제 방식</span>
							</li>
						</ul>
					</div>
					<div id="loading"></div>
				</div>
			<div></div>
		</div>
	</section>
</body>
</html>