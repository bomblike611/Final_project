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
<link href="../resources/css/common/paging.css" rel="stylesheet">
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
					<div class="full_column">
						<form name="frm" id="searchFrm" method="post">
							<input type="hidden" name="currentPage" id="currentPage" value="1">
							<input type="hidden" name="seq" id="seq">
							<input type="hidden" name="site" id="site">
						
					<div class="floatright">
					 <label>
						 <select name="schField" id="schField" onchange="this.form.keyword.focus()">
							<option value="NUM">번호</option>
							<option value="TITLE">제목</option>
						</select>
					</label>
						 
					<label>
					<input type="text" name="schKeyword" id="schKeyword" maxlength="30" size="30" value="" onfocus="this.select()" />
					</label>
					
					<label>
						<input type="submit" class="button dark small" name="button" value="검색" />
					</label>
					
					</div>
					</form>
					</div>
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
									<a href="noticeView?num=${dto.num}">${dto.writer}</a>
								</td>
								<td>${dto.reg_date}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div>
		<div id="pagination">
            <c:if test="${page.curBlock > 1}">
               <button title="${page.startNum-1}" class="page list pageing">[이전]</button>
            </c:if>
            <c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
               <button title="${i}" class="page list btn_now pageing">${i}</button>
            </c:forEach>
            <c:if test="${page.curBlock < page.totalBlock}">
               <button title="${page.lastNum+1}" class="page list pageing">[다음]</button>
            </c:if>
         </div>
	</div>
	<!-- <div id="button">
			<a href="./noticewrite">글쓰기</a>
	</div> -->
		<!-- admin 만 글쓰기 해주는 방법 -->		
		<c:if test="${member.id eq 'admin'}">
			<div id="button">
			<a href="./noticewrite">글쓰기</a>
			</div>
		</c:if>

		</div>
	</div> 
		<!--//CONTAINER -->
	</section>

</body>
</html>