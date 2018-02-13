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
	$("#enter1").click(function() {
		if ($("#name").val(this.${member.name})) {
			
		}
		
		
	});



</script>
</head>
<body>
	<%@include file="../temp/header.jsp"%>

	<div class="join_agree" id="main">
		<h2 class="tit_bk_left pt30">회원 정보 찾기</h2>
		<div class="join_wrapper">
			<ul class="step">
			</ul>
			<span id="Search">아이디 찾기 </span>
		</div>

		<table width="1330px" height="430px" align="center">
			<tr>
				<td>
					<table width="600px" align="center" border="0"
						style="color: black;font-size: 20px; margin-left: 36%">
						<tr>
							<td>
								
							</td>
						</tr>

						<tr>
							<td>
								<table width="800px" height="300px" align="center"
									style="border: dotted 5px none; margin-top: 4%">

									<tr>
										<td>
											<table width="300px" height="30px" border="0"
												style="margin-top: 3%; color: black; font-size: 18px;">
												<tr>
													<td></td>
													<td id="Search">&nbsp;이름,핸드폰번호로 찾기</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td>
											<table width="380px" height="70px" align="center" border="0"
												style="font-size: 16px;">
												<tr>
													<td>이름</td>
													<td><input type="text" id="name"></td>
												</tr>
												<tr>
													<td>휴대폰</td>
													<td><input type="text" id="phone"></td>
												</tr>
												
												<tr id="result">
													
												</tr>
												
											</table>
										</td>
									</tr>



									<tr>
										<td>
											<table width="140px" height="10px" border="0"
												style="margin-top: 2%;" align="center">
												<tr>
													<td><input type="button" id="enter1" value="  찾기  "
														align="center"
														style="cursor: pointer; background: white; color: black; border-color: black;"
														onClick="id_search1()"></td>
													<td><input type="button" id="cancle1" value="  취소  "
														align="center"
														style="cursor: pointer; background: white; color: black; border-color: black;"
														onClick="cancle()"></td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td>
											<table width="300px" height="20px" border="0"
												style="margin-top: 3%; font-size: 18px;">
												<br>
												<br>
												<tr>
													<td></td>
													<td id="Search">&nbsp;이름,이메일로 찾기</td>
												</tr>
											</table>
										</td>
									</tr>

									<td>
										<table width="380px" height="70px" align="center" border="0"
											style="font-size: 16px;">
											<tr>
												<td>이름</td>
												<td><input type="text" name="name2"></td>
											</tr>
											<tr>
												<td>e-mail&nbsp;</td>
												<td><input type="email"></td>
											</tr>
										</table>
									</td>
									</tr>

									<tr>
										<td>
											<table width="140px" height="10px" border="0"
												style="margin-top: 2%" align="center">
												<tr>
													<td><input type="button" id="enter2" value="  찾기  "
														align="center"
														style="cursor: pointer; background: white; color: black; border-color: black;"
														onClick="id_search2()"></td>
													<td><input type="button" id="cancle2" value="  취소  "
														align="center"
														style="cursor: pointer; background: white; color: black; border-color: black"
														onClick="cancle()"></td>
												</tr>
											</table> <br>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>




	</div>




</body>
</html>