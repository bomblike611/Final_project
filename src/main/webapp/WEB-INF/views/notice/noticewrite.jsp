<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/notice/write.css"rel="stylesheet">
<link href="../resources/css/busk/buskWrite.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

	$(function() {
		
		var count = 0;
		$("#add")
				.click(
						function() {
							if (count < 3) {
								count++;
								$("#picture").append('<p class="p" id="'+count+'"><input type="file" name="file" class="oo"></p>');
							} else {
								alert("사진은 4개까지 등록 가능합니다.");
							}
						});
		$("#remove").click(function() {
			if (count > 0) {
				$(".p").each(function() {
					if ($(this).attr("id") == count) {
						$(this).remove();
						count--;
					}
				});
			} else {
				alert("사진 1개는 반드시 등록해야합니다.");
			}
		});
		
	 	var i=0;
	 	
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
			
			
			//폼 submit
			
				if($(".val").val()!=""){
					document.frm.submit();
				}else{
					alert("빈 칸을 채워 주세요.");
				}
			
		});

		
	});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(Write)입니다</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="WritePage">
			<div id="loc">
				<h2>Notice Write</h2>
				<p>관리자 전용 공지 추가 폐이지 입니다.</p>
			</div>
			<form action="./noticewrite" name="frm" method="post"
				enctype="multipart/form-data">
				
				<table>
					<tr>
						<th><span style="color: red;">*</span>작성자</th>
						<td><input type="text" name="title" class="val" placeholder="작성자" value="${member.id}" readonly="readonly"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>제목</th>
						<td><input type="text" name="writer" class="val" placeholder="제목"></td>
					</tr>
					
					<tr>
								<th><span style="color: red;">*</span>사진
									<p id="add">추가</p>
									<p id="remove">삭제</p>
								</th>
								<td id="picture">
								<p class="p"><input type="file" name="file" class="val"></p></td>
							</tr>
					
				
					
					<tr>
						<th colspan="2"><span style="color: red;">*</span>글내용</th>
					</tr>
					<tr>
						<th colspan="2"><textarea name="contents" id="contents" ></textarea></th>
					</tr>
				</table>
				
			</form>
			<button class="btn btn--stripe" id="btn">Busking Write</button>
		</div>
	</section>
</body>
</html>