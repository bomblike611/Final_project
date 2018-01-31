<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/location/write.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="writepage">
			<div id="loc_logo">
				<h2>Location</h2>
				<h3>register</h3>
			</div>
			<div id="WriteForm">
				<div id="realForm">
					<form action="locationWrite" method="post">
						<table id="formdata">
							<tr>
								<td>장소명</td>
								<td><input type="text" name="loc_name"
									placeholder="장소를 입력해주세요"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="addr" placeholder="주소가 입력됩니다"></td>
							</tr>
							<tr>
								<td colspan="2"><div id="map"></div></td>
							</tr>
							<tr>
								<td>설명</td>
								<td><textarea></textarea></td>
							</tr>
						</table>
						<button class="btn btn--stripe">Location Write</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>