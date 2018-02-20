<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="../resources/css/notice/notice.css"rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(function() {
		var message='${message}';
		if(message != ''){
			alert(message);
		}
				
		$(".page").click(function() {
			var cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.search.value='${page.search}';
			document.frm.kind.value='${page.kind}';
			document.frm.submit();
		});
	});
</script>
<title>리스트</title>

</head>

<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">

		<!--CONTAINER -->

		<div id="container">
			<h1 class="title_top">공지사항</h1>
			<div class="my_wrap">
				<div class="searchFrm">
				
					<form name="frm" action="./noticelist">
						<select id="sel" name="kind">
							<option value="title">번호</option>
							<option value="writer">제목</option>
						</select> 
						<label>
							<input type="text" name="schkeyword" id="schkeyword" maxlength="30" size="30">
						</label>
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
							<th>작성자</th>
							<th>제목</th>
							<th>작성일자</th>
						</tr>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.num}</td>
								<td>${dto.title}</td>
								<td>
								    <c:catch>
										<c:forEach begin="1" end="${dto.depth}" var="i">
											-
										</c:forEach>
									</c:catch>
									<a href="${notice}View?num=${dto.num}">${dto.writer}</a>
								</td>
								<td>${dto.reg_date}</td>
								
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
			<a href="./noticewrite">글쓰기</a>
	</div>
				
			</div>

		</div>
		<!--//CONTAINER -->
	</section>

</body>
</html>