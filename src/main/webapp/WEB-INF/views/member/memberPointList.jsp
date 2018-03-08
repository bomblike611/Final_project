<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE htmlS>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(내 포인트 내역)입니다</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
</head>
<body>
	<%@include file="../temp/header.jsp"%>

	<div class="join_agree">
		<h2 class="tit_bk_left pt30">My Point</h2>
		<table class="memberNoticeList_table" style="border-collapse: collapse; margin-top: 5%;">
			<tr class="memberNotice_tr">
				<td id="memberNotice_num" style="border: 1px solid #ddd;">아이디</td>
				<td id="memberNotice_title" style="border: 1px solid #ddd;">포인트 내용</td>
				<td id="memberNotice_reg_date" style="border: 1px solid #ddd;">날 짜</td>
				<td id="memberNotice_writer" style="border: 1px solid #ddd;">잔여 포인트</td>
			</tr>
			<c:catch>
			<c:forEach items="${list}" var="point" varStatus="j">
				<c:if test="${j.index lt 5 }">
				<tr class="memberNotice_tr2">
					<td id="memberNotice_num" style="border: 1px solid #ddd;">${point.id}</td>
					<td id="memberNotice_title" style="border: 1px solid #ddd; text-align: left;">${point.reason}</td>
					<td id="memberNotice_reg_date" style="border: 1px solid #ddd;">${point.use_date}</td>
					<td id="memberNotice_writer" style="border: 1px solid #ddd;">${point.use_point}</td>
				</tr>
				</c:if>
			</c:forEach>
			</c:catch>
		</table>
		<div id="pagination">
			<c:if test="${page.curBlock > 1}">
				<span title="${page.startNum-1}" class="page list pageing">[이전]</span>
			</c:if>
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<span title="${i}" class="page list btn_now pageing">${i}</span>
			</c:forEach>
			<c:if test="${page.curBlock < page.totalBlock}">
				<span title="${page.lastNum+1}" class="page list pageing">[다음]</span>
			</c:if>
		</div>
	</div>
		<%@include file="../temp/footer.jsp"%>
</body>
</html>