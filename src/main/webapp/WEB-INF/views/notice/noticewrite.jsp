<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/notice/write.css"rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

	$(function() {
	 	var i=0;
	 	
	 	//전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "contents",
	        sSkinURI: "../resources/SE2/SmartEditor2Skin.html",
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
	    $("#save").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#frm").submit();
	    });

		$("#btn").click(function() {
			if(i<5){
				var ex=$("#ex").html();
				$("#result").append(ex);
				i++;
			}else{
				alert("최대 5개만 가능합니다");
			}
		});
		
		//위임이 필요하기때문에 on을 사용하여 위임해줌
		$("#result").on("click",".remove",function() {
			$(this).prev().remove();
			$(this).remove();
		});			
	});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
	<section id="main">
	
	<!--CONTAINER -->
	
	<div id="pop_wrap">
	<h2 id="pop">공지사항 글 등록</h2>
		<div class="pop_con">
			 <ul class="top_info">
				 <li>관리자용 글 등록 폐이지 입니다.</li>
			 </ul>
			
	<form action="./noticewrite" method="post" enctype="multipart/form-data" >
		<p class="input_col">작성자 : <input type="text" name="title"></p>
		<p class="input_col">제목 : <input type="text" name="writer"></p>
		<p class="input_col" >글내용  <textarea rows="" cols="" name="contents" id="contents"></textarea></p>
		<p><input type="button" value="FileAdd" id="btn" class="input_col"></p>
		<div id="result">
		</div>	
		
		<button id="save" class="input_col">글 등록</button>
	</form>
			<div id="ex">
				<input type="file" name="file"><span class="remove">X</span><br>
			</div>
		</div>
	</div>
		<!--//CONTAINER -->
	</section>
</body>
</html>