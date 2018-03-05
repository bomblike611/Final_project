<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(마이페이지)입니다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	$(".update").click(function() {
		window.location = '/busk/member/memberMyPage';
	});
	
	$(".add").click(function() {
		window.location = '/busk/member/memberNoticeList';
	});
	
	$(".add1").click(function() {
		window.location = '/busk/member/memberSponList';
	});
	
	$(".add2").click(function() {
		window.location = '/busk/member/memberPointList';
	});
});
</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>

	<div class="join_agree">
		<h2 class="tit_bk_left pt30">회원정보</h2>
		
	<div class="mypage">
		<h5 class="inpo">노래왕 버스킹 프로필</h5>
		<div><img id="poto2" src="../resources/upload/${member.fname}" style="width: 100px; 
		height: 100px; border-radius: 50%; margin-left: 5%; margin-top: 3%;">
		<table class="memberinfo">
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">이름</td>
				<td>${member.name}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">아이디</td>
				<td>${member.id}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">나이</td>
				<td>${member.age}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">생년월일</td>
				<td>${member.birth}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">이메일</td>
				<td>${member.email}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">핸드폰번호</td>
				<td>${member.phone}</td>
			</tr>
			
			<tr>
				<td style="width: 55%;" class="memberinfo_td1">직업</td>
				<td>${member.job}</td>
			</tr>
		</table>
		</div>
		<input type="button" value="수정" class="update">  
	</div>	
	
	<div class="mypage1">
		<h5 class="inpo">노래왕 버스킹 게시한 글 보기</h5>
		<table class="memberNotice">
			<tr class="coll">
				<td class="noticeNum">글 번호</td>
				<td class="noticeTitle">제 목</td>
				<td class="noticeReg_date">날 짜</td>
				<td class="noticeId">글쓴이</td>
			</tr>
			
			<c:catch>
			<c:forEach items="${list}" var="notice" varStatus="j">
				<c:if test="${notice.writer eq member.id}">
				<c:if test="${j.index lt 3 }">
			<tr>
				<td class="noticeNum" style="background-color: white; color: black;">${notice.num}</td>
				<td class="noticeTitle" style="background-color: white; color: black;"><a href="memberNoticeView?num=${notice.num}" id="noticemember">${notice.title}</a></td>
				<td class="noticeReg_date" style="background-color: white; color: black;">${notice.reg_date}</td>
				<td class="noticeId" style="background-color: white; color: black;">${member.name}</td>
			</tr>
				
				</c:if>
				</c:if>
			</c:forEach>
			</c:catch>
			
		</table>
		<input type="button" value="더보기" class="add">  
	</div>
	
	<div class="mypage2">
		<h5 class="inpo">노래왕 버스킹 후원목록</h5>
				<table class="memberNotice">
			<tr class="coll">
				<td class="noticeNum">Name</td>
				<td class="noticeTitle">TeamName</td>
				<td class="noticeReg_date">Price</td>
				<td class="noticeId">Message</td>
			</tr>
			
			<c:catch>
			<c:forEach items="${sponList}" var="spon" varStatus="j">
				<c:if test="${j.index lt 3 }">
			<tr>
				<td class="noticeNum" style="background-color: white; color: black;">${member.name}</td>
				<td class="noticeTitle" style="background-color: white; color: black;">${spon.teamName}</td>
				<td class="noticeReg_date" style="background-color: white; color: black;">${spon.price}</td>
				<td class="noticeId" style="background-color: white; color: black;">${spon.message}</td>
			</tr>
				</c:if>
			</c:forEach>
			</c:catch>
			
		</table>
		<input type="button" value="더보기" class="add add1" style="margin-top: 10%;">  
	</div>
	
	<div class="mypage3">
		<h5 class="inpo">노래왕 버스킹 포인트내역 확인</h5>
				<table class="memberNotice">
			<tr class="coll">
				<td class="noticeNum">Name</td>
				<td class="noticeTitle">USE_DATE</td>
				<td class="noticeReg_date">REASON</td>
				<td class="noticeId">USE_POINT</td>
			</tr>
			
			<c:catch>
			<c:forEach items="${pointList}" var="point" varStatus="j">
				<c:if test="${j.index lt 3 }">
			<tr>
				<td class="noticeNum" style="background-color: white; color: black;">${member.name}</td>
				<td class="noticeTitle" style="background-color: white; color: black;">${point.use_date}</td>
				<td class="noticeReg_date" style="background-color: white; color: black;">${point.reason}</td>
				<td class="noticeId" style="background-color: white; color: black;">${point.use_point}</td>
			</tr>
				</c:if>
			</c:forEach>
			</c:catch>
			
		</table>
		<input type="button" value="더보기" class="add add2" style="margin-top: 10%;">  
	</div>	
	</div>
	<%@include file="../temp/footer.jsp"%>





</body>
</html>