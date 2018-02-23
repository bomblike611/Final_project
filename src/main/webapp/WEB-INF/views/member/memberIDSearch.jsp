<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(아이디/비밀번호 찾기)입니다</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
<script type="text/javascript">


</script>
</head>
<body>
	<span id="Search">&nbsp;이메일로 ID 찾기</span>
	<form action="./memberID" method="post">
		<table width="380px" height="70px" align="center" border="0"
			style="font-size: 16px;">
			<tr>
				<td>이메일</td>
				<td><input type="email" id="email" name="email" class="Join_input" placeholder="   Enter E-mail" style="width: 85%"></td>
			</tr>
		</table>
		<table width="140px" height="10px" border="0" style="margin-top: 2%;"
			align="center">
			<tr>
				<td><button type="submit" id="enter1" align="center">ID 찾기</button></td>
				<td><input type="button" id="cancle1" value="  취소  " align="center" onClick="cancle()"></td>
			</tr>
		</table>
	</form>

</body>
</html>