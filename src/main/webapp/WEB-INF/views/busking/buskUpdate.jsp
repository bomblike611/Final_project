<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/busk/buskWrite.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>## 노래왕 버스킹 -Busking Update페이지입니다</title>
<script type="text/javascript">
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#insertBoard").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#frm").submit();
		});

		$("#check2").click(function() {
			$("#privateInfo").slideToggle("slow");
		});

	});
</script>
</head>
<body>
	<section id="main">
		<div id="WritePage">
			<div id="loc">
				<h2>Busking Update</h2>
				<p>가수분들은 공연 시간 10분전에 도착하여 공간확보를 미리 부탁드립니다.</p>
			</div>
			<form action="./buskUpdate" method="post"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th><span style="color: red;">*</span>공연명</th>
						<td><input type="text" name="title" placeholder="공연명을 입력해주세요"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>팀명</th>
						<td><input type="text" name="teamname" placeholder="가수명"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>공연지역</th>
						<td><select name="location"><option>가게</option></select></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>공연일자</th>
						<td><input type="date" name="busk_date"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>참가자수</th>
						<td><input type="text" value="0"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>공연포스터</th>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<th colspan="2"><span style="color: red;">*</span>소개</th>
					</tr>
					<tr>
						<th colspan="2"><textarea name="contents" id="contents"></textarea></th>
					</tr>
				</table>
				<div id="private">
					<h2>개인정보보호를 위한 이용자 동의사항</h2>
					<p>노래왕버스킹은 개인정보보호법 등 관련 법률에 따라 개인정보 수집 이용 시 정보 주체에게 사전 고지하고 이에
						대한 동의를 받습니다.</p>
					<div id="checkbox">
						<input type="checkbox" id="check"> 개인정보 수집 및 이용 동의 (필수)<span
							style="float: right;" id="check2">▼ </span>
					</div>
					<div id="privateInfo">
						<p> - 개인정보의 수집 및 이용 목적: 노래왕 버스킹 버스킹 게시물 등록 서비스 이용</p>
						<p> - 수집하는 개인정보 항목: 이름, 휴대전화, 이메일</p>
						<p> - 개인정보 보유 및 이용 기간: 동의일로부터 6개월</p>
						<p> - 귀하는 동의를 거부할 권리가 있으나, 위 사항에 동의하지 않으실 경우 노래왕 버스킹 서비스 이용에
							제한을 받을 수 있습니다.</p>
					</div>
				</div>
			</form>
			<button class="btn btn--stripe">Busking Update</button>
		</div>
	</section>
</body>
</html>