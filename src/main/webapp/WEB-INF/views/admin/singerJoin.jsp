<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 - Singer Join페이지입니다</title>
<link href="../resources/css/admin/memberList.css" rel="stylesheet">
<link href="../resources/css/common/paging.css" rel="stylesheet">
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
		$(".btn_now").click(function(){
			cur=$(this).attr("title");
			document.page.curPage.value=cur;
			document.page.submit();
		});
		
		var curPage='${page.curPage}';
		$(".btn_now").each(function(){
			if($(this).attr("title")==curPage){
				$(this).css("background-color","#582D32");
				$(this).css("color","white");
			} 
		});
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
		
		$(".delete").click(function(){
			var ids=$(this).attr("title");
			$.post("./singerUpdate",{id:ids},function(result){
				alert(result.trim());
			});
			location.reload();
		});
		
	});
	
	function allSuccess(){
		$(".checked").each(function(){
			var ids=$(this).attr("title");
			$.post("./singerUpdate",{id:ids},function(result){
				alert(result.trim());
			});
		});
		location.reload();
	}
	function choiceSuccess(){
		$(".checked").each(function(){
			var choice=$(this).prop("checked");
			if(choice){
				var ids=$(this).attr("title");
				$.post("./singerUpdate",{id:ids},function(result){
					alert(result.trim());
				});
			}
		});
		location.reload();
	}
</script>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
	<form action="./singerJoin" name="page">
	<input type="hidden" name="curPage">
	</form>
		<div id="loc">
			<h2>Singer Join</h2>
			<p>회원들의 정보확인과 강제탈퇴가 가능합니다.</p>
		</div>
		<ul id="ul">
			<li onclick="memberlist()">List</li>
			<li onclick="singerJoin()">singer</li>
		</ul>
		<div id="list">
		<div class="success" onclick="allSuccess()">전체 승인</div>
		<div class="success" onclick="choiceSuccess()">선택 승인</div>
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
								class="checked" title="${l.id}"></td>
							<td>${l.id}</td>
							<td>${l.name}</td>
							<td>${l.phone}</td>
							<td>${l.email}</td>
							<td>${l.job}</td>
							<td>${l.point}</td>
							<td class="delete" title="${l.id}">승인</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div id="pagination">
				<c:if test="${page.curBlock > 1}">
					<button title="${page.startNum-1}" class="page list pageing">＜</button>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<button title="${i}" class="page list btn_now pageing">${i}</button>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<button title="${page.lastNum+1}" class="page list pageing">＞</button>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>