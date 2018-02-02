<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/busk/resources/css/donation/spon.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {
		$('.busker_img:gt(0)').hide();
		setInterval(function() {
		    $('.busker_img :first-child').fadeOut().next('img').fadeIn().end().appendTo('.busker_img');
		}, 4000);
		IMP.init('imp36304196');
		var money=0;
		var kind = "정기후원";
		var myprogress = false;
		$("#regular").click(function(){
			kind = "정기후원";
			$("#regular").css({"background":"#000","color":"white"});
			$("#temporary").css({"background":"white","color":"#000"});
			$("#amount").html("<div class='money' title='30000'>3만원</div><div class='money' title='20000'>2만원</div><div class='money' title='10000'>1만원</div><div class='money' title=''>기타 금액<input type='number' id='etc'><span>원</span></div>");
		});
		$("#temporary").click(function(){
			kind = "일시후원";
			$("#regular").css({"background":"#fafafa","color":"#000"});
			$("#temporary").css({"background":"#000","color":"#fafafa"});
			$("#amount").html("<div class='money' title='50000'>5만원</div><div class='money' title='30000'>3만원</div><div class='money' title='20000'>2만원</div><div class='money' title=''>기타 금액<input type='number' id='etc'><span>원</span></div>");
		}); 
		$("#amount").on("click",".money",function(){
			money=$(this).attr("title");
			$(".money").css({"background-color":"white","color":"#1e1e1f"});
			$(this).css({"background-color":"#1e1e1f","color":"white"});
		});
		$("#spon_main").on("click","#next",function(){
			if(!myprogress){
				if((kind=="정기후원" && money>=5000)||(kind=="일시후원" && money>=10000)){
				$.post("./spon_main",{kind:kind, money:money},function(data){
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
				var email = $("#email").val();
				var name = $("#name").val();
				var phone = $("#phone").val();
				IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '버스커후원',
				    amount : money,
				    buyer_email : email,
				    buyer_name : name,
				    buyer_tel : phone,
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456',
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
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
	});
</script>
</head>
<body>
<%@include file="/WEB-INF/views/temp/header.jsp" %>
	<section id="main">
		<div id="main_spon">
				<div id="busker_main">
						<div class="busker_img">
	 						<img src="/busk/resources/images/busker/twice.jpg">
	 						<img src="/busk/resources/images/busker/twice2.jpg">
						</div>
						<div class="busker_info">
							<p>팀명 : </p>
							<p>팀원 : </p>
							<p>SNS : </p>
							<p>장르 : </p> 
						</div>
					<div class="busker_profile">
						<p>안뇽하세요 트와이스 입니다.
							예예
						</p>
					</div>
				</div>
				<div id="donate">
					<div id="progress">
						<ul>
							<li>
								<p>1</p>
								<span>후원금액</span>
							</li>
							<li id="progress1">
								<img alt="" src="/busk/resources/images/rightB_icon2.png">
							</li>
							<li>
								<p>2</p>
								<span>후원자 정보</span>
							</li>
							<li id="progress2">
								<img alt="" src="/busk/resources/images/rightB_icon2.png">
							</li>
							<li>
								<p>3</p>
								<span>결제 방식</span>
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
							<div class="money" title="">기타 금액<input type="number" id="etc"><span>원</span></div>
						</div>
						<button class="nextBtn" id="next">다음 -></button>
					</div>
				</div>
			<div></div>
		</div>
	</section>
</body>
</html>