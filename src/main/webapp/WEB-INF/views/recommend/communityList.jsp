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
<link href="../resources/css/recommend/commnuityList.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시 리스트</title>

</head>

<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">

		<!--CONTAINER -->

		<div id="container">
			<h1 class="title_top">공지사항</h1>
			<div class="my_wrap">

				<!--  <ul class="tabNavi tab5">
		<li class="active"><a href="../resources/front/customer/getNoticeList.do"><span class="doc_i"></span>공지사항</a></li>
		<li class="review"><a href="../resources/front/customer/getNoticeList.do"><span class="doc_i"></span>후기자료실</a></li>
		<li class="review"><a href="../resources/front/customer/getNoticeList.do"><span class="doc_i"></span>가수추천</a></li>
	</ul> -->

				<div class="full_column">
					<form name="searchFrm" id="searchFrm" method="post"
						action="/front/customer/getNoticeList.do">
						<input type="hidden" name="currentPage" id="currentPage" value="1">
						<input type="hidden" name="seq" id="seq"> <input
							type="hidden" name="site" id="site" value="">
						<div class="floatright">
							<label> <select name="schField" id="schField"
								style="width: 110px; display: none;"
								onchange="this.form.keyword.focus()" class="selectBox">
									<option value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
							</select><a class="selectBox selectBox-dropdown" title="" tabindex="NaN"
								style="width: 110px; display: inline-block;"><span
									class="selectBox-label" style="width: 70px;">제목</span> <span
									class="selectBox-arrow"></span></a>
							</label> <label> <input type="text" name="schKeyword"
								id="schKeyword" maxlength="30" size="30" value=""
								onfocus="this.select()">
							</label> <label> <input type="submit" class="button dark small"
								name="button" value="검색">
							</label>
						</div>
						<div class="clearfix"></div>
					</form>
				</div>


				<table class="table_list" border="1">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="auto">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
							<td class="title"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
							
						
					</tbody>
				</table>
				<div class="seperater"></div>

				<!-- paging area STD -->

				<div class="pageNavi">
					<!-- First -->
					<a href="javascript:;" class="latelypostslink"
						onclick="frontPageSubmit(1);">&lt;&lt;</a>

					<!-- Prev 10 -->

					<a href="javascript:;" onclick="frontPageSubmit(1);">&lt;</a>



					<!-- Numbering -->
                        <span class="current">1</span> 
						<a href="javascript:;" onclick="frontPageSubmit(2);">2</a> 
						<a href="javascript:;" onclick="frontPageSubmit(3);">3</a> 
						<a href="javascript:;" onclick="frontPageSubmit(4);">4</a> 
						<a href="javascript:;" onclick="frontPageSubmit(5);">5</a> 
						<a href="javascript:;" onclick="frontPageSubmit(6);">6</a> 
						<a href="javascript:;" onclick="frontPageSubmit(7);">7</a> 
						<a href="javascript:;" onclick="frontPageSubmit(8);">8</a> 
						<a href="javascript:;" onclick="frontPageSubmit(9);">9</a> 
						<a href="javascript:;" onclick="frontPageSubmit(10);">10</a>



					<!-- Next 10 -->

					<a href="javascript:;" class="firstpostslink"
						onclick="frontPageSubmit(10);">&gt;</a>



					<!-- Last -->
					<a href="javascript:;" class="nextpostslink"
						onclick="frontPageSubmit(10);">&gt;&gt;</a>
				</div>
			<!-- paging area END -->
			<div class="seperater"></div>	
			</div>

			

		</div>
		<!--//CONTAINER -->
	</section>

</body>
</html>