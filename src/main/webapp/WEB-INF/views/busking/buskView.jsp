<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskView.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="container">
			<div id="singerView">
				<div id="busktitle">
					<img src="../resources/upload/acoustic-guitar.png" id="guitarImg">
					<h3>가수 콘서트 이름 들어갈 자리</h3>
					<p>팀 이름 들어갈 자리</p>
				</div>
				<div id="buskcontents">
					<div id="img">
						<img src="../resources/upload/location/busk1.jpg">
					</div>
					<div id="singerProfile">
						<table>
							<tr>
								<th><span style="color: red;">*</span> title</th>
								<td>머름</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> singer</th>
								<td>카딘</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> location</th>
								<td>경기도 시흥시 어딘가</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> time</th>
								<td>6시</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> genre</th>
								<td>모던 록</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> SNS</th>
								<td>www.github.com</td>
							</tr>
							<tr>
								<th><span style="color: red;">*</span> participant</th>
								<td>3/20</td>
							</tr>
						</table>
					</div>
					<div id="sulmyung">
						<div id="nayong">
							<span></span>
							<p>위의 참여자수는 가수들이 어느정도 참여자가 올 것인지 측정하기 위해</p>
							<p>쓰여진 것이므로 실제 참여자수와 다를 수 있습니다.</p>
							<p>후원을 원하시는 경우 밑의 후원버튼을 클릭시 후원창으로 연결됩니다.</p>
							<span></span>
							<div>후원하기</div>
							<div>참가신청</div>
							<div>수정</div>
							<div>삭제</div>
						</div>
					</div>
				</div>
			</div>
			<div id="introduce">
				<p>소개</p>
				<div id="map"></div>
			</div>
		</div>
	</section>
</body>
</html>