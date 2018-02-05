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
		var check = false;
		$(".job").click(function() {
			var job = $(this).val();
			if(job=='singer'){
				$(".singer").show();
				check = true;
			}else{
				$(".singer").hide();
				check = false;
			}
		});
		
		$("#pw").keyup(function() {
			if ($("#pw").val().length > 7) {
				$("#pwcheck").text("사용가능한 비밀번호 입니다");
			} else {
				$("#pwcheck").text("비밀번호는 8자리 이상이여야 합니다");
			}

		});
		$("#pw2").keyup(function() {
			if ($("#pw").val() == $("#pw2").val()) {
				$("#pwcheck2").text("비밀번호가 일치합니다");
			} else {
				$("#pwcheck2").text("비밀번호가 일치 하지 않습니다");
			}
		});
		
		$(".nextBtn").click(function() {
			if(!check){
				if ($("#id").val() && ($("#pw").val()==$("#pw2").val()) && $("#name").val() && $("#age").val() && $("#email").val() && $("#phone").val() && $("#addr").val() && $("#birth").val() && $(".job").val().length > 0) {
					frm.submit();
				} else {
					alert("필수입력사항을 입력해주세요")
				}
			}else {
				if ($("#id").val() && $("#pw").val() && $("#pw2").val() && $("#name").val() && $("#age").val() && $("#email").val() && $("#phone").val() && $("#addr").val() && $("#birth").val() && $(".job").val() && $("#teamName").val() && $("#position").val() && $("#sns").val().length >0) {
					frm.submit();
				} else {
					alert("필수입력사항을 입력해주세요")
				}
			}
		});
		
	});
</script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
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
		<form action="./memberJoin" method="post" class="joinForm" name="frm" enctype="multipart/form-data">
			<table style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<!-- 아이디 테이블 -->
				<tr class="join_tr" style="border-top: 1px #ddd solid;">
					<td class="join_td">
					<span class="sp">* </span>아이디 
					</td>
					<td>
						<input type="text" class="Join_input" placeholder="      Enter ID" id="id" name="id">
						<span id="result"></span>
					</td>
				</tr>
			
			<!-- 비밀번호 테이블-->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>비밀번호 
					</td>
					<td><input type="password" class="Join_input" placeholder="      Enter PW" id="pw" name="pw"><span id="pwcheck"></span></td>
				</tr>
				
			<!-- 비밀번호 확인 테이블 -->
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>비밀번호 확인 
					</td>
					<td><input type="password" class="Join_input" placeholder="      Enter Re PW" id="pw2"><span id="pwcheck2"></span></td>
				</tr>
				
			<!-- 이름 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>이 름 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter Name" id="name" name="name"></td>
				</tr>
				
			<!-- 나이 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>나 이 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter Age" id="age" name="age"><span style="font-size: small;">세</span></td>
				</tr>
				
			<!-- 이메일 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>이메일 
					</td>
					<td><input type="email" class="Join_input" placeholder="      Enter E-mail" id="email" name="email"></td>
				</tr>
				
			<!-- 핸드폰번호 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>핸드폰 번호 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter Phone" id="phone" name="phone"></td>
				</tr>
				
			<!-- 주소 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>주 소 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter Addr" id="addr" name="addr"></td>
				</tr>	
				
			<!-- 생년월일 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>생년월일 
					</td>
					<td><input type="date" class="Join_input" id="birth" name="birth"></td>
				</tr>
				
			<!-- 프로필사진 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>프로필 사진 
					</td>
					<td><input type="file" class="Join_input" id="profile" name="file"></td>
				</tr>
			<!-- 직업 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>직 업 
					</td>
					<td>
						&emsp;&emsp;&nbsp;일반인 <input type="radio" class="job" name="job" value="member" checked="checked">
						가   수 <input type="radio" class="job" name="job" value="singer">
					</td>
				</tr>
			<!-- 가수일경우 보여지는 테이블-->
			<!-- 팀명 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>팀 명 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter Team Name" id="teamName" name="teamName"></td>
				</tr>
				
			<!-- 본인 포지션 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>포지션 
					</td>
					<td><input type="text" class="Join_input"  placeholder="      Enter Position" id="position" name="position"></td>
				</tr>

			<!-- SNS계정 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>SNS 
					</td>
					<td><input type="text" class="Join_input" placeholder="      Enter SNS" id="sns" name="sns"></td>
				</tr>

			</table>
			<ul class="btnBox2">
				<button class="nextBtn" type="button">회원가입 완료</button>
				<button class="cancelBtn" type="button">회원가입 취소</button>		
			</ul>
	
		</form>
	</div>



</body>
</html>