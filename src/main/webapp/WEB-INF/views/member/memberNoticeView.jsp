<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	$("#update").click(function() {
		window.location = '/busk/notice/Update?num=${view.num}';
	});
	
	$("#delete").click(function() {
		window.location = '/busk/notice/Delete?num=${view.num}';
	});
});
</script>
</head>
<body>
		<%@include file="../temp/header.jsp"%>
	<div class="join_agree"">
		<h2 class="tit_bk_left pt30">My Notice View</h2>
		<table class="memberNoticeList_table" style="border-collapse: collapse; margin-top: 5%;">
		
			<tr>
				<td id="memberNotice_title" class="memberNotice_tr" style="border: 1px solid #ddd;">제 목</td>
				<td id="memberNotice_title" style="border: 1px solid #ddd; text-align: left;">${view.title}</td>
			</tr>
			<tr>
				<td id="memberNotice_checkbox" class="memberNotice_tr" style="border: 1px solid #ddd;">내 용</td>
				<td id="memberNotice_title" style="border: 1px solid #ddd; text-align: left;">${view.contents}</td>
			</tr>
			
			<tr>
				<td id="memberNotice_reg_date" class="memberNotice_tr" style="border: 1px solid #ddd;">날 짜</td>
				<td id="memberNotice_reg_date" style="border: 1px solid #ddd;">${view.reg_date}</td>
			</tr>
			
			<tr>
				<td id="memberNotice_writer" class="memberNotice_tr" style="border: 1px solid #ddd;">글쓴이</td>
				<td id="memberNotice_writer" style="border: 1px solid #ddd;">${view.writer}</td>
			</tr>
		</table>	
		<input type="button" value="Update" id="update" class="memberNoticeUpdate">
		<input type="button" value="Delete" id="delete" class="memberNoticeDelete">
	</div>
		<%@include file="../temp/footer.jsp"%>
</body>
</html>
