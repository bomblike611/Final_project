<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -Member List페이지입니다</title>
<link href="../resources/css/admin/memberList.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<script type="text/javascript">
	function memberlist() {
		location.href = "./memberList";
	}
	function singerJoin() {
		location.href = "./singerJoin";
	}
	$(function() {
		//스마트에디터
			//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#btn").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			$(".checked").each(function(){
				var choice=$(this).prop("checked");
				if(choice){
					var emails=$(this).attr("id");
					$("#tt").append('<input type="hidden" name="email" value="'+emails+'">')
				}
			});
			document.frm.submit();
			$("#myModal").css("display","none");
		});
		
		//////////////////////////////
		
		
		var check = false;
		$("#check").mouseover(function() {
			$("#check").html("all");
		});
		$("#check").mouseout(function() {
			$("#check").html("check");
		});

		$("#check").click(function() {
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
			$.post("./adminDelete",{id:ids},function(result){
				alert(result.trim());
			});
			location.reload();
		});
		
		$(".close").click(function(){
			$("#myModal").css("display","none");
		});
		
	});
	
	function allSuccess(){
		$(".checked").each(function(){
			var ids=$(this).attr("title");
			$.post("./adminDelete",{id:ids},function(result){
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
				$.post("./adminDelete",{id:ids},function(result){
					alert(result.trim());
				});
			}
		});
		location.reload();
	}
	function mailSendArea(){
		$("#myModal").css("display","block");
		
	}
	function mailSend(){
		var s=$("#contents").val();
		alert(s);
		$(".checked").each(function(){
			var choice=$(this).prop("checked");
			if(choice){
				var emails=$(this).attr("id");
				/* $.post("./mailSender",{email:emails},function(result){
					alert(result.trim());
				}); */
			}
		});
	}
</script>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="loc">
			<h2>Member List</h2>
			<p>회원들의 정보확인과 강제탈퇴가 가능합니다.</p>
		</div>
		<ul id="ul">
			<li onclick="memberlist()">List</li>
			<li onclick="singerJoin()">singer</li>
		</ul>
		<div id="list">
			<div class="success" >전체 메세지전송</div>
			<div class="success" onclick="mailSendArea()" >선택 메세지전송</div>
			<div class="success" onclick="choiceSuccess()">선택 탈퇴</div>
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
						<th class="delete" style="color: #582D32;">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="l">
						<tr>
							<td class="check"><input type="checkbox" name="check"
								class="checked" title="${l.id}" id="${l.email }"></td>
							<td>${l.id}</td>
							<td>${l.name}</td>
							<td>${l.phone}</td>
							<td>${l.email}</td>
							<td>${l.job}</td>
							<td>${l.point}</td>
							<td class="delete" title="${l.id}">X</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagination">
				<c:if test="${page.curBlock > 1}">
					<span class="page" title="${page.startNum-1}" class="list pageing">[이전]</span>
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<span class="page" title="${i}" class="list btn_now pageing">${i}</span>
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<span class="page" title="${page.lastNum+1}" class="list pageing">[다음]</span>
				</c:if>
			</div>
		</div>
		
		<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>노래왕 버스킹 메일</h2>
    </div>
    <div class="modal-body">
    	<form action="./mailSender" name="frm" id="tt" enctype="multipart/form-data">
    	<input type="text" name="subject" placeholder="제목을 입력해주세요.">
      <textarea name="body" id="contents" style="width: 80%; height: 600px;"></textarea>
      <div class="success" id="btn">Mail Send</div>
      </form>
    </div>
  </div>

</div>
		
	</section>
</body>
</html>