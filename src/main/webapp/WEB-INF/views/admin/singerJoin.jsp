<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 - Singer Join페이지입니다</title>
<link href="../resources/css/admin/memberList.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="loc">
			<h2>Member List</h2>
			<p>회원들의 정보확인과 강제탈퇴가 가능합니다.</p>
		</div>
		<ul id="ul">
			<li>List</li>
			<li>singer</li>
		</ul>
		<div id="list">
		<table class="table table-bordered" id="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>PHONE</th>
					<th>EMAIL</th>
					<th>JOB</th>
					<th>POINT</th>
					<th class="delete" style="color:#582D32; ">가입승인</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td class="delete">승인</td>
				</tr>
				
			</tbody>
		</table>
		</div>
	</section>
</body>
</html>