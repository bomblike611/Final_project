<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(회원가입)입니다</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		
		$(".nextBtn").click(function(FormSubmit){
			if(!check){
					if ($("#id").val() && 
						($("#pw").val()==$("#pw2").val()) && 
						$("#name").val() && 
						$("#age").val() && 
						$("#email").val() && 
						$("#phone").val().length && 
						$("#addr").val().length && 
						$("#birth").val().length && 
						$(".job").val().length > 0) {
					if (grecaptcha.getResponse() == ""){ 
						alert("자동가입 방지를 위해 체크를 하세요");
						} else { 
						frm.submit();
						}
						} else {
							alert("필수입력사항을 입력해주세요")
						}
					} else {
						if ($("#id").val() && $("#pw").val() && $("#pw2").val()
								&& $("#name").val() && $("#age").val()
								&& $("#email").val() && $("#phone").val()
								&& $("#addr").val() && $("#birth").val()
								&& $(".job").val() && $("#teamName").val()
								&& $("#position").val()
								&& $("#sns").val().length > 0) {
							if (grecaptcha.getResponse() == ""){ 
								alert("리캡챠를 체크해야 합니다.");
								} else { 
							frm.submit();
								frm.submit();
								}
						} else {
							alert("필수입력사항을 입력해주세요")
						}
					}
			});

		$(".addrSearch")
				.click(
						function() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 도로명 조합형 주소 변수

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}
											// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
											if (fullRoadAddr !== '') {
												fullRoadAddr += extraRoadAddr;
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											$('#postcode').val(data.zonecode); //5자리 새우편번호 사용
											$('#roadAddress').val(fullRoadAddr);
											window.self.close();

										}
									}).open();
						});
		$("#profile").on('change', function() {
			readURL(this);
		});
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#poto').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".cancelBtn").click(function() {
			window.location = '../';
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

		<span style="float: right;"><span class="sp">* </span>는 필수사항
			입니다</span>
		<form action="./memberJoin" method="post" class="joinForm" name="frm"
			enctype="multipart/form-data" onsubmit="return FormSubmit();">
			<table
				style="width: 100%; border-collapse: collapse; border-spacing: 0;">
				<!-- 아이디 테이블 -->
				<tr class="join_tr" style="border-top: 1px #ddd solid;">
					<td class="join_td"><span class="sp">* </span>아이디</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter ID" id="id" name="id"> <span
						id="result"></span></td>
				</tr>

				<!-- 비밀번호 테이블-->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>비밀번호</td>
					<td><input type="password" class="Join_input"
						placeholder="      Enter PW" id="pw" name="pw"><span
						id="pwcheck"></span></td>
				</tr>

				<!-- 비밀번호 확인 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>비밀번호 확인</td>
					<td><input type="password" class="Join_input"
						placeholder="      Enter Re PW" id="pw2"><span
						id="pwcheck2"></span></td>
				</tr>

				<!-- 이름 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>이 름</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter Name" id="name" name="name"></td>
				</tr>

				<!-- 나이 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>나 이</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter Age" id="age" name="age"><span
						style="font-size: small;">세</span></td>
				</tr>

				<!-- 이메일 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>이메일</td>
					<td><input type="email" class="Join_input"
						placeholder="      Enter E-mail" id="email" name="email"></td>
				</tr>

				<!-- 핸드폰번호 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>핸드폰 번호</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter Phone" id="phone" name="phone"></td>
				</tr>

				<!-- 주소 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>주 소</td>
					<td><input type="text" class="Join_input addrSearch"
						placeholder="      우편번호" id="postcode" name="addr"
						readonly="readonly" style="margin-bottom: 5px;">
					<button type="button" class="addrSearch" id="addrSearch" style="">주소찾기</button>
						<br> <input type="text" class="Join_input addrSearch"
						placeholder="      기본주소" id="roadAddress" name="addr"
						readonly="readonly" style="width: 35%"><br> <input
						type="text" class="Join_input" placeholder="      나머지주소" id="addr"
						name="addr" style="width: 35%; margin-top: 5px;"></td>
				</tr>

				<!-- 생년월일 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>생년월일</td>
					<td><input type="date" class="Join_input" id="birth"
						name="birth"></td>
				</tr>

				<!-- 프로필사진 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>프로필 사진</td>
					<td>&emsp;&emsp;&nbsp;<img id="poto"
						src="../resources/upload/${member.fname}"
						style="width: 100px; height: 100px;">
						
						<div class="filebox">
						<label for="profile">업로드</label> 
						<input type="file" id="profile" name="file">
						</div>
						
						</td>
				</tr>
				<!-- 직업 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>직 업</td>
					<td>&emsp;&emsp;&nbsp;일반인 <input type="radio" class="job"
						name="job" value="member" checked="checked"> 가 수 <input
						type="radio" class="job" name="job" value="singer">
					</td>
				</tr>
				<!-- 가수일경우 보여지는 테이블-->
				<!-- 팀명 테이블 -->
				<tr class="singer">
					<td class="join_td"><span class="sp">* </span>팀 명</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter Team Name" id="teamName" name="teamName"></td>
				</tr>

				<!-- 본인 포지션 테이블 -->
				<tr class="singer">
					<td class="join_td"><span class="sp">* </span>포지션</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter Position" id="position" name="position"></td>
				</tr>

				<!-- SNS계정 테이블 -->
				<tr class="singer">
					<td class="join_td"><span class="sp">* </span>SNS</td>
					<td><input type="text" class="Join_input"
						placeholder="      Enter SNS" id="sns" name="sns"></td>
				</tr>
					<!-- 자동가입 방지 테이블 -->
				<tr class="join_tr">
					<td class="join_td"><span class="sp">* </span>자동가입 방지</td>
					<td><div class="g-recaptcha" data-sitekey="6Lcp-EQUAAAAAJa_e5mTOGz2tgsZ484HZKEPc3vz"></div>
					</td>
				</tr>
			</table>
			<ul class="btnBox2">
				<input class="nextBtn" type="button" value="회원가입 완료">
				<input class="cancelBtn" type="button" value="회원가입 취소">
			</ul>
		</form>
	</div>



</body>
</html>