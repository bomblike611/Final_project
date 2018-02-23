<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(마이페이지)입니다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
		if ($("#pw").val()=="FaceBook") {
			$(".pw_FaceBook").hide();
		}
		
		$("label").click(function() {
			$("#fu").html("<input type='file' id='profile' name='file'>");
		});	
		
		$("#pw2").keyup(function() {
			if ($("#pw").val() == $("#pw2").val()) {
				$("#pwcheck").text("비밀번호가 일치합니다.");
				$("#pwcheck").css("color", "green");
			}else{
				$("#pwcheck").text("비밀번호가 일치하지 않습니다");
				$("#pwcheck").css("color", "red");
			}
		});		
		
		$("#cpw").keyup(function() {
			if ($("#cpw").val().length > 7) {
				$("#cpwcheck").text("사용가능한 비밀번호 입니다");
				$("#cpwcheck").css("color", "green");
			} else {
				$("#cpwcheck").text("비밀번호는 8자리 이상이여야 합니다");
				$("#cpwcheck").css("color", "red");
			}
		});
		
		$("#cpw2").keyup(function() {
			if ($("#cpw").val() == $("#cpw2").val()) {
				$("#cpwcheck2").text("비밀번호가 일치합니다.");
				$("#cpwcheck2").css("color", "green");
			}else{
				$("#cpwcheck2").text("비밀번호가 일치하지 않습니다.");
				$("#cpwcheck2").css("color", "red");
			}
		});
		
		
		var job = "${member.job}";
		if(job=="singer"){
			$(".singer").show();
		}
		$(".filebox").on('change',"#profile", function(){
			
			readURL(this);
		});
		
		 function readURL(input) {
	            if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                    $('#poto').attr('src', e.target.result);
	                }

	              reader.readAsDataURL(input.files[0]);
	            }
	        }
		 $(".addrSearch").click(function(){
	         new daum.Postcode({
	               oncomplete: function(data) {
	                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                       extraRoadAddr += data.bname;
	                   }
	                   // 건물명이 있고, 공동주택일 경우 추가한다.
	                   if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                   }
	                   // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                   if(extraRoadAddr !== ''){
	                       extraRoadAddr = ' (' + extraRoadAddr + ')';
	                   }
	                   // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                   if(fullRoadAddr !== ''){
	                       fullRoadAddr += extraRoadAddr;
	                   }

	                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                   $('#postcode').val(data.zonecode); //5자리 새우편번호 사용
	                   $('#roadAddress').val(fullRoadAddr);
	                   window.self.close();

	               }
	           }).open();
	      });
		 $(".cancelBtn").click(function(){
	         $("#myModal").css("display","block");
	      });
	      $(".close").click(function(){
	         $("#myModal").css("display","none");
	      });
	      
	      $("#pwCheck2").keyup(function() {
	    	  var pwcheck = $("#pwCheck").val();
	    	  var pwcheck2 = $("#pwCheck2").val();
				if (pwcheck==pwcheck2) {
					$("#pwcheck3").text("비밀번호가 일치합니다");
					$("#pwcheck3").css({"color": "green","font-size":"x-small"});
				} else {
					$("#pwcheck3").text("비밀번호가 일치 하지 않습니다");
					$("#pwcheck3").css({"color": "red","font-size":"x-small"});
				}
			});
	      
	  	$(".cancelBtnOK").click(function(){
			if($("#pwCheck2").val()==$("#pwCheck").val()){
				frm2.submit();
				
			}else if($("#pwCheck2").val()==""){
				alert("비밀번호를 입력해주세요");
				
			}else if($("#pwCheck2").val() != $("#pwCheck").val()){
				alert("비밀번호가 틀렸습니다");
			}
				
		});
	  	
	  	$("#btnn").click(function() {
			alert("${member.fname}");
			alert($("#profile").val());
		});

	});

</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">My Page</h2>
		<span style="float: right;"><span class="sp">* </span>는 필수사항 입니다</span>
		<form action="./memberUpdate" method="post" class="joinForm" name="frm" enctype="multipart/form-data">
			<table style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<!-- 아이디 테이블 -->
				<tr class="join_tr" style="border-top: 1px #ddd solid;">
					<td class="join_td">
					<span class="sp">* </span>아이디 
					</td>
					<td>
						&emsp;&emsp;&nbsp;${member.id}<input type="hidden" value="${member.id}" name="id">
						<span id="result"></span>
					</td>
				</tr>
			
			<!-- 비밀번호 테이블-->	
				<tr class="join_tr pw_FaceBook">
					<td class="join_td">
					<span class="sp">* </span>기존 비밀번호 
					</td>
					<td>
					<input type="hidden" value="${member.pw}" id="pw">
					<input type="password" class="Join_input" id="pw2" ><span id="pwcheck"></span>
					</td>
				</tr>
				
			<!-- 변경비밀번호 테이블 -->
				<tr class="join_tr pw_FaceBook">
					<td class="join_td">
					<span class="sp">* </span>변경 비밀번호
					</td>
					<td><input type="password" class="Join_input" placeholder="      Enter Re PW" id="cpw" name="pw"><span id="cpwcheck"></span></td>
				</tr>
				
				<!-- 변경비밀번호  확인 테이블 -->
				<tr class="join_tr pw_FaceBook">
					<td class="join_td">
					<span class="sp">* </span>변경 비밀번호 확인
					</td>
					<td><input type="password" class="Join_input" placeholder="      Enter Re PW" id="cpw2"><span id="cpwcheck2"></span></td>
				</tr>
					
			<!-- 이름 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>이 름 
					</td>
					<td><input type="text" class="Join_input" value="${member.name}" id="name" name="name"></td>
				</tr>
				
			<!-- 나이 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>나 이 
					</td>
					<td><input type="text" class="Join_input" value="${member.age}" id="age" name="age"><span style="font-size: small;">세</span></td>
				</tr>
				
			<!-- 이메일 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>이메일 
					</td>
					<td><input type="email" class="Join_input" value="${member.email}" id="email" name="email"></td>
				</tr>
				
			<!-- 핸드폰번호 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>핸드폰 번호 
					</td>
					<td><input type="text" class="Join_input" value="${member.phone}" id="phone" name="phone"></td>
				</tr>
				
			<!-- 주소 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>주 소 
					</td>
					<td>
						<input type="text" class="Join_input addrSearch" value="${addar[0]}" placeholder="      우편번호" id="postcode" name="addr" readonly="readonly" style="margin-bottom: 5px;"><button type="button" class="addrSearch" id="addrSearch" style="">주소찾기</button><br>
						<input type="text" class="Join_input addrSearch" value="${addar[1]}" placeholder="      기본주소" id="roadAddress" name="addr" readonly="readonly" style="width: 35%"><br>
						<input type="text" class="Join_input" value="${addar[2]}" placeholder="      나머지주소" id="addr" name="addr" style="width: 35%; margin-top: 5px;">
					</td>
				</tr>	
				
			<!-- 생년월일 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>생년월일 
					</td>
					<td><input type="date" class="Join_input" id="birth" name="birth" value="${member.birth}"></td>
				</tr>
				
			<!-- 프로필사진 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>프로필 사진 
					</td>
					<td>&emsp;&emsp;&nbsp;<img id="poto" src="../resources/upload/${member.fname}" style="width: 100px; height: 100px;">
					<div class="filebox">
						<label for="profile">업로드</label> 
						<div id="fu">
						<input type="hidden" value="${member.oname}">
						</div>
						</div>
					</td>
				</tr>
			<!-- 직업 테이블 -->	
				<tr class="join_tr">
					<td class="join_td">
					<span class="sp">* </span>직 업 
					</td>
					<td>
						&emsp;&emsp;&nbsp;${member.job}<input type="hidden" value="${member.job}" name="job">
					</td>
				</tr>
				
			<!-- 가수일경우 보여지는 테이블-->
			<!-- 팀명 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>팀 명 
					</td>
					<td><input type="text" class="Join_input" value="${member.teamName}" id="teamName" name="teamName"></td>
				</tr>
				
			<!-- 본인 포지션 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>포지션 
					</td>
					<td><input type="text" class="Join_input"  value="${member.position}" id="position" name="position"></td>
				</tr>

			<!-- SNS계정 테이블 -->	
				<tr class="singer">
					<td class="join_td">
					<span class="sp">* </span>SNS 
					</td>
					<td><input type="text" class="Join_input" value="${member.sns}" id="sns" name="sns"></td>
				</tr>

			</table>
			<ul class="btnBox2">
				<button class="nextBtn g-recaptcha" type="submit">정보 수정</button>
				<button class="cancelBtn" type="button">회원 탈퇴</button>		
			</ul>

		</form>
	</div>
	
	<!-- Modal -->
         <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog2">
               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4>
                        <span class="glyphicon glyphicon-lock"></span>회원탈퇴
                     </h4>
                  </div>
                  <div class="modal-body">
                  <form action="./memberDelete" method="post" name="frm2">
					<p>${member.name}회원님</p>
					<p><img id="poto2" src="../resources/upload/${member.fname}" style="width: 50px; height: 50px; border-radius: 50%;"> ${member.id}</p><br><br>
					<p style="font-size: small;">계속하시려면 먼저 본인임을 인증하세요</p><br><br><br>
					<p style="font-size: x-small; color: blue;">비민번호를 입력하세요</p>
					<input type="hidden" value="${member.pw}" id="pwCheck">
					<p><input type="password" id="pwCheck2" style="border-radius: 4px; border: 1px solid #ccc; height: 20px; width: 50%"><span id="pwcheck3"></span></p><br>
					<button class="cancelBtnOK" type="button">회원 탈퇴 완료</button>	
                    </form>
                  </div>
               </div>
            </div>
         </div>
	
	
	
</body>
</html>