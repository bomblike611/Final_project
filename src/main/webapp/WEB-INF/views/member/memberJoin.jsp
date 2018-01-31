<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".job").click(function() {
			var job = $(this).val();
			if(job=='singer'){
				$(".singer").show();
			}else{
				$(".singer").hide();
			}
		});
	});
</script>
<link href="/busk/resources/css/member.css" " rel="stylesheet">
</head>
<body>
<%@include file="../temp/header.jsp"%>

	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">JOIN</h2>
		<div class="join_wrapper">
			<ul class="stepGuide">
				<li class="stepGuide_off"><p>1</p> <span style="color: gray;">약관동의</span></li>
				<li class="stepGuide_on"><p id="a">2</p> <span id="a2">회원정보
						입력</span></li>
				<li><p>3</p> <span style="color: gray;">회원가입 완료</span></li>
			</ul>
		</div>
		
		<span style="float: right;"><span class="sp">* </span>는 필수사항 입니다</span>
		<form action="member/memberJoin", method="post">
			<table style="border: solid 1px; width: 100%; ">
			<!-- 아이디 테이블 -->
				<tr class="join_td">
					<td>
					<input type="hidden" name="idCheck" value="0" >
					<span class="sp">* </span>아이디 :
					</td>
					<td>
						<input type="text">
						<input type="button" id="check" value="중복확인" class="btn btn-default">
					</td>
				</tr>
			
			<!-- 비밀번호 테이블-->	
				<tr>
					<td>
					<span class="sp">* </span>비밀번호 :
					</td>
					<td><input type="password"><p id="pwcheck"></p></td>
				</tr>
				
			<!-- 비밀번호 확인 테이블 -->
				<tr>
					<td>
					<span class="sp">* </span>비밀번호 확인 :
					</td>
					<td><input type="password"><p id="pwcheck2"></p></td>
				</tr>
				
			<!-- 이름 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>이 름 :
					</td>
					<td><input type="text"></td>
				</tr>
				
			<!-- 이름 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>나 이 :
					</td>
					<td><input type="text">세</td>
				</tr>
				
			<!-- 이메일 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>이메일 :
					</td>
					<td><input type="email"></td>
				</tr>
				
			<!-- 핸드폰번호 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>핸드폰 번호 :
					</td>
					<td><input type="text"></td>
				</tr>
				
			<!-- 주소 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>주 소 :
					</td>
					<td><input type="text"></td>
				</tr>	
				
			<!-- 생년월일 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>생년월일 :
					</td>
					<td><input type="date"></td>
				</tr>
				
			<!-- 직업 테이블 -->	
				<tr>
					<td>
					<span class="sp">* </span>직 업 :
					</td>
					<td>
						일반인 <input type="radio" class="job" name="job" value="member" checked="checked">
						가   수 <input type="radio" class="job" name="job" value="singer">
					</td>
				</tr>
			<!-- 가수일경우 보여지는 테이블-->
			<!-- 팀명 테이블 -->	
				<tr class="singer">
					<td>
					<span class="sp">* </span>팀 명 :
					</td>
					<td><input type="text"></td>
				</tr>
				
			<!-- 본인 포지션 테이블 -->	
				<tr class="singer">
					<td>
					<span class="sp">* </span>포지션 :
					</td>
					<td><input type="text"></td>
				</tr>
				
			<!-- 프로필사진 테이블 -->	
				<tr class="singer">
					<td>
					<span class="sp">* </span>프로필 사진 :
					</td>
					<td><input type="file"></td>
				</tr>

			<!-- SNS계정 테이블 -->	
				<tr class="singer">
					<td>
					<span class="sp">* </span>SNS :
					</td>
					<td><input type="text"></td>
				</tr>
			</table>
			<button>회원가입</button>		
		</form>
		<button>회원가입 취소</button>
	</div>





</body>
</html>