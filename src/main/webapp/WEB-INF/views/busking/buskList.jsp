<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>## 노래왕 버스킹 -Busking List페이지입니다</title>
</head>
<script type="text/javascript">
	$(function() {
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	});
</script>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<form action="./buskList" method="post">
			<div id="searchForm">
			<select>
			<option>전체</option>
			<option>지난공연</option>
			<option>현재공연</option>
			<option>예정공연</option>
			</select>
				<input type="text" name="search">
				<button>Hello</button>
			</div>
		</form>
		<div id="consertList">
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다 ㅠㅠ</p>
				<div class="heading">
					<h2>
						<span>노래왕</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample31.jpg"
				alt="${title}" />
			<figcaption>
				<p>디자인 시러...</p>
				<div class="heading">
					<h2>
						해피<span> 버스킹</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample32.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다</p>
				<div class="heading">
					<h2>
						화이팅<span> 하세요</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다 ㅠㅠ</p>
				<div class="heading">
					<h2>
						<span>노래왕</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample31.jpg"
				alt="${title}" />
			<figcaption>
				<p>디자인 시러...</p>
				<div class="heading">
					<h2>
						해피<span> 버스킹</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample32.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다</p>
				<div class="heading">
					<h2>
						화이팅<span> 하세요</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure><figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다 ㅠㅠ</p>
				<div class="heading">
					<h2>
						<span>노래왕</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample31.jpg"
				alt="${title}" />
			<figcaption>
				<p>디자인 시러...</p>
				<div class="heading">
					<h2>
						해피<span> 버스킹</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		<figure class="snip1200">
			<img
				src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample32.jpg"
				alt="${title}" />
			<figcaption>
				<p>집에 가고싶다</p>
				<div class="heading">
					<h2>
						화이팅<span> 하세요</span>
					</h2>
				</div>
			</figcaption>
			<a href="#"></a>
		</figure>
		</div>
	</section>
</body>
</html>