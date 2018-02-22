<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 - Singer Join페이지입니다</title>
<link href="../resources/css/admin/memberList.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function memberlist() {
		location.href = "./memberList";
	}
	function singerJoin() {
		location.href = "./singerJoin";
	}
	$(function() {
		var check = false;
		$("#check").mouseover(function() {
			$("#check").html("all");
		});
		$("#check").mouseout(function() {
			$("#check").html("check");
		});

		$("#check").click(function() {
			/* 		alert(check);
			if (!check) {
				$(".checked").each(function() {
					var c = $(this).prop("checked");
					if (!c) {
						$(this).prop("checked", "true");
					}
					check = true;
				});
			}else{
				$(".checked").removeAttr("checked");
				check = false;
			} */
			if(!check){
				$(".checked").prop("checked","true");
				check=true;
			}else{
				 $('.checked').prop('checked',function(){
				        return !$(this).prop('checked');
				    });
			}
		});

	});
</script>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="loc">
			<h2>Singer Join</h2>
			<p>회원들의 정보확인과 강제탈퇴가 가능합니다.</p>
		</div>
		<ul id="ul">
			<li onclick="memberlist()">List</li>
			<li onclick="singerJoin()">singer</li>
		</ul>
		<div id="list">
		<div class="success">전체 승인</div>
		<div class="success">선택 승인</div>
			<table class="table table-bordered" id="table">
				<thead>
					<tr>
						<th class="check" id="check">check</th>
						<th>ID</th>
						<th>NAME</th>
						<th>PHONE</th>
						<th>EMAIL</th>
						<th>JOB</th>
						<th>POINT</th>
						<th class="delete" style="color: #582D32;">가입승인</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="l">
						<tr>
							<td class="check"><input type="checkbox" name="check"
								class="checked"></td>
							<td>${l.id}</td>
							<td>${l.name}</td>
							<td>${l.phone}</td>
							<td>${l.email}</td>
							<td>${l.job}</td>
							<td>${l.point}</td>
							<td class="delete">승인</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div id="pagination">
				<c:if test="${page.curBlock > 1}">
					<span class="page" title="${page.startNum-1}">[이전]</span>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<span class="page" title="${i}">${i}</span>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<span class="page" title="${page.lastNum+1}">[다음]</span>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>