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
		
		$(".btn_now").click(function(){
			cur=$(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.search.value='${page.search}';
			document.frm.kind.value='${page.kind}';
			document.frm.submit();
		});
		
		var curPage='${page.curPage}';
		$(".btn_now").each(function(){
			if($(this).attr("title")==curPage){
				$(this).css("background-color","#582D32");
				$(this).css("color","white");
			} 
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
						<form name="frm" id="searchFrm" method="post" action="./noticelist">
							<input type="hidden" name="curPage" id="currentPage" value="1">
							<input type="hidden" name="seq" id="seq">
							<input type="hidden" name="site" id="site">
						
					<div class="floatright">
					 <label>
						 <select name="kind" id="schField">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
						</select>
						<a></a>
					</label>
						 
					<label>
					<input type="text" name="search" id="schKeyword" maxlength="30" size="30" value=""/>
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
								<td>${dto.writer}</td>
								<td>
								    <c:catch>
										<c:forEach begin="1" end="${dto.depth}" var="i">
											-
										</c:forEach>
									</c:catch>
									<a href="noticeView?num=${dto.num}">${dto.title}</a>
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
<!-- Channel Plugin Scripts -->
<script>
  window.channelPluginSettings = {
    "pluginKey": "af24e61a-e247-4c8a-af5c-2a2d1eb950b5"
  };
  (function() {
    var node = document.createElement('div');
    node.id = 'ch-plugin';
    document.body.appendChild(node);
    var async_load = function() {
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    };
    if (window.attachEvent) {
      window.attachEvent('onload', async_load);
    } else {
      window.addEventListener('DOMContentLoaded', async_load, false);
    }
  })();
</script>
<!-- End Channel Plugin -->
</body>
</html>