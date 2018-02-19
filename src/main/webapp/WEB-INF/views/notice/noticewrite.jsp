<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="../resources/css/notice/write.css"rel="stylesheet">
	 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	
<script type="text/javascript">
	$(function() {
	 	var i=0;
	 	/*$("#btn").click(function() {
			if(i<5){
				$("#result").append('<input type="file" name="file'+i+'"><span class="remove">X</span><br>');
				i++;
			}else{
				alert("최대 5개만 가능합니다");
			}
		}); */

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
	<h1>테스트</h1>
	<form action="./noticewrite" method="POST" enctype="multipart/form-data" >
		<p>Title : <input type="text" name="title"></p>
		<p>Writer : <input type="text" name="writer"></p>
		<p>contents : <textarea rows="" cols="" name="contents"></textarea></p>
		<p><input type="button" value="FileAdd" id="btn"></p>
		<div id="result">
		</div>	
		
		<button>Write</button>
	</form>
			<div id="ex">
				<input type="file" name="file"><span class="remove">X</span><br>
			</div>
			</section>
</body>
</html>