<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/notice/notice.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
				
		$(".page").click(function() {
			var cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.search.value='${page.search}';
			document.frm.kind.value='${page.kind}';
			document.frm.submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">

		<!--CONTAINER -->

		<div id="container">
			<h1 class="title_top">가수 추천</h1>
			<div class="my_wrap">
				<div class="searchFrm">
				
					<form name="frm" action="./noticeList">
						<select id="sel" name="kind">
							<option value="title">번호</option>
							<option value="writer">제목</option>
						</select> 
							<input type="text" name="search">
							<input id="btn" type="submit" value="검색">
					</form>
				</div>

				<table class="table_list">
					<colgroup>
						<col width="8%" />
						<col width="10%" />
						<col width="auto" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>가수</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>내용</th>
							<th>등록일</th>
							<th>추천</th>
						</tr>
						<c:forEach items="${list}" var="i">
							<tr>
								<td>${i.num}</td>
								<td>${i.teamName}</td>
								<td>${i.title}</td>
								<td>${i.writer}</td>
								<td>${i.contents}</td>
								<td>${i.reg_date}</td>
								<td>${i.up}</td>
							</tr>
						</c:forEach>
					

					</tbody>
				</table>
				
				<div>
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
	<div id="button">
			<a href="./recommendWrite">글쓰기</a>
	</div>
				
			</div>

		</div>
		<!--//CONTAINER -->
	</section>
</body>
</html>