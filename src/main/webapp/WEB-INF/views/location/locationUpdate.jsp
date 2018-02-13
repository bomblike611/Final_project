<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/location/write.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>## 노래왕 버스킹 -Location Update페이지입니다 ##</title>

<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		var check = true;
		$(".oo").each(function() {
			if ($(this).val() == "") {
				check = false;
			}
		});
		if (check) {
			document.frm.submit();
		} else {
			alert("모든 항목을 채워주세요.");
		}
	});
	var count=0;
		$(".p").each(function(){
			if(count<4){
			count++;
			}
		});
	$("#add").click(function(){
		if(count<4){
		count++;
		$("#picture").append('<p class="p" id="'+count+'"><input type="file" name="file" class="oo"></p>');
		}else{
			alert("사진은 4개까지 등록 가능합니다.");
		}
	});
	$("#remove").click(function(){
		if(count>0){
		$(".p").each(function(){
			if($(this).attr("id")==count){
				$(this).remove();
				count--;
			}
		});
		}else{
			alert("사진 1개는 반드시 등록해야합니다.");
		}
	});
	
	$(".delete").click(function(){
		if(confirm("삭제 후 복구는 불가능합니다. 정말로 삭제하시겠습니까?")){
		var fname=$(this).attr("id");
		$.get("./fileDelete?fname="+fname,function(message){
			alert(message.trim());
		});
		
		}
	});
	
});
</script>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="writepage">
			<div id="loc_logo">
				<img src="../resources/upload/acoustic-guitar.png" style="width:100px;height: 100px;">
				<h2>Location Update</h2>
				<p>버스킹 할 수 있는 장소를 입력해주세요. 사진은 최대 4개까지 등록이 가능합니다.</p>
			</div>
			<div id="WriteForm">
				<div id="realForm">
					<form action="locationUpdate" method="post" name="frm" enctype="multipart/form-data">
					<input type="hidden" name="num" value="${view.num}">
						<table id="formdata">
							<tr>
								<td><span style="color:red;">*</span>장소명</td>
								<td><input type="text" class="oo" name="loc_name" value="${view.loc_name }"
									placeholder="장소를 입력해주세요"></td> 
							</tr>
							<tr>
								<td><span style="color:red;">*</span>주소</td>
								<td><input type="text" class="oo" name="area" placeholder="주소가 입력됩니다" readonly="readonly" value="${view.area }"></td>
							</tr>
							<tr><td><span style="color:red;">*</span>사진<p id="add">ADD</p><p id="remove">REMOVE</p></td><td id="picture">
							<c:forEach items="${files}" var="f">
							<p class="p" id="${f.fname }"><img src="../resources/upload/${f.fname}" style="width: 70px; height: 50px">${f.oname}</p><span class="delete" id="${f.fname}">X</span>
							</c:forEach>
							</td></tr>
							<tr>
								<td><span style="color: red;">*</span>최대인원</td>
								<td><input type="number" class="oo" name="entry"
									placeholder="인원수를 입력해주세요" value="${view.entry}"></td>
							</tr>
							<tr>
								<td>설명</td>
								<td><textarea name="memo">${view.memo }</textarea></td>
							</tr>
						</table>
					</form>
						<button class="btn btn--stripe" id="btn">Location Write</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>