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
<title>## 노래왕 버스킹 -Busking Write페이지입니다</title>
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
		$("#btn").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			document.frm.submit();
		});

		$("#check2").click(function() {
			$("#privateInfo").slideToggle("slow");
		}); 
		
		

		var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
		
	});
	
</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<section id="main">
		<div id="WritePage">
			<div id="loc">
				<h2>Busking Write</h2>
				<p>가수분들은 공연 시간 10분전에 도착하여 공간확보를 미리 부탁드립니다.</p>
			</div>
			<form action="./buskWrite" name="frm" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="writer" value="테스트">
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
						<td><select name="location"><option value="가게">가게</option></select></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>공연일자</th>
						<td><input type="date" name="busk_date"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>참가자수</th>
						<td><input type="number" name="entry" value="0"></td>
					</tr>
					<tr>
						<th><span style="color: red;">*</span>공연포스터</th>
						<td><div class="filebox bs3-primary preview-image">
                            <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">

                            <label for="input_file">업로드</label> 
                          <input type="file" id="input_file" name="file" class="upload-hidden"> 
                        </div></td>
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
			<button class="btn btn--stripe" id="btn">Busking Write</button>
		</div>
	</section>
</body>
</html>