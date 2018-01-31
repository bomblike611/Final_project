<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" " rel="stylesheet">
</head>
<script type="text/javascript">
	$(function() {
		$(".cancelBtn").click(function() {
			window.location = '../';
		});
		$("#checkALL").click(function() {
			var check = $(this).prop("checked");
			if (check) {
				$("#siteAgreement").prop("checked", true);
				$("#personalAgreement").prop("checked", true);
			} else {
				$("#siteAgreement").prop("checked", false);
				$("#personalAgreement").prop("checked", false);
			}
		});
		$(".siteAgreement").click(function() {
			var check1 = $("#siteAgreement").prop("checked");
			var check2 = $("#personalAgreement").prop("checked");
			var check = $(this).prop("checked");
			if (!check) {
				$("#checkALL").prop("checked", false);
			}
			if (check1 && check2) {
				$("#checkALL").prop("checked", true);
			}

		});
	});
</script>
<body>

	<%@include file="../temp/header.jsp"%>

	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">JOIN</h2>
		<div class="join_wrapper">
			<ul class="stepGuide">
				<li class="stepGuide_on"><p id="a">1</p> <span id="a2">약관동의</span></li>
				<li class="stepGuide_off"><p>2</p> <span style="color: gray;">회원정보
						입력</span></li>
				<li><p>3</p> <span style="color: gray;">회원가입 완료</span></li>
			</ul>
		</div>
		<!-- 이용약관 시작 -->
		<div class="checkALL">
			<input name="checkALL" id="checkALL"
				type="checkbox" > <label for="checkALL">Varoh 이용약관과
				개인정보 수집 및 이용에 모두 동의합니다.</label>
		</div>
	<!-- 	<div class="terms_wrapper"> -->
			<div class="siteTerms">
				<dl class="varoh">
					<dt>Varoh 이용약관</dt>
					<dd class="varoh">
						<textarea readonly="">(주)비에취어쿠스텔 회원약관은 다음과 같은 내용을 담고 있습니다.
제 1 장 총 칙

제 1 조 (목적) 
이 회원규칙 및 프라이버시(Privacy) 규정은 전기통신사업법 및 동법시행령에 의하여 (주)비에취어쿠스텔(이하 "회사"라 한다)가 제공하는 서비스의 이용조건, 절차 그리고 회원규칙에 관한 사항을 규정함을 목적으로 합니다. 
제 2 조 (공지 및 준용) 
•	1. 이 규정의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.
•	2. 회사는 이 규정을 변경할 수 있으며, 변경된 규정은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.

제 3 조 (규정 외 준칙) 
•	1. 이 규정에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 의합니다.

제 4 조 (용어의 정의) 
이 규정에서 사용하는 용어의 정의는 다음과 같습니다.
•	1. 회원 : 회사와 서비스 이용계약을 체결한 자
•	2. 이용자ID : 회원의 고유 ID를 의미
•	3. 비밀번호 : 회원의 비밀 보호를 위함.
•	4. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 
•	5. 해지 : 회사 또는 회원이 서비스 개통 후 이용계약을 해약하는 것 


제 2 장 서비스 이용계약 

제 5 조 (이용계약의 성립) 
•	1. 아래 "위의 이용약관에 동의하십니까?" 라는 물음에 회원이 "동의"단추를 누르면 이 규정에 동의하는 것으로 간주됩니다
•	2. 이용계약은 회원의 이용신청에 대하여 회사가 승낙함으로써 성립합니다.

제 6 조 (이용신청)
이용신청은 온라인으로 다음 사항을 가입신청 양식에 기록하여 신청합니다. 
•	1.아이디
•	2.비밀번호
•	3.이름
•	4.주소
•	5.전화번호
•	6.이메일주소

제 7 조 (이용신청의 승낙)
•	1. 회사는 회원이 제 6 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.
•	2. 회사는 다음 각 호에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다. 
o	- 설비에 여유가 없는 경우
o	- 기술상 지장이 있는 경우
o	- 기타 회사가 필요하다고 인정되는 경우
•	3. 회사는 다음 각 호에 해당하는 이용신청에 대하여는 이를 승낙하지 아니 할 수 있습니다 
o	- 이름이 실명이 아닌 경우
o	- 다른 사람의 명의를 사용하여 신청한 경우
o	- 이용신청시 필요내용을 허위로 기재하여 신청한 경우
o	- 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우

제 8 조 (계약사항의 변경)
1. 회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인수정을 해야 합니다.

제 3 장 서비스 이용 

제 9 조 (회사의 의무)
1. 회사는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙없이 제 3자에게 누설, 배포하지 않습니다.
단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우,범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.

제 10 조 (회원 비밀번호 관리에 대한 의무) 
•	1. 이용자 ID과 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 
회원에게 부여된 이용자 ID와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. 
•	2. 자신의 이용자 ID,비밀번호가가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.

제 11 조 (서비스 전반에 관한 회원의 의무) 
•	1. 회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다. 
o	1. 다른 회원의 이용자 ID를 부정하게 사용하는 행위
o	2. 서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제 3 자에게 제공하는 행위 
o	3. 제3자의 저작권 등 기타 권리를 침해하는 행위 
o	4. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 
o	5. 범죄와 결부된다고 객관적으로 판단되는 행위
o	6. 기타 관계법령에 위배되는 행위
•	2. 회원은 이 규정에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다. 
•	3. 회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다. 
•	4. 회원은 회사의 사전승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 규정에 위반한 영업활동을 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다. 

제 12 조 (정보의 제공)
1. 회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편, 유선매체, 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.

제 13 조 (회원의 게시물)
•	1. 회사는 회원이 게시하거나 등록하는 서비스내의 내용물이 다음 각 호에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다. 
o	1. 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 
o	2. 공공질서 및 미풍양속에 위반되는 내용인 경우 
o	3. 범죄적 행위에 결부된다고 인정되는 내용일 경우
o	4. 제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우
o	5. 회사에서 규정한 게시기간을 초과한 경우 
o	6. 기타 관계법령에 위반된다고 판단되는 경우

제 14 조 (게시물의 저작권)
•	1. 서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다. 
o	1. 게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 영리적 목적으로 사용할 수 없습니다. 단, 비영리적인 경우는 그러하지 아니하며 또한 서비스내의 게재권을 갖습니다. 
o	2. 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다. 

제 15 조 (서비스 이용시간) 
•	1. 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기점검 등의 필요로 회사가 정한 날이나 시간은 그러하지 않습니다.
•	2. 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능시간을 별도로 정할 수 있으며 이 경우 그 내용을 사전에 공지합니다. 

제 16 조 (서비스 제공의 중지) 
•	1. 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. 
o	1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
o	2. 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지했을 경우
•	2. 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
제 4 장 계약해지 및 이용제한

제 17 조 (계약해지 및 이용제한) 
•	1. 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인을 통해 회사에 해지신청을 하여야 합니다. 
•	2. 회사는 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. 
o	1. 타인의 이용자 ID 및 비밀번호를 도용한 경우 
o	2. 서비스 운영을 고의로 방해한 경우
o	3. 가입한 이름이 실명이 아닌 경우
o	4. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 
o	5. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우
o	6. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우 
o	7. 기타 회사가 정한 이용조건에 위반한 경우

제 5 장 손해배상 등

제 18 조 (손해배상)
•	1. 회사는 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다. 서비스 유료화 이후에 관하여는 별도로 정합니다.

제 19 조 (면책조항)
•	1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
•	2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
•	3. 회사는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다. 
•	4. 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을지지 않습니다. 

제 20조 (관할법원)
•	1. 요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 관할법원으로 합니다. 

[부칙]
(시행일)이 규정은 2016년 3월 1일부터 시행합니다. 
							</textarea>
					</dd>
				</dl>

				<div class="siteAgree">
					<input name="siteAgreement" id="siteAgreement" type="checkbox" class="siteAgreement">
					<label for="siteAgreement">Varoh의 사용약관에 동의합니다.</label>
				</div>
			</div>
			<!--siteTerms end -->


			<div class="personalTerms">
				<dl class="varoh">
					<dt>개인정보 수집 및 이용안내</dt>
					<dd class="varoh">
						<textarea readonly="">(주)비에취어쿠스텔(이하 ‘회사’)는 회원님들의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
회사는 개인정보취급방침을 통하여 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

1. 수집하는 개인정보 항목 및 수집방법
가. 수집하는 개인정보의 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
•	- 필수사항 : 이름, 아이디, 비밀번호, 닉네임, 이메일 주소, 비밀번호 찾기 질문/답변
나. 개인정보 수집방법
회사는 다음과 같은 방법으로 개인정보를 수집합니다.
•	- 홈페이지 회원가입

2. 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
가. 회원 관리
회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
나. 마케팅 및 광고에 활용
이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
다. 기타
시민기자제, 커뮤티니 이용

3. 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
•	- 항 목 : 이름 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일
•	- 보존 이유 : 수사기관의 수사협조요청자료
•	- 보존 기간 : 5년

4. 개인정보의 파기절차 및 방법
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
•	- 파기절차
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
•	- 파기방법
종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 

5. 개인정보 제공
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다
•	- 이용자들이 사전에 동의한 경우
•	- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

6. 수집한 개인정보의 위탁
회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

7. 이용자 및 법정대리인의 권리와 그 행사방법
이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
이용자들의 개인정보 조회, 수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.
귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 “회사가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.
가. 쿠키의 사용 목적
회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
나. 쿠키의 설치/운영 및 거부
•	- 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 
다. 쿠키 설정 거부 방법
•	- 예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 
•	- 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보
•	- 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스는 이용에 어려움이 있을 수 있습니다.

9. 개인정보의 기술적/관리적 보호 대책
회사는 개인정보보호법 제29조 등에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
1) 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.
2) 내부관리계획의 수립 및 시행
개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.
3) 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
4) 해킹 등에 대비한 기술적 대책
해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신, 점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.
5) 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
6) 데이터서버에 대한 물리적 접근 차단
서버가 보관된 장소는 서버관리자만 가능하도록 통제하고 있습니다. 또한 폐쇄회로를 통한 출입자 모니터링 및 자동 추적, 지문인식, 카드리더, 경보장치를 통해 물리적 접근을 통제합니다.
7) 문서보안을 위한 잠금장치 사용
개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.
8) 기타
회원가입 및 정보변경 웹페이지와 관련하여 로그인에 관한 정보는 모두 복호화 할 수 없는 암호화 처리를 합니다. 또한 홈페이지 상에서 대량의 개인정보를 취급하는 관리자 기능을 제공하지 않습니다.

10. 개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.
•	- 개인정보 관리책임자 
이름 :  김윤호
전화번호 : 010-8265-5683
이메일 : yhkim@bhacoustel.com
•	- 개인정보 관리담당자
이름 : 김영회
전화번호 : 010-4059-7899
이메일 : rla7250@bhacoustel.com

귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
•	- 개인정보침해신고센터 (http://www.118.or.kr / 118)
•	- 개인정보분쟁조정위원회 (http://www.kopico.or.kr / 02-405-4747)
•	- 정보보호마크인증위원회 (http://www.eprivacy.or.kr / 02-580-0533~4)
•	- 대검찰청 첨단범죄수사과 (http://www.spo.go.kr / 02-3480-2000)
•	- 경찰청 사이버테러대응센터(http://www.ctrc.go.kr / 02-392-0330)


11. 개인정보 처리방침의 변경
이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.
공고일자 : 2016년 3월 1일
시행일자 : 2016년 3월 1일
					
								</textarea>
					</dd>
				</dl>


				<div class="personalAgree">
					<input name="personalAgreement" id="personalAgreement"
						type="checkbox" class="siteAgreement"> <label for="personalAgreement">Varoh의
						개인정보의 수집, 이용에 관한 사항에 동의합니다.</label>
				</div>
			</div>
			<!--personalTerms end -->
		<!-- </div> -->
		<ul class="btnBox">
				<button class="nextBtn" onclick="javascript:agree()" type="submit"
					value="다음 단계로 이동">다음 단계로 이동</button>
				<button class="cancelBtn" type="submit" value="취소">취소</button>
		</ul>

	</div>


</body>
</html>