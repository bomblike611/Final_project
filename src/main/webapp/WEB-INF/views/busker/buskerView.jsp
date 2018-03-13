<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -버스커정보페이지입니다 ##</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/busker/buskerView.css" rel="stylesheet">
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		var title = "${team[0].fname}";
		$("body").css("background-image", 'url("/busk/resources/upload/'+title+'")');
		$("img").click(function(){
			var id = $(this).attr("title");
			title = $(this).attr("id");
			$("body").css("background-image", 'url("/busk/resources/upload/'+title+'")');
			$.post("./buskerView",{id:id}, function(data){
				$("#member_info").html(data);
			});
		});
		$("#donation").click(function(){
			location.href="/busk/donation/spon_main";
		});
		$("#btn").click(function(){
			$("#myModal").css("display","block");
		});
		$(".close").click(function(){
			$("#myModal").css("display","none");
		});
		IMP.init('imp36304196');
		var check = true;
		var money=0;
		var kind = "정기후원";
		var myprogress = false;
		var postaddr;
		var roadaddr;
		$("#regular").click(function(){
			kind = "정기후원";
			$("#regular").css({"background":"#000","color":"white"});
			$("#temporary").css({"background":"white","color":"#000"});
			$("#amount").html("<div class='money' title='30000'>3만원</div><div class='money' title='20000'>2만원</div><div class='money' title='10000'>1만원</div><div class='money' title=''>기타 금액<input type='number' class='member_info' id='etc'><span>원</span></div>");
		});
		$("#temporary").click(function(){
			kind = "일시후원";
			$("#regular").css({"background":"#fafafa","color":"#000"});
			$("#temporary").css({"background":"#000","color":"#fafafa"});
			$("#amount").html("<div class='money' title='50000'>5만원</div><div class='money' title='30000'>3만원</div><div class='money' title='20000'>2만원</div><div class='money' title=''>기타 금액<input type='number' class='member_info' id='etc'><span>원</span></div>");
		}); 
		$("#amount").on("click",".money",function(){
			money=$(this).attr("title");
			$(".money").css({"background-color":"white","color":"#1e1e1f"});
			$(this).css({"background-color":"#1e1e1f","color":"white"});
		});
		$("#spon_main").on("click","#next",function(){
			if(!myprogress){
				if((kind=="정기후원" && money>=5000)||(kind=="일시후원" && money>=10000)){
				$.post("/busk/spon/sponPage",{kind:kind, money:money},function(data){
					$("#spon_main").html(data);
				});
				$("#myprogress").css("width", "70%");
				$("#progress1").html("<img alt='' src='/busk/resources/images/rightB_icon.png'>");
				myprogress = true;
				}else{
					if(kind=="정기후원"){
						alert("정기후원 금액은 5000원 이상 이여야 합니다.")
					}else{
						alert("일시후원 금액은 10000원 이상 이여야 합니다.")
					}
				}
			}else{
				$("#progress2").html("<img alt='' src='/busk/resources/images/rightB_icon.png'>");
				var message = $("#message").val();
				var email = $("#email").val();
				var name = $("#name").val();
				var phone = $("#phone").val();
				IMP.request_pay({
				    pg : 'uplus', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '${team[0].teamName}후원',
				    amount : money,
				    buyer_email : email,
				    buyer_name : name,
				    buyer_tel : phone,
				    buyer_addr : roadaddr,
				    buyer_postcode : postaddr,
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        location.href="../spon/success?id=${member.id}&teamName=${team[0].teamName}&price="+money+"&message="+message;
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
			}
		});
		$("#spon_main").on("click","#prev",function(){
			location.reload();
		});
		$("#spon_main").on("keyup","#etc",function() {
			var etc = this.value;
			$(this).parent().attr("title",etc);
			money = etc;
			
		});
		$("#spon_main").on("click",".addr_search",function(){
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
	                postaddr=data.zonecode;
	                roadaddr=fullRoadAddr;
	                window.self.close();
	            }
	        }).open();
		});
	});
</script>
<body>
	<%@include file="/WEB-INF/views/temp/header.jsp"%>
	<section id="main">
		<div id="busker_main">
			<table id="busker_member">
					<%-- <c:forEach > --%>
					<c:forEach begin="0" end="${team.size()}" var="i" step="2">
						<tr>
							<td><img src="/busk/resources/upload/${team[i].fname}" id="${team[i].fname}" title="${team[i].id}">
							</td>
							<c:if test="${not empty team[i+1].fname}">
								<td><img src="/busk/resources/upload/${team[i+1].fname}" id="${team[i+1].fname}" title="${team[i+1].id}">
								</td>
							</c:if>
						</tr>
					</c:forEach>
					<%-- </c:forEach> --%>

			</table>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> SPON
							</h4>
						</div>
						<div class="modal-body">

							<div id="donate">
								<div id="progress">
									<ul>
										<li>
											<p>1</p> <span>후원금액</span>
										</li>
										<li id="progress1"><img alt=""
											src="/busk/resources/images/rightB_icon2.png"></li>
										<li>
											<p>2</p> <span>후원자 정보</span>
										</li>
										<li id="progress2"><img alt=""
											src="/busk/resources/images/rightB_icon2.png"></li>
										<li>
											<p>3</p> <span>결제 방식</span>
										</li>
									</ul>
								</div>
								<div id="loading">
									<div id="myprogress"></div>
								</div>
								<div id=spon_main>
									<p>후원금을 선택해 주세요</p>
									<button id="regular" class="nextBtn">정기후원</button>
									<button id="temporary" class="cancelBtn">일시후원</button>
									<div id="amount">
										<div class="money" title="30000">3만원</div>
										<div class="money" title="20000">2만원</div>
										<div class="money" title="10000">1만원</div>
										<div class="money" title="">
											기타 금액<input type="number" class="member_info" id="etc"><span>원</span>
										</div>
									</div>
									<button class="nextBtn" id="next">다음 -></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button id="btn" data-toggle="modal" data-target="#myModal">후원하기</button>
			<div id="member_info">
				<p>이름 : ${team[0].name}</p>
				<p>포지션 : ${team[0].position}</p>
				<p>SNS : ${team[0].sns}</p>
				<p>생일 : ${team[0].birth}</p>
			</div>
		</div>
	</section>
</body>
</html>