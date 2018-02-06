









<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<!-- meta tag area -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link rel="shortcut icon" href="/images/main/baby-kids.ico">
	<title>버스킷</title>

	<!-- meta tag area -->
	
	<!-- style sheet Area -->
	<link rel="stylesheet" type="text/css" media="all"	href="/css/stylesheet.css" />
	<link rel="stylesheet" type='text/css' href="/css/jquery.ui.all.css" />
	<style>
	#loading {
		height: 100%;
		left: 0px;
		position: fixed;
		_position:absolute; 
		top: 0px;
		width: 100%;
		filter:alpha(opacity=50);
		-moz-opacity:0.5;
		opacity : 0.5;
	}
	
	.loading {
		background-color: white;
		z-index: 199;
	}
	
	#loading_img{
		width:150px;
		position:absolute; 
		top:50%;
		left:50%;
		height:150px;
		margin-top:-75px;
		margin-left:-75px;	
		z-index: 200;
	}
	</style>
	<!-- style sheet Area -->
<script type="text/x-javascript">
    var roosevelt_params = {
        retargeting_id:'fJS3zx4iKJK.Rb5FRDs.Iw00',
        tag_label:'V3aUVh8sTI2XAA1xoICC9g'
    };
</script>
<script type="text/x-javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
	<!-- javascript Area -->
	<script type="text/javascript" src="/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.core.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="/js/i18n/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript" src="/js/jquery.cycle2.min.js"></script>
	<script type="text/javascript" src="/js/jquery.cycle2.carousel.js"></script>
	<script type="text/javascript" src="/js/jquery.selectBox.js"></script>
	<script type="text/javascript" src="/js/json2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/editor_board.js"></script>
	<!-- javascript Area -->
	
	<!--[if IE 7]>
	Special instructions for IE 7 here
	<![endif]-->
	<!--[if gte IE 9]>
	<style type="text/css">
	.gradient {filter: none;}
	</style>
	<![endif]-->

	
	<script type="text/javascript">
	$(document).ready(function () {
		var url = location.href;
		var strUrl = "";
		var page = "getProductShop;getProductOrgaList;getProductDealList;getProductParcelShop;ProductDaySelf;ProductParcelSelf;getShopMain;getProductMonthList.do;getProductCart.do;getProductOrderForm.do;getAddressSearchJiPop.do;getItemDetailPop.do;getMonthMenuPop.do;PasswordConfirmPop.do;getCouponMemberPop.do;BabyRegistFormPop"//제외 페이지
		
		if(url.indexOf("forwardPage") < 0)			
			strUrl = url.substring(url.lastIndexOf("/")+1, url.indexOf(".do"));
		else
			strUrl = url.substring(url.lastIndexOf("/")+1, url.length);
		
		var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));
		if (!mobile) {
			
			var tbSkip = decodeURI(getCookie("topBanner"));
			if (tbSkip == ""){
				if(page.indexOf(strUrl) < 0)
					if(url.indexOf("Intro") <0)						
						fnTopBanner();						
			}
			
		}
	});
	function fnTopBanner(){
		var text ="";
		$.ajax({
			type :'POST',
			url: "/front/main/getTopBanner.do",
			data :  "",
			dataType:"json",
			success:function(responseData){
				if(responseData != null){
					if(responseData.result != null){
						if(responseData.result.topBannerList != null && responseData.result.topBannerList.length > 0) {
							for(var idx = 0; idx < responseData.result.topBannerList.length; idx++) {							
								text += '<div class="notice_wrap" style="background:#aeffe8 url(/images/upload/banner/' + responseData.result.topBannerList[idx].bannerImg2 + ') no-repeat center 0">';
								text += '<div class="notice_inner">';
								text += '<a href="' + responseData.result.topBannerList[idx].linkUrl + '"><img src="/images/upload/banner/' + responseData.result.topBannerList[idx].bannerImg + '" width="800" alt="EVENT" /></a>';
								text += '<div class="close" onclick="fnCloseMain();">Close</div>';
								text += '</div>';
								text += '</div>';
							}
						}
					}
				}
				$("#div_TopBanner").html(text);				
			},
			error:function(xhr, textStatus, errorThrown){				
				//alert("관리자에게 문의 하세요.");
			}
			
		});
		return false;
	}
	function fnCloseMain() {
		//
		setCookie( "topBanner", "done" , 1); // 1=하룻동안 공지창 열지 않음        
		$(".notice_wrap").addClass("hidden");
	}
	
	jQuery(function($){ 
		var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="/images/front/agri_loading.gif" />').appendTo(document.body).hide(); 
		$(window).ajaxStart(function(){ 
			loading.show(); 
		}).ajaxStop(function() { 
			loading.hide(); 
		}).ajaxError(function( event, request, settings ) {
			alert(settings.url + "페이지  조회 중 에러가 발생햇습니다.");
			loading.hide(); 
		}); 
	});
	
	var lastScrollY = 0;
	$(function(){
			
		var diffY = document.documentElement.scrollTop;
		if($(".quick_menu").length>0){
			$(window).scroll(function(){
				var diffTop = Math.max(document.documentElement.scrollTop,document.body.scrollTop);
				if(diffY != lastScrollY){
					percent = .10 * (diffY-lastScrollY);
					if(percent > 0){
						percent = Math.ceil(percent);
					}else{
						percent = Math.floor(percent);				
					}
					diffTop = parseInt($(".quick_menu").offset().top)+percent;
					lastScrollY = lastScrollY + percent;
				}
				
				$(".quick_menu").stop();
				$(".quick_menu").animate({"top":diffTop},500);
			});
		}
	});
	</script>
	

	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-61938491-6', 'auto',{
	   'allowLinker':true
	  });
	  
	  ga('require','linker');
	  ga('linker:autoLink', ['pulmuone.co.kr']);  
	  
	  var dimensionValue = 'http:';
	  ga('set', 'dimension1', dimensionValue);
	  ga('set', 'dimension2','N');
	  ga('set', 'dimension3','');
	  
	  ga('send', 'pageview');
	
	</script>
	<div class="notice_wrap" id="div_TopBanner"></div>

</head>
<body>
<div id="wrap">
	<!-- top area STD -->
	
	
<style>
#headera {margin-top:7px;}
#headera .header_innerF {width:1000px; margin:8px auto; display:table;}
#headera .header_innerF .tal {display:table-cell; text-align:left; vertical-align:middle;}
#headera .header_innerF .tar {display:table-cell; text-align:right; vertical-align:middle;}
#headera .header_top {border-bottom:1px solid #e9e9e9;}
#headera .header_top .header_inner {height:35px;}
#headera .header_top .btn_redirect {outline:none; background:#fff; border:0; font-size:13px; color:#a4a4a4;}
#headera .header_top .btn_redirect img {margin-right:8px; vertical-align:middle;}
#headera .header_top .gnb {float:right;}
#headera .header_top .gnb li {float:left; margin-left:29px; position:relative;}
#headera .header_top .gnb li:after {content:''; width:1px; height:10px; position:absolute; top:5px; left:-14px; background:#dedede;}
#headera .header_top .gnb li:first-child:after {width:0;}
#headera .header_top .gnb li a {color:#666; font-size:13px; font-weight:300;}

#siteSelect { position: absolute; top: 36px; left: 0; background-color: #fff; width: 100%; z-index: 1101; box-sizing: border-box;
	-webkit-box-shadow: 7px 7px 7px 0px rgba(0,0,0,0.12);
	-moz-box-shadow: 7px 7px 7px 0px rgba(0,0,0,0.12);
	box-shadow: 7px 7px 7px 0px rgba(0,0,0,0.12);
	display: none;
}

#siteSelect > .inner { max-width: 1100px; width: 100%; position: relative; height: 100%; margin: 0 auto; padding: 30px 0; box-sizing: border-box; display: table;  }
#siteSelect > .inner .siteInfo { display: table-cell; vertical-align: middle; width: 40%; position: relative; padding-left: 180px; position: relative; }
#siteSelect > .inner .siteInfo img { position: absolute; top: 50%; left: 0; margin-top: -40px; max-width: 137px; }
#siteSelect > .inner .siteInfo p { font-size: 14px; line-height: 24px; color: #666; margin-bottom: 10px; }
#siteSelect > .inner .siteInfo a { font-size: 13px; line-height: 26px; height: 26px; border: 1px solid #aeaeae; padding: 0 25px 0 12px; display: inline-block; position: relative; }
#siteSelect > .inner .siteInfo a:before { content: ''; position: absolute; width: 5px; height: 9px; top: 50%; right: 12px; margin-top: -4.5px; background: url(/dist/images/common/ico_insta_arrow.png) center no-repeat; }
#siteSelect > .inner .siteList { display: table-cell; vertical-align: middle; width: 60%; overflow: hidden; }
#siteSelect > .inner .siteList img { max-width: 100%; }
#siteSelect > .inner .siteList li { width: 25%; float: left; box-sizing: border-box; border-bottom: 1px solid #f1f1f1; border-right: 1px solid #f1f1f1; }
#siteSelect > .inner .siteList li.li3 {  }
#siteSelect > .inner .siteList li.li4 { border-right: 0; }
#siteSelect > .inner .siteList li.li5 { border-bottom: 0; }
#siteSelect > .inner .siteList li.li6 { border-bottom: 0; }
#siteSelect > .inner .siteList li.li7 { border-bottom: 0; }
#siteSelect > .inner .siteList li.li8 { border-bottom: 0; border-right: 0; }

#siteSelectBg { position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 1100; display: none; }


.gnbMenu .shopmenuKids a span.shopicon {
	background:url(../images/front/cart_i.png) no-repeat center center;
	width:25px;
	height:25px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
}
.gnbMenu .shopmenuKids a:hover span.shopicon {
	background:url(../images/front/cart_i_on.png) no-repeat center center;
}
.gnbMenu .shopmenuKids a span.shopicon_n {
	background:url(../images/front/icon_go.png) no-repeat center center;
	width:25px;
	height:25px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
}/* sj */
.gnbMenu .shopmenuKids a:hover span.shopicon_n {
	background:url(../images/front/icon_go_over.png) no-repeat center center;
}/* sj */
.gnbMenu .shopmenuKids a em {font-style:normal;font-weight:800;vertical-align:0;color:#94b544}/* sj */
.gnbMenu .shopmenuKids a span.shopbtn {
	background:url(../images/front/btn_shopmenuKids_off.jpg) no-repeat center center;
	width:103px;
	height:35px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
} /* sj */
.gnbMenu .shopmenuKids a:hover span.shopbtn {
	background:url(../images/front/btn_shopmenuKids_on.jpg) no-repeat center center;
} /* sj */
.gnbMenu > li.shopmenuKids:hover > .spread .submenu li.menu05 {
	background:#F5F5F5;
	position:relative;
}
.gnbMenu > li.shopmenuKids .spread .submenu li.menu05 > .subarrow {
	position:absolute;
	background:url(../images/front/submenu_arrow.png) no-repeat 0 0;
	display:none;
	width:21px;
	height:12px;
	top:-12px;
	left:50%;
	margin-left:-10px;
	z-index:100000;
}
.gnbMenu > li.shopmenuKids:hover .spread .submenu li.menu05 > .subarrow {
	display:block;
}



.gnbMenu .shopmenuNew a span.shopicon {
	background:url(../images/front/cart_i.png) no-repeat center center;
	width:25px;
	height:25px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
}
.gnbMenu .shopmenuNew a:hover span.shopicon {
	background:url(../images/front/cart_i_on.png) no-repeat center center;
}
.gnbMenu .shopmenuNew a span.shopicon_n {
	background:url(../images/front/cart_i_n.png) no-repeat center center;
	width:25px;
	height:25px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
}/* sj */
.gnbMenu .shopmenuNew a:hover span.shopicon_n {
	background:url(../images/front/cart_i_n_on.png) no-repeat center center;
}/* sj */
.gnbMenu .shopmenuNew a em {font-style:normal;font-weight:800;vertical-align:0;color:#94b544}/* sj */
.gnbMenu .shopmenuNew a span.shopbtn {
	background:url(../images/front/btn_shopmenu_off.jpg) no-repeat center center;
	width:103px;
	height:35px;
	margin:-6px 5px 0 0;
	display:inline-block;
	zoom:1;
	display: -moz-inline-stack;
	*display:inline;	/*IE7 HACK*/
	_display:inline;	/*IE6 HACK*/
} /* sj */
.gnbMenu .shopmenuNew a:hover span.shopbtn {
	background:url(../images/front/btn_shopmenu_on.jpg) no-repeat center center;
} /* sj */
.gnbMenu > li.shopmenuNew:hover > .spread .submenu li.menu05 {
	background:#F5F5F5;
	position:relative;
}
.gnbMenu > li.shopmenuNew .spread .submenu li.menu05 > .subarrow {
	position:absolute;
	background:url(../images/front/submenu_arrow.png) no-repeat 0 0;
	display:none;
	width:21px;
	height:12px;
	top:-12px;
	left:50%;
	margin-left:-10px;
	z-index:100000;
}
.gnbMenu > li.shopmenuNew:hover .spread .submenu li.menu05 > .subarrow {
	display:block;
}
.gnbMenu .shopmenuNew {
	display: block;
	padding: 15px 0 32px;
	text-align:left;
	font-size:18px;
	font-weight:600;
	width:149px;
}

.gnbMenu {
	width: 750px;
}
#header .header_inner {
	width: 1000px;
}
.spread .sub_inner {
	width: 1000px;
}

</style>
<div id="headera" style="border-bottom:1px">		
		<!-- Header Include -->
	<div class="header_top ff_noto">
		<div class="header_innerF">
			<div class="tal">
			<button type="button" class="btn_redirect" id="btnP"><img src="http://www.eatsslim.co.kr/dist/images/common/ico_redirect.png" class="ico" alt="풀무원건강생활 브랜드" />풀무원건강생활</button>
			</div>
			<div class="tar">
				<div class="gnb">
					<ul>						
						
						
							
							
							<li><a onclick="fnLogin();" style="cursor:pointer">로그인</a></li>
							<li><a href="https://member.pulmuone.co.kr/customer/register_R1.jsp?siteno=9002300000">회원가입</a></li>
							
						
						<li><a href="/front/shop/getProductCart.do">장바구니</a></li>
						<li><a href="/front/customer/getNoticeList.do">고객센터</a></li>
							<!-- <a class="lightbox" href="/shop/popup/loginCheck.jsp?lightbox[width]=600&lightbox[height]=350" >마이페이지</a> -->							

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

		
		<div id="header">
			<div class="header_inner">
				<h1 class="logo"><a href="/"><img src="/images/front/logo_baby.png" width="181" height="58" alt="풀무원 베이비밀"></a></h1>
				<ul class="gnbMenu">
					<!-- 브랜드 스토리-->
					<li class="brandstorymenu">
						<span><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 스토리</a></span>
						<div class="spread">
							<!-- subInner area STD -->
							
							<div class="sub_inner">
								<div class="gnbImg">
									<img src="/images/front/gnb_img.png" width="250" height="300" alt="프리미엄 베이비밀" />
								</div>
								<ul class="submenu">
									<li class="menu01">
										<ul>
											<li class="subBold">베이비&키즈 소개</li>											
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 소개</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/material">바른재료</a></li>											
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/haccp_n">안심기준</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/process_n">생산공정</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/video">영상보기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/history">브랜드히스토리</a></li> -->
											<li class="subBold">베이비밀 특징</li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/program_n">월령별 맞춤 프로그램</a></li>
											<!--<li><a href="/front/community/getEventView.do?seq=3">이것이 이유식이다</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/mom_letter">바른맘께 전하는 편지</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/5aday">5 a Day 캠페인</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu02">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">전체 제품 소개</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">베이비밀(첫돌 이전)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">초기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_2">중기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_3">후기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_4">병행기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_5">완료기</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">키즈밀(첫돌 이후)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">영양덮밥</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_0">영양덮밥플러스</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3">아이반찬·소스</a></li>
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3_1">골고루쿡</a></li> -->
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_5">간식(퓨레)</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_7">가격안내</a></li>											
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu03">
										<ul>
											<li class="subBold"><a href="/front/community/getEventList.do">이벤트</a></li>											
											<!--<li><a href="/front/promotion/getEventGCampaign.do?seq=99999&schPageSize=5">골고루쿡 체험신청</a></li>-->
											<li style="letter-spacing:-1px"><a href="/front/promotion/getEventCampaign.do">생애 첫 이유식 무료지원</a></li>
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=144&schPageSize=5">속편한 이유식 경품대방출</a></li>-->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=154&schPageSize=5">신규고객 최대2만원 할인</a></li> -->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=164&schPageSize=5">브랜드위크20%할인</a></li> -->
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=135&schPageSize=5">키즈밀사고 유산균받자</a></li>
											<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=136&schPageSize=5">첫구매하고 식기세트받자</a></li>-->
											
											<!-- <li><a href="/front/shop/getProductHalfShop.do">반값체험단</a></li>
											<li><a href="/front/shop/getProductHalfShop.do">키즈밀 유료체험단</a></li> -->
											<!--<li><a href="/front/community/getEventView.do?currentPage=1&schType=&seq=85&schKeyword=">고객 쿠폰지원</a></li>-->
											<li><a href="/front/community/getEventList.do">진행중인 이벤트</a></li>
											<!--<li><a href="/front/community/getEventList.do?schType=end">마감된 이벤트</a></li>-->
											<!--<li><a href="/front/community/getEventList.do?schType=off">오프라인 이벤트</a></li>-->
											<!--<li class="subBold"><a href="/front/community/getExperienceList.do">커뮤니티</a></li>-->
											<li><a href="/front/community/getEventView.do?seq=116&schPageSize=5">가입인사</a></li>
											<li><a href="/front/community/getAttendanceCheck.do">출석체크</a></li>
											<!--<li><a href="/front/community/getExperienceList.do">베이비밀 체험후기</a></li>-->
											<!-- <li><a href="/front/community/getUserRecipeList.do">나만의 레시피</a></li> -->											
											<!--<li><a href="/front/customer/getPDCOrderRequest.do">제휴프로모션</a></li>-->
											<!--
											<li><a href="/community/getCookRecipeList.do">골고루쿡 레시피</a></li>											
											<li class="subBold"><a href="/front/community/getRecipeRounge.do">레시피 라운지</a></li>
											<li><a href="/front/community/getMasterRecipeList.do">전문가 레시피</a></li>
											<li class="subBold"><a href="/front/community/getPremierLounge.do">프리미어라운지</a></li>
											<li><a href="/front/community/getNewProductList.do">신제품 사전평가</a></li>
											<li><a href="/front/community/getMakeTogetherList.do">함께만드는 베이비밀</a></li>
											<li><a href="/front/community/getSecretNewsList.do">시크릿뉴스</a></li>
											-->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu04">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">일일배달 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_2">택배배송 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/partnerStory">배달 스토리</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/newcouponInfo">신규 고객 쿠폰 혜택</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/gradecouponInfo">고객 등급별 쿠폰 혜택</a></li>
											<!-- <li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/entrust">배달점 소개</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu05">
										<ul>
											<li class="subBold"><a href="/front/shop/getShopMain.do">전체 제품 보기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0001">초기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0002">중기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0003">후기2팩</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0078">후기2팩+1팩</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0023">후기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0004">병행기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0005">완료기2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0013">완료기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0007">영양덮밥2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0024">영양덮밥3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0025">영양덮밥플러스</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=4&goodsCode=0016">DIY이유식</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0008">아이반찬·소스</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=3&goodsCode=0010">퓨레</a></li>
											<li class="subBold"><a href="/front/shop/getProductFullVitaList.do">건강식품</a></li>
											<!--<li class="subBold"><a href="/front/customer/getTelOrderRequest.do">장기구매(8주) 상담접수</a></li>
											<li class="subBold"><a href="/front/shop/getProductRecaroList.do">브랜드제휴</a></li>-->
											<!--<li class="subBold"><a href="/front/shop/getProductDealList.do">수퍼베추딜</a></li>-->
											
										</ul>
										<span class="subarrow"></span>
									</li>
								</ul>
							</div>
<script type="text/javascript">							
							
function fnMove(val) {
	var url = location.host;
	
	var port = "8447";
	if(url != null){
		if(url.indexOf('babymeal') > 0)
			port = "8446";
	}
	location.href = 'https://' + url + ':' + port + val;
}
</script>							
							<!-- subInner area END -->
						</div>
					</li>
					<!-- End 브랜드 스토리-->
					<!-- 제품소개 -->
					<li class="productmenu">
						<span><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">제품소개</a></span>
						<div class="spread">
							<!-- subInner area STD -->
							
							<div class="sub_inner">
								<div class="gnbImg">
									<img src="/images/front/gnb_img.png" width="250" height="300" alt="프리미엄 베이비밀" />
								</div>
								<ul class="submenu">
									<li class="menu01">
										<ul>
											<li class="subBold">베이비&키즈 소개</li>											
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 소개</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/material">바른재료</a></li>											
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/haccp_n">안심기준</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/process_n">생산공정</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/video">영상보기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/history">브랜드히스토리</a></li> -->
											<li class="subBold">베이비밀 특징</li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/program_n">월령별 맞춤 프로그램</a></li>
											<!--<li><a href="/front/community/getEventView.do?seq=3">이것이 이유식이다</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/mom_letter">바른맘께 전하는 편지</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/5aday">5 a Day 캠페인</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu02">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">전체 제품 소개</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">베이비밀(첫돌 이전)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">초기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_2">중기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_3">후기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_4">병행기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_5">완료기</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">키즈밀(첫돌 이후)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">영양덮밥</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_0">영양덮밥플러스</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3">아이반찬·소스</a></li>
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3_1">골고루쿡</a></li> -->
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_5">간식(퓨레)</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_7">가격안내</a></li>											
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu03">
										<ul>
											<li class="subBold"><a href="/front/community/getEventList.do">이벤트</a></li>											
											<!--<li><a href="/front/promotion/getEventGCampaign.do?seq=99999&schPageSize=5">골고루쿡 체험신청</a></li>-->
											<li style="letter-spacing:-1px"><a href="/front/promotion/getEventCampaign.do">생애 첫 이유식 무료지원</a></li>
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=144&schPageSize=5">속편한 이유식 경품대방출</a></li>-->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=154&schPageSize=5">신규고객 최대2만원 할인</a></li> -->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=164&schPageSize=5">브랜드위크20%할인</a></li> -->
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=135&schPageSize=5">키즈밀사고 유산균받자</a></li>
											<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=136&schPageSize=5">첫구매하고 식기세트받자</a></li>-->
											
											<!-- <li><a href="/front/shop/getProductHalfShop.do">반값체험단</a></li>
											<li><a href="/front/shop/getProductHalfShop.do">키즈밀 유료체험단</a></li> -->
											<!--<li><a href="/front/community/getEventView.do?currentPage=1&schType=&seq=85&schKeyword=">고객 쿠폰지원</a></li>-->
											<li><a href="/front/community/getEventList.do">진행중인 이벤트</a></li>
											<!--<li><a href="/front/community/getEventList.do?schType=end">마감된 이벤트</a></li>-->
											<!--<li><a href="/front/community/getEventList.do?schType=off">오프라인 이벤트</a></li>-->
											<!--<li class="subBold"><a href="/front/community/getExperienceList.do">커뮤니티</a></li>-->
											<li><a href="/front/community/getEventView.do?seq=116&schPageSize=5">가입인사</a></li>
											<li><a href="/front/community/getAttendanceCheck.do">출석체크</a></li>
											<!--<li><a href="/front/community/getExperienceList.do">베이비밀 체험후기</a></li>-->
											<!-- <li><a href="/front/community/getUserRecipeList.do">나만의 레시피</a></li> -->											
											<!--<li><a href="/front/customer/getPDCOrderRequest.do">제휴프로모션</a></li>-->
											<!--
											<li><a href="/community/getCookRecipeList.do">골고루쿡 레시피</a></li>											
											<li class="subBold"><a href="/front/community/getRecipeRounge.do">레시피 라운지</a></li>
											<li><a href="/front/community/getMasterRecipeList.do">전문가 레시피</a></li>
											<li class="subBold"><a href="/front/community/getPremierLounge.do">프리미어라운지</a></li>
											<li><a href="/front/community/getNewProductList.do">신제품 사전평가</a></li>
											<li><a href="/front/community/getMakeTogetherList.do">함께만드는 베이비밀</a></li>
											<li><a href="/front/community/getSecretNewsList.do">시크릿뉴스</a></li>
											-->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu04">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">일일배달 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_2">택배배송 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/partnerStory">배달 스토리</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/newcouponInfo">신규 고객 쿠폰 혜택</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/gradecouponInfo">고객 등급별 쿠폰 혜택</a></li>
											<!-- <li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/entrust">배달점 소개</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu05">
										<ul>
											<li class="subBold"><a href="/front/shop/getShopMain.do">전체 제품 보기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0001">초기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0002">중기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0003">후기2팩</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0078">후기2팩+1팩</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0023">후기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0004">병행기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0005">완료기2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0013">완료기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0007">영양덮밥2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0024">영양덮밥3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0025">영양덮밥플러스</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=4&goodsCode=0016">DIY이유식</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0008">아이반찬·소스</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=3&goodsCode=0010">퓨레</a></li>
											<li class="subBold"><a href="/front/shop/getProductFullVitaList.do">건강식품</a></li>
											<!--<li class="subBold"><a href="/front/customer/getTelOrderRequest.do">장기구매(8주) 상담접수</a></li>
											<li class="subBold"><a href="/front/shop/getProductRecaroList.do">브랜드제휴</a></li>-->
											<!--<li class="subBold"><a href="/front/shop/getProductDealList.do">수퍼베추딜</a></li>-->
											
										</ul>
										<span class="subarrow"></span>
									</li>
								</ul>
							</div>
<script type="text/javascript">							
							
function fnMove(val) {
	var url = location.host;
	
	var port = "8447";
	if(url != null){
		if(url.indexOf('babymeal') > 0)
			port = "8446";
	}
	location.href = 'https://' + url + ':' + port + val;
}
</script>							
							<!-- subInner area END -->
						</div>
					</li>
					<!-- End 제품소개-->
					<!-- 커뮤니티 -->
					<li class="communitymenu">
						<span><a href="/front/community/getEventList.do">이벤트/커뮤니티</a></span>
						<div class="spread">
							<!-- subInner area STD -->
							
							<div class="sub_inner">
								<div class="gnbImg">
									<img src="/images/front/gnb_img.png" width="250" height="300" alt="프리미엄 베이비밀" />
								</div>
								<ul class="submenu">
									<li class="menu01">
										<ul>
											<li class="subBold">베이비&키즈 소개</li>											
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 소개</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/material">바른재료</a></li>											
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/haccp_n">안심기준</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/process_n">생산공정</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/video">영상보기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/history">브랜드히스토리</a></li> -->
											<li class="subBold">베이비밀 특징</li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/program_n">월령별 맞춤 프로그램</a></li>
											<!--<li><a href="/front/community/getEventView.do?seq=3">이것이 이유식이다</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/mom_letter">바른맘께 전하는 편지</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/5aday">5 a Day 캠페인</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu02">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">전체 제품 소개</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">베이비밀(첫돌 이전)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">초기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_2">중기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_3">후기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_4">병행기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_5">완료기</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">키즈밀(첫돌 이후)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">영양덮밥</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_0">영양덮밥플러스</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3">아이반찬·소스</a></li>
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3_1">골고루쿡</a></li> -->
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_5">간식(퓨레)</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_7">가격안내</a></li>											
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu03">
										<ul>
											<li class="subBold"><a href="/front/community/getEventList.do">이벤트</a></li>											
											<!--<li><a href="/front/promotion/getEventGCampaign.do?seq=99999&schPageSize=5">골고루쿡 체험신청</a></li>-->
											<li style="letter-spacing:-1px"><a href="/front/promotion/getEventCampaign.do">생애 첫 이유식 무료지원</a></li>
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=144&schPageSize=5">속편한 이유식 경품대방출</a></li>-->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=154&schPageSize=5">신규고객 최대2만원 할인</a></li> -->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=164&schPageSize=5">브랜드위크20%할인</a></li> -->
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=135&schPageSize=5">키즈밀사고 유산균받자</a></li>
											<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=136&schPageSize=5">첫구매하고 식기세트받자</a></li>-->
											
											<!-- <li><a href="/front/shop/getProductHalfShop.do">반값체험단</a></li>
											<li><a href="/front/shop/getProductHalfShop.do">키즈밀 유료체험단</a></li> -->
											<!--<li><a href="/front/community/getEventView.do?currentPage=1&schType=&seq=85&schKeyword=">고객 쿠폰지원</a></li>-->
											<li><a href="/front/community/getEventList.do">진행중인 이벤트</a></li>
											<!--<li><a href="/front/community/getEventList.do?schType=end">마감된 이벤트</a></li>-->
											<!--<li><a href="/front/community/getEventList.do?schType=off">오프라인 이벤트</a></li>-->
											<!--<li class="subBold"><a href="/front/community/getExperienceList.do">커뮤니티</a></li>-->
											<li><a href="/front/community/getEventView.do?seq=116&schPageSize=5">가입인사</a></li>
											<li><a href="/front/community/getAttendanceCheck.do">출석체크</a></li>
											<!--<li><a href="/front/community/getExperienceList.do">베이비밀 체험후기</a></li>-->
											<!-- <li><a href="/front/community/getUserRecipeList.do">나만의 레시피</a></li> -->											
											<!--<li><a href="/front/customer/getPDCOrderRequest.do">제휴프로모션</a></li>-->
											<!--
											<li><a href="/community/getCookRecipeList.do">골고루쿡 레시피</a></li>											
											<li class="subBold"><a href="/front/community/getRecipeRounge.do">레시피 라운지</a></li>
											<li><a href="/front/community/getMasterRecipeList.do">전문가 레시피</a></li>
											<li class="subBold"><a href="/front/community/getPremierLounge.do">프리미어라운지</a></li>
											<li><a href="/front/community/getNewProductList.do">신제품 사전평가</a></li>
											<li><a href="/front/community/getMakeTogetherList.do">함께만드는 베이비밀</a></li>
											<li><a href="/front/community/getSecretNewsList.do">시크릿뉴스</a></li>
											-->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu04">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">일일배달 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_2">택배배송 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/partnerStory">배달 스토리</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/newcouponInfo">신규 고객 쿠폰 혜택</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/gradecouponInfo">고객 등급별 쿠폰 혜택</a></li>
											<!-- <li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/entrust">배달점 소개</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu05">
										<ul>
											<li class="subBold"><a href="/front/shop/getShopMain.do">전체 제품 보기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0001">초기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0002">중기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0003">후기2팩</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0078">후기2팩+1팩</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0023">후기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0004">병행기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0005">완료기2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0013">완료기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0007">영양덮밥2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0024">영양덮밥3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0025">영양덮밥플러스</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=4&goodsCode=0016">DIY이유식</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0008">아이반찬·소스</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=3&goodsCode=0010">퓨레</a></li>
											<li class="subBold"><a href="/front/shop/getProductFullVitaList.do">건강식품</a></li>
											<!--<li class="subBold"><a href="/front/customer/getTelOrderRequest.do">장기구매(8주) 상담접수</a></li>
											<li class="subBold"><a href="/front/shop/getProductRecaroList.do">브랜드제휴</a></li>-->
											<!--<li class="subBold"><a href="/front/shop/getProductDealList.do">수퍼베추딜</a></li>-->
											
										</ul>
										<span class="subarrow"></span>
									</li>
								</ul>
							</div>
<script type="text/javascript">							
							
function fnMove(val) {
	var url = location.host;
	
	var port = "8447";
	if(url != null){
		if(url.indexOf('babymeal') > 0)
			port = "8446";
	}
	location.href = 'https://' + url + ':' + port + val;
}
</script>							
							<!-- subInner area END -->
						</div>
					</li>
					<!-- End 커뮤니티-->
					<!-- 배달서비스 -->
					<li class="deliverymenu">
						<span><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">서비스</a></span>
						<div class="spread">
							<!-- subInner area STD -->
							
							<div class="sub_inner">
								<div class="gnbImg">
									<img src="/images/front/gnb_img.png" width="250" height="300" alt="프리미엄 베이비밀" />
								</div>
								<ul class="submenu">
									<li class="menu01">
										<ul>
											<li class="subBold">베이비&키즈 소개</li>											
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 소개</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/material">바른재료</a></li>											
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/haccp_n">안심기준</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/process_n">생산공정</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/video">영상보기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/history">브랜드히스토리</a></li> -->
											<li class="subBold">베이비밀 특징</li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/program_n">월령별 맞춤 프로그램</a></li>
											<!--<li><a href="/front/community/getEventView.do?seq=3">이것이 이유식이다</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/mom_letter">바른맘께 전하는 편지</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/5aday">5 a Day 캠페인</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu02">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">전체 제품 소개</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">베이비밀(첫돌 이전)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">초기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_2">중기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_3">후기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_4">병행기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_5">완료기</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">키즈밀(첫돌 이후)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">영양덮밥</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_0">영양덮밥플러스</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3">아이반찬·소스</a></li>
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3_1">골고루쿡</a></li> -->
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_5">간식(퓨레)</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_7">가격안내</a></li>											
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu03">
										<ul>
											<li class="subBold"><a href="/front/community/getEventList.do">이벤트</a></li>											
											<!--<li><a href="/front/promotion/getEventGCampaign.do?seq=99999&schPageSize=5">골고루쿡 체험신청</a></li>-->
											<li style="letter-spacing:-1px"><a href="/front/promotion/getEventCampaign.do">생애 첫 이유식 무료지원</a></li>
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=144&schPageSize=5">속편한 이유식 경품대방출</a></li>-->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=154&schPageSize=5">신규고객 최대2만원 할인</a></li> -->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=164&schPageSize=5">브랜드위크20%할인</a></li> -->
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=135&schPageSize=5">키즈밀사고 유산균받자</a></li>
											<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=136&schPageSize=5">첫구매하고 식기세트받자</a></li>-->
											
											<!-- <li><a href="/front/shop/getProductHalfShop.do">반값체험단</a></li>
											<li><a href="/front/shop/getProductHalfShop.do">키즈밀 유료체험단</a></li> -->
											<!--<li><a href="/front/community/getEventView.do?currentPage=1&schType=&seq=85&schKeyword=">고객 쿠폰지원</a></li>-->
											<li><a href="/front/community/getEventList.do">진행중인 이벤트</a></li>
											<!--<li><a href="/front/community/getEventList.do?schType=end">마감된 이벤트</a></li>-->
											<!--<li><a href="/front/community/getEventList.do?schType=off">오프라인 이벤트</a></li>-->
											<!--<li class="subBold"><a href="/front/community/getExperienceList.do">커뮤니티</a></li>-->
											<li><a href="/front/community/getEventView.do?seq=116&schPageSize=5">가입인사</a></li>
											<li><a href="/front/community/getAttendanceCheck.do">출석체크</a></li>
											<!--<li><a href="/front/community/getExperienceList.do">베이비밀 체험후기</a></li>-->
											<!-- <li><a href="/front/community/getUserRecipeList.do">나만의 레시피</a></li> -->											
											<!--<li><a href="/front/customer/getPDCOrderRequest.do">제휴프로모션</a></li>-->
											<!--
											<li><a href="/community/getCookRecipeList.do">골고루쿡 레시피</a></li>											
											<li class="subBold"><a href="/front/community/getRecipeRounge.do">레시피 라운지</a></li>
											<li><a href="/front/community/getMasterRecipeList.do">전문가 레시피</a></li>
											<li class="subBold"><a href="/front/community/getPremierLounge.do">프리미어라운지</a></li>
											<li><a href="/front/community/getNewProductList.do">신제품 사전평가</a></li>
											<li><a href="/front/community/getMakeTogetherList.do">함께만드는 베이비밀</a></li>
											<li><a href="/front/community/getSecretNewsList.do">시크릿뉴스</a></li>
											-->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu04">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">일일배달 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_2">택배배송 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/partnerStory">배달 스토리</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/newcouponInfo">신규 고객 쿠폰 혜택</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/gradecouponInfo">고객 등급별 쿠폰 혜택</a></li>
											<!-- <li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/entrust">배달점 소개</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu05">
										<ul>
											<li class="subBold"><a href="/front/shop/getShopMain.do">전체 제품 보기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0001">초기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0002">중기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0003">후기2팩</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0078">후기2팩+1팩</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0023">후기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0004">병행기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0005">완료기2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0013">완료기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0007">영양덮밥2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0024">영양덮밥3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0025">영양덮밥플러스</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=4&goodsCode=0016">DIY이유식</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0008">아이반찬·소스</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=3&goodsCode=0010">퓨레</a></li>
											<li class="subBold"><a href="/front/shop/getProductFullVitaList.do">건강식품</a></li>
											<!--<li class="subBold"><a href="/front/customer/getTelOrderRequest.do">장기구매(8주) 상담접수</a></li>
											<li class="subBold"><a href="/front/shop/getProductRecaroList.do">브랜드제휴</a></li>-->
											<!--<li class="subBold"><a href="/front/shop/getProductDealList.do">수퍼베추딜</a></li>-->
											
										</ul>
										<span class="subarrow"></span>
									</li>
								</ul>
							</div>
<script type="text/javascript">							
							
function fnMove(val) {
	var url = location.host;
	
	var port = "8447";
	if(url != null){
		if(url.indexOf('babymeal') > 0)
			port = "8446";
	}
	location.href = 'https://' + url + ':' + port + val;
}
</script>							
							<!-- subInner area END -->
						</div>
					</li>
					<!-- End 배달서비스-->
					<!-- SHOP -->
					<li class="shopmenu">
						<span class="shopmenu"><a href="/front/shop/getShopMain.do"><span class="shopicon_n"></span><em>SHOP</em></a></span>
						<div class="spread">
							<!-- subInner area STD -->
							
							<div class="sub_inner">
								<div class="gnbImg">
									<img src="/images/front/gnb_img.png" width="250" height="300" alt="프리미엄 베이비밀" />
								</div>
								<ul class="submenu">
									<li class="menu01">
										<ul>
											<li class="subBold">베이비&키즈 소개</li>											
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/introduction_n">브랜드 소개</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/material">바른재료</a></li>											
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/haccp_n">안심기준</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/process_n">생산공정</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/video">영상보기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/history">브랜드히스토리</a></li> -->
											<li class="subBold">베이비밀 특징</li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/program_n">월령별 맞춤 프로그램</a></li>
											<!--<li><a href="/front/community/getEventView.do?seq=3">이것이 이유식이다</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/mom_letter">바른맘께 전하는 편지</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/5aday">5 a Day 캠페인</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu02">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_9">전체 제품 소개</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">베이비밀(첫돌 이전)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_1">초기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_2">중기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_3">후기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_4">병행기</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_5">완료기</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">키즈밀(첫돌 이후)</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2">영양덮밥</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_2_0">영양덮밥플러스</a></li>
											<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3">아이반찬·소스</a></li>
											<!-- <li><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_3_1">골고루쿡</a></li> -->
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_5">간식(퓨레)</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/product/product_7">가격안내</a></li>											
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu03">
										<ul>
											<li class="subBold"><a href="/front/community/getEventList.do">이벤트</a></li>											
											<!--<li><a href="/front/promotion/getEventGCampaign.do?seq=99999&schPageSize=5">골고루쿡 체험신청</a></li>-->
											<li style="letter-spacing:-1px"><a href="/front/promotion/getEventCampaign.do">생애 첫 이유식 무료지원</a></li>
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=144&schPageSize=5">속편한 이유식 경품대방출</a></li>-->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=154&schPageSize=5">신규고객 최대2만원 할인</a></li> -->
											<!-- <li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=164&schPageSize=5">브랜드위크20%할인</a></li> -->
											<!--<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=135&schPageSize=5">키즈밀사고 유산균받자</a></li>
											<li style="letter-spacing:-1px"><a href="/front/community/getEventView.do?seq=136&schPageSize=5">첫구매하고 식기세트받자</a></li>-->
											
											<!-- <li><a href="/front/shop/getProductHalfShop.do">반값체험단</a></li>
											<li><a href="/front/shop/getProductHalfShop.do">키즈밀 유료체험단</a></li> -->
											<!--<li><a href="/front/community/getEventView.do?currentPage=1&schType=&seq=85&schKeyword=">고객 쿠폰지원</a></li>-->
											<li><a href="/front/community/getEventList.do">진행중인 이벤트</a></li>
											<!--<li><a href="/front/community/getEventList.do?schType=end">마감된 이벤트</a></li>-->
											<!--<li><a href="/front/community/getEventList.do?schType=off">오프라인 이벤트</a></li>-->
											<!--<li class="subBold"><a href="/front/community/getExperienceList.do">커뮤니티</a></li>-->
											<li><a href="/front/community/getEventView.do?seq=116&schPageSize=5">가입인사</a></li>
											<li><a href="/front/community/getAttendanceCheck.do">출석체크</a></li>
											<!--<li><a href="/front/community/getExperienceList.do">베이비밀 체험후기</a></li>-->
											<!-- <li><a href="/front/community/getUserRecipeList.do">나만의 레시피</a></li> -->											
											<!--<li><a href="/front/customer/getPDCOrderRequest.do">제휴프로모션</a></li>-->
											<!--
											<li><a href="/community/getCookRecipeList.do">골고루쿡 레시피</a></li>											
											<li class="subBold"><a href="/front/community/getRecipeRounge.do">레시피 라운지</a></li>
											<li><a href="/front/community/getMasterRecipeList.do">전문가 레시피</a></li>
											<li class="subBold"><a href="/front/community/getPremierLounge.do">프리미어라운지</a></li>
											<li><a href="/front/community/getNewProductList.do">신제품 사전평가</a></li>
											<li><a href="/front/community/getMakeTogetherList.do">함께만드는 베이비밀</a></li>
											<li><a href="/front/community/getSecretNewsList.do">시크릿뉴스</a></li>
											-->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu04">
										<ul>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_1">일일배달 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/delivery_2">택배배송 안내</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/partnerStory">배달 스토리</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/newcouponInfo">신규 고객 쿠폰 혜택</a></li>
											<li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/gradecouponInfo">고객 등급별 쿠폰 혜택</a></li>
											<!-- <li class="subBold"><a href="/common/forwardPage.do?forwardPage=babymeal/front/delivery/entrust">배달점 소개</a></li> -->
										</ul>
										<span class="subarrow"></span>
									</li>
									<li class="menu05">
										<ul>
											<li class="subBold"><a href="/front/shop/getShopMain.do">전체 제품 보기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0001">초기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0002">중기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0003">후기2팩</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0078">후기2팩+1팩</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0023">후기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0004">병행기</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0005">완료기2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=1&goodsCode=0013">완료기3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0007">영양덮밥2팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0024">영양덮밥3팩</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0025">영양덮밥플러스</a></li>
											<!--<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=4&goodsCode=0016">DIY이유식</a></li>-->
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=2&goodsCode=0008">아이반찬·소스</a></li>
											<li class="subBold"><a href="/front/shop/getProductShop.do?categoryType=1&categorySeq=3&goodsCode=0010">퓨레</a></li>
											<li class="subBold"><a href="/front/shop/getProductFullVitaList.do">건강식품</a></li>
											<!--<li class="subBold"><a href="/front/customer/getTelOrderRequest.do">장기구매(8주) 상담접수</a></li>
											<li class="subBold"><a href="/front/shop/getProductRecaroList.do">브랜드제휴</a></li>-->
											<!--<li class="subBold"><a href="/front/shop/getProductDealList.do">수퍼베추딜</a></li>-->
											
										</ul>
										<span class="subarrow"></span>
									</li>
								</ul>
							</div>
<script type="text/javascript">							
							
function fnMove(val) {
	var url = location.host;
	
	var port = "8447";
	if(url != null){
		if(url.indexOf('babymeal') > 0)
			port = "8446";
	}
	location.href = 'https://' + url + ':' + port + val;
}
</script>							
							<!-- subInner area END -->
						</div>
					</li>
					<!-- End SHOP-->
					<!-- <li>
						<a href="/front/getKidsMain.do?site=kids"><img src="/images/front/main_n/mainbutt_kiz_go.png" alt="키즈밀GO" width="137" height="47" /></a>
					</li> -->
					<!-- <div id="goKidsMain">
						<a href="/front/getKidsMain.do"><img src="/images/front/main_n/mainbutt_kiz_go.png" alt="키즈밀GO" width="137" height="47" /></a>
					</div> -->
					<!--<li>
						<a href="/front/getKidsMain.do"><img src="/images/front/main_n/mainbutt_kiz_go.png" alt="키즈밀GO" width="137" height="47" /></a>
					</li>-->
					<div class="clearfix"></div>
					<!--<a href="/front/getKidsMain.do"><img src="/images/front/main_n/mainbutt_kiz_go.png" alt="키즈밀GO" width="137" height="47" /></a> -->
				</ul>
				<div class="clearfix"></div>
			</div>
			<!-- End header_inner-->
		</div>
		<div id="siteSelect">
			<div class="inner">
				<div class="siteInfo">
					<img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_info_logo.jpg">
					<p>건강한 생활을 선도하는 <br/>로하스생활기업, <br/>풀무원건강생활입니다.</p>
					<a href="http://www.pulmuonelohas.co.kr" target="_blank">사이트 바로가기</a>
				</div>
				<ul class="siteList">
					<li class="li1"><a href="http://www.pulmuoneha.co.kr" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_02.jpg"></a></li>
					<li class="li2"><a href="https://www.pulmuoneha.com/pc/shop/index.do" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_03.jpg"></a></li>
					<li class="li3"><a href="http://www.greenjuice.co.kr" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_01.jpg"></a></li>
					<li class="li4"><a href="http://www.eatsslim.co.kr" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_07.jpg"></a></li>
					<li class="li5"><a href="http://www.baby-kids.co.kr" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_04.jpg"></a></li>
					<li class="li6"><a href="http://www.pulmuoneamio.com" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_05.jpg"></a></li>
					<li class="li7"><a href="http://www.pulmuoneduskin.co.kr" target="_blank"><img src="http://www.eatsslim.co.kr/dist/images/cat_sub/site_logo_06.jpg"></a></li>
					<li class="li8"></li>
				</ul>
			</div>
		</div>
		<div id="siteSelectBg"></div>
		<script type="text/javascript">
		$("#btnP, #siteSelectBg").click(function(){
				var siteSelect = $("#siteSelect"),
					siteSelectBg = $("#siteSelectBg");
				if(siteSelect.hasClass('on')){
					siteSelect.slideUp('normal');
					siteSelect.removeClass('on');
					siteSelectBg.hide();
					$('#btnP').find('.ico').attr('src','http://www.eatsslim.co.kr/dist/images/common/ico_redirect.png');
				}else{
					siteSelect.slideDown('normal');
					siteSelect.addClass('on');
					siteSelectBg.show();
					$('#btnP').find('.ico').attr('src','http://www.eatsslim.co.kr/dist/images/common/ico_redirect_up.png');
				}
			});
		function fnLogin(){
			var returnUrl = location.pathname + location.search;
			if(returnUrl == null && returnUrl == "") returnUrl = "/";
			document.cookie = "returnUrl" + "=" + escape(returnUrl) + "; path=/;";
			document.location.href = "/front/login/getSSOLoginForm.do";
		}
		</script>				
		<!-- End Header Include -->
	
	<!-- top area END -->

	<div class="subNavi">
		<div class="subNavi_inner">
			<ul class="depthNavi">
				<li class="home"><a href="/"></a></li>
				<li>고객센터</li>
				<li>공지사항<span class="depthsub"></span></li>
			</ul>
			<!-- share area STD -->
			
				
				<ul class="share_i">
					<li><a class="fb" href="http://www.facebook.com/share.php?u=http://www.babymeal.co.kr/frocustomgetNoticeList.do" target="share">Facebook</a></li>
					<li><a class="tw" href="http://twitter.com/share?url=http://www.babymeal.co.kr/frocustomgetNoticeList.do&text=BabyMeal" target="share">Twitter</a></li>
					<li><a class="pt" href="javascript:;" onclick="copyToClipboard('http://www.babymeal.co.kr/frocustomgetNoticeList.do');">Print</a></li>
				</ul>
			<!-- share area END -->
			<div class="clearfix"></div> 
		</div>
	</div>

	<!-- Std container -->
	<div id="container">
		<h1 class="title_top">고객센터</h1>
		<div class="full_column">
		
			<ul class="tabNavi tab5">
				<li class="active"><a href="/front/customer/getNoticeList.do"><span	class="doc_i"></span>공지사항</a></li>
				<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/customer/GuideStep1"><span class="guide_i"></span>이용안내</a></li>
				<li><a href="/front/customer/getInquiryForm.do"><span class="mail_i"></span>1:1문의하기</a></li>
				<li><a href="/front/customer/getFaqList.do"><span class="faq_i"></span>FAQ</a></li>
				<li><a href="/front/customer/getOutmallForm.do"><span class="order_i"></span>외부몰 주문조회</a></li>
			</ul>
		
			<div class="clearfix"></div>
		</div>
		<div class="seperater" style="margin-top: 10px; margin-bottom: 10px; background-color: transparent; height: 1px;"></div>
		<div class="full_column">
			<form name="searchFrm" id="searchFrm" method="post" action="/front/customer/getNoticeList.do">
				<input type="hidden" name="currentPage" 	id="currentPage" value="1" />
				<input type="hidden" name="seq" 			id="seq" />
				<input type="hidden" name="site" 			id="site" value="" />
				<div class="floatright">
					<label>
						<select name="schField" id="schField" style="width: 110px;" onchange="this.form.keyword.focus()">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
						</select>
					</label>
					<label>
						<input type="text" name="schKeyword" id="schKeyword" maxlength="30" size="30" value="" onfocus="this.select()" />
					</label>
					<label>
						<input type="submit" class="button dark small" name="button" value="검색" />
					</label>
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
		<div class="seperater" style="margin-top: 10px; margin-bottom: 10px; background-color: transparent; height: 1px;"></div>
		<div class="full_column">
			<table class="table_list" width="100%" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
					<col width="10%" />
					<col width="auto" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				
					
						
				<tr>
					<td>96</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85155)">[공지] 회원로그인 서비스 장애 상황 대응 DB 점검</a></td>
					<td>2018.01.12</td>
					<td>141</td>
				</tr>
						
				<tr>
					<td>95</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85153)">[공지] 홈페이지 통합 (베이비밀/키즈밀 통합) 12/26 적용 안내 </a></td>
					<td>2017.12.22</td>
					<td>336</td>
				</tr>
						
				<tr>
					<td>94</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85152)">[공지] 크리스마스 및 신정 배송휴무 안내</a></td>
					<td>2017.12.14</td>
					<td>2118</td>
				</tr>
						
				<tr>
					<td>93</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85151)">[공지] 홈페이지 이원화(베이비밀/키즈밀 분리) 11/01 적용 안내</a></td>
					<td>2017.10.24</td>
					<td>1229</td>
				</tr>
						
				<tr>
					<td>92</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85150)">[공지] 적립금 제도 폐지 안내 </a></td>
					<td>2017.09.26</td>
					<td>7479</td>
				</tr>
						
				<tr>
					<td>91</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85149)">[공지] 10월 추석연휴 배달휴무 안내</a></td>
					<td>2017.09.07</td>
					<td>6612</td>
				</tr>
						
				<tr>
					<td>90</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85147)">[공지] 베이비&키즈에서는 안전한 계란을 사용하고 있습니다.</a></td>
					<td>2017.08.16</td>
					<td>571</td>
				</tr>
						
				<tr>
					<td>89</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85146)">[공지] 8월 광복절 배달휴무 안내</a></td>
					<td>2017.07.27</td>
					<td>987</td>
				</tr>
						
				<tr>
					<td>88</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85145)">[공지] 6월 현충일 배달휴무 안내</a></td>
					<td>2017.05.30</td>
					<td>372</td>
				</tr>
						
				<tr>
					<td>87</td>
					<td class="title"><a href="javascript:;" onclick="fnNoticeView(85144)">[공지] 홈페이지 속도개선 및 안정화 점검 진행</a></td>
					<td>2017.05.16</td>
					<td>106</td>
				</tr>
						
					
					
						
			</table>
		</div>
		<div class="seperater" style="margin-top: 15px; margin-bottom: 15px; background-color: transparent; height: 1px;"></div>
		<!-- paging area STD -->
		
		
	
		<div class="pageNavi">
			<!-- First -->
			<a href="javascript:;" class="latelypostslink" onclick="frontPageSubmit(1);">&lt;&lt;</a>
			  
			<!-- Prev 10 -->  
			
				<a href="javascript:;" onclick="frontPageSubmit(1);">&lt;</a>
			
			
			
			<!-- Numbering -->
			
				
					<span class="current">1</span>
				
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(2);">2</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(3);">3</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(4);">4</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(5);">5</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(6);">6</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(7);">7</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(8);">8</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(9);">9</a>
				
			
				
				
					<a href="javascript:;" onclick="frontPageSubmit(10);">10</a>
				
			
			
			<!-- Next 10 -->
			
				<a href="javascript:;" class="firstpostslink" onclick="frontPageSubmit(10);">&gt;</a>
			
			
			
			<!-- Last -->
			<a href="javascript:;" class="nextpostslink" onclick="frontPageSubmit(10);">&gt;&gt;</a>
		</div>
	

		<!-- paging area END -->
		<div class="seperater" style="margin-top: 15px; margin-bottom: 15px; background-color: transparent; height: 1px;"></div>
	</div>
	<!-- End container -->
	
	<!-- footer area STD -->
	

<style>
#footer .footer_inner {width:1100px; margin:0 auto; position:relative;}
#footer .footer_inner:after {content:''; display:block; clear:both;}
#footer .simply_board {background:#939393; padding:37px 0;}
.simply_board .board_article {float:left; /* height:186px;  */position:relative;}
.simply_board .board_article h2 {line-height:24px; font-size:20px; font-weight:400; color:#fff; margin-bottom:16px;}
.simply_board .article_notice {width:285px; margin-right:96px;}
.simply_board .article_notice li a {display:block; width:100%; overflow:hidden; text-overflow:ellipsis;white-space:nowrap; line-height:36px; font-size:15px; color:#e0e0e0;}
.simply_board .article_notice .btn_more {position:absolute; top:0; right:0; font-size:13px; color:#dbdbdb; font-weight:300;}
.simply_board .article_guide {width:365px; margin-right:80px;}
.simply_board .article_guide ul {*zoom:1; margin-top:30px;}
.simply_board .article_guide ul:after {content:''; display:block; clear:both;}
.simply_board .article_guide li {float:left; margin-left:39px; text-align:center;}
.simply_board .article_guide li a {display:block;}
.simply_board .article_guide li a .circle {width:90px; height:90px; border-radius:50%; position:relative; background:#838383; margin-bottom:12px;}
.simply_board .article_guide li a .circle img {display:block; position:absolute; top:0; left:0; right:0; bottom:0; margin:auto;}
.simply_board .article_guide li a p {line-height:20px; font-size:15px; color:#e0e0e0;}
.simply_board .article_guide li:first-child {margin-left:0;}
.simply_board .article_cc .phonenum {padding-left:50px; background:url(http://www.eatsslim.co.kr/dist/images/common/ico_cc_tel.png) left center no-repeat; color:black; font-size:32px; line-height:50px; height:50px; margin-bottom:17px;}
.simply_board .article_cc h3 {line-height:22px; color:#e0e0e0; font-size:13px; font-weight:400; margin-bottom:3px;}
.simply_board .article_cc p {line-height:22px; color:#e0e0e0; font-size:13px; font-weight:300;}

.main_footer {padding:55px 0; background:#fff; margin-bottom:60px;}
.main_footer:after {content:''; display:block; clear:both;}
.main_footer .foot_logo {float:left; margin-top:16px;}
.main_footer .foot_content {float:left; margin-left:75px;}
.main_footer .foot_content .foot_nav {margin-bottom:11px;}
.main_footer .foot_content .foot_nav ul:after {content:''; display:block; clear:both;}
.main_footer .foot_content .foot_nav li {float:left; margin-left:31px; position:relative;}
.main_footer .foot_content .foot_nav li:after {content:''; width:1px; height:9px; background:#e3e3e3; position:absolute; top:5px; left:-16px;}
.main_footer .foot_content .foot_nav li:first-child {margin-left:0;}
.main_footer .foot_content .foot_nav li:first-child:after {width:0;}
.main_footer .foot_content .foot_nav li a {color:#999; font-size:13px; line-height:21px;}
.main_footer .foot_content .foot_nav li span {color:#666;}
.main_footer .foot_content .foot_address address {line-height:22px; font-weight:300; color:#999; font-size:13px; font-style:normal; margin-bottom:3px;}
.main_footer .foot_content .foot_address address span {width:0;margin:0 10px;}
.main_footer .foot_content .foot_address .copyright {line-height:22px; font-weight:300; color:#999; font-size:13px;}
.main_footer .foot_right {float:right;}
.main_footer .familysite {vertical-align: middle; text-align: right; position:relative;  margin-bottom:10px;}
.main_footer .familysite .fs_selector {line-height: 35px; color:#333333; font-size:13px; font-weight: 100; padding:0 17px; border:1px solid #939393; box-sizing: border-box; width:187px; background-color: #fff; text-align: left; z-index: 1; position:relative; outline:none;}
.main_footer .familysite .fs_selector img {position: absolute;right: 17px;top: 50%;margin-top: -3px;}
.main_footer .familysite.selected .fs_selector {box-shadow: 2px 2px 2px 0px rgba(0,0,0,0.22);border-top:0; }
.main_footer .familysite .site_list {position:absolute; max-height: 0px; width:187px; border:1px solid #939393; bottom:6px; right:0; box-sizing: border-box; overflow: hidden; background-color: #fff; text-align: left;
-webkit-transition: all 150ms ease;-moz-transition: all 150ms ease;-ms-transition: all 150ms ease;-o-transition: all 150ms ease;transition: all 150ms ease;}
.main_footer .familysite.selected .site_list {max-height: 280px; padding:3px 13px 3px 0; bottom:35px; overflow-y:auto;}
.main_footer .familysite .site_list a {line-height: 40px; display:block; padding:0 17px; width:100%; box-sizing: border-box; color:#666666; font-weight: 100; font-size:13px;}
.main_footer .familysite .site_list p:hover a {background-color:#e8ecf0;}
</style>
		<!-- Footer Include -->
		
		<!--<div id="footer_award">
			<div class="column">
				<div class="column_cont">
					<span class="img_award01"></span><em>여성 소비자가 뽑은 2012<br>프리미엄 브랜드 대상</em>
				</div>
				<div class="column_cont">
					<span class="img_award02"></span><em>2015 국제마케팅기구 안심경영부분<br>이유식 부문 특별상 수상</em>
				</div>
				<div class="column_cont">
					<span class="img_award03"></span><em>2015 한국산업의 구매안심지수<br>이유식 부분 1위 수상</em>
				</div>
			</div>
		</div>-->
		
		<div id="footer">
			<!-- Footer Include -->
			<div class="simply_board ff_noto">
				<div class="footer_inner">
					<div class="board_article article_notice">
						<h2 style="text-align:left;">공지사항</h2>
						<ul style="text-align:left;" id="ulNotice">
						<a href="/front/customer/getNoticeList.do" class="btn_more">+ more</a>
					</div>
					<div class="board_article article_guide">
						<!-- <h2>잇슬림 가이드</h2> -->
						<ul>
							<li>
							<a href="/front/customer/getFaqList.do">
								<div class="circle"><img src="http://www.eatsslim.co.kr/dist/images/common/ico_fguide_faq.png" alt="" /></div>
								<p>FAQ</p>
							</a>
							</li>
							<li>
							<a href="/front/customer/getInquiryForm.do">
								<div class="circle"><img src="http://www.eatsslim.co.kr/dist/images/common/ico_fguide_mantoman.png" alt="" /></div>
								<p>1:1 문의</p>
							</a>
							</li>
							<li>
							<!-- <a href="/shop/popup/AddressSearchJiPop.jsp?ztype=0003&lightbox[width]=808&lightbox[height]=740" class="lightbox">
								<div class="circle"><img src="/dist/images/common/ico_fguide_sdelivery.png" alt="" /></div>
								<p>배달지역 검색</p>
							</a> -->
							<a href="javascript:;" onclick="fnAddressSearch();">
								<div class="circle"><img src="http://www.eatsslim.co.kr/dist/images/common/ico_fguide_sdelivery.png" alt="" /></div>
								<p>배달지역 검색</p>
							</a>
							</li>
						</ul>
					</div>
					<div style="text-align:left;" class="board_article article_cc">
						<h2>고객기쁨센터</h2>
						<div class="phonenum">080.800.0433</div>
						<h3>기쁨센터 업무시간</h3>
						<p>평일 : 09:00 ~ 18:00  /  토요일 : 09:00 ~ 12:00<br>카카오톡 Yellow ID : 풀무원 베이비앤키즈</p>
					</div>
				</div>
			</div>
			<div class="main_footer ff_noto">
			<div class="footer_inner">
				<div class="foot_logo"><img src="http://www.eatsslim.co.kr/dist/images/common/f_logo.png" alt="풀무원건강생활" /></div>
				<div class="foot_content">
					<div class="foot_nav">
						<ul>
							<li><a href="http://www.pulmuonelohas.com/brand/baby-kids">회사소개</a></li>							
							<li><a href="http://www.pulmuonelohas.co.kr/lohas-life-companies/sustainable-business/consumer-oriented-management/ccm">CCM</a></li>
							<li><a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=3018198406&lightbox[width]=808&lightbox[height]=740&lightbox[iframe]=true" class="lightbox">사업자정보확인</a></li>
							<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/terms/terms">이용약관</a></li>
							<li><a href="/front/customer/getNoticeList.do">고객센터</a></li>
							<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/terms/privacy"><span>개인정보처리방침</span></a></li>
						</ul>
					</div>
					<div style="text-align:left;" class="foot_address">
						<address>풀무원건강생활(주) : 충청북도 증평군 도안면 원명로 35<span></span>대표이사 : 여익현<span></span>사업자등록번호 : 301-81-98406<br>통신판매업 신고 : 충북증평 00045<span></span>개인정보관리책임자 : 임채현<span></span>개인정보 보유기간 : 회원탈퇴시까지</address>
						<p class="copyright">Copyright&copy; Pulmuone Health&Living Co.Ltd. All rights reserved.</p>
					</div>
				</div>
				<div class="foot_right">
					<div class="familysite">
						<button type="button" class="fs_selector">패밀리사이트<img src="http://www.eatsslim.co.kr/dist/images/common/ico_familysite.png" alt=""></button>
						<div class="site_list">
							<p><a href="http://www.pulmuone.co.kr/" target="_blank">풀무원홀딩스</a></p>
							<p><a href="http://www.pulmuoneshop.co.kr/" target="_blank">풀무원샵</a></p>
							<p><a href="http://www.pulmuonelohas.co.kr" target="_blank">풀무원건강생활</a></p>
							<p><a href="http://www.pulmuone-lohas.com" target="_blank">풀무원로하스</a></p>
							<p><a href="http://www.baby-kids.co.kr/" target="_blank">풀무원베이비&키즈</a></p>
							<p><a href="http://www.pulmuonewater.com" target="_blank">풀무원샘물</a></p>
							<p><a href="http://www.greenjuice.co.kr" target="_blank">풀무원녹즙</a></p>
							<p><a href="http://www.orga.co.kr" target="_blank">올가홀푸드</a></p>
							<p><a href="http://www.foodmerce.co.kr" target="_blank">푸드머스</a></p>
							<p><a href="http://www.bruschetta.co.kr" target="_blank">브루스케타</a></p>
							<p><a href="http://www.kimchimuseum.co.kr" target="_blank">김치박물관</a></p>
							<p><a href="http://www.pungkyungmaru.co.kr" target="_blank">풍경마루</a></p>
							<p><a href="http://www.pulmuoneduskin.co.kr" target="_blank">풀무원더스킨</a></p>
							<p><a href="http://www.pulmuoneamio.com" target="_blank">풀무원아미오</a></p>
						</div>
					</div>
					<div class="foot_certificate">
						<img src="http://www.eatsslim.co.kr/dist/images/common/ico_footer_certify.png" alt="" />
					</div>
				</div>
			</div>
		</div>
			<!-- End footer_column -->
	</div>
		<!-- End footer Include -->
		
		<!-- Quick Include -->
		<div id="floatMenu" class="">
			<ul>
						
				<li><a href="/front/shop/getProductCart.do"><span class="qk01"></span>장바구니</a></li>
				<li><a href="javascript:;" onclick="fnAddressSearch();"><span class="qk02"></span>배달유형<br />검색</a></li>
				<li><a href="/front/mypage/getMemberOrderList.do"><span class="qk03"></span>배송스케줄<br />셀프조정</a></li>
				<li><a href="/front/customer/getOutmallForm.do" target="_self"><span class="qk04"></span>외부몰<br />주문조회</a></li>
				<li><a href="javascript:;" onclick="fnMonthsMenu();"><span class="qk05"></span>이달의<br />식단</a></li>
				<li><a href="/common/forwardPage.do?forwardPage=babymeal/front/brand/service"><span class="qk07"></span>주문에서<br />배달까지</a></li>
				<li><a href="/front/customer/getInquiryForm.do"><span class="qk06"></span>1:1문의</a></li>
				<li class="top"><a href="#"></a></li>
			
			</ul>
		</div>
		<!-- End Quick Include -->
		<script type="text/javascript">
		// Floating Menu //
		$(function() {	
			var msie6 = $.browser == 'msie' && $.browser.version < 7;
	
			if (!msie6) {
				var top = $('#floatMenu').offset().top
						- parseFloat($('#floatMenu').css('margin-top').replace(
								/auto/, 0));
				$(window).scroll(function(event) {
					// what the y position of the scroll is
					var y = $(this).scrollTop();
	
					// whether that's below the form
					if (y >= top) {
						// if so, ad the fixed class
						$('#floatMenu').addClass('fixed');
					} else {
						// otherwise remove it
						$('#floatMenu').removeClass('fixed');
					}
				});
			}
			fnOneNotice();
		});
		function fnOneNotice() {
			var txt = ""; 

			$.ajax({
				type :'POST',
				url: "/front/customer/getNoticeOneList.do",
				//data :  "",
				dataType:"json",
				success:function(responseData){
					//if(responseData.result != null && responseData.result.resultList.length > 0){
						//$("#topNotice").html('<font color="white">' + responseData.result.resultList[0].title + '</font>');
					//}
					if(responseData.result != null && responseData.result.resultList.length > 0){				
						for(var idx = 0; idx < 4; idx++) {						
							txt += '<li>';
							txt += '<a href="/front/customer/getNoticeView.do?currentPage=1&seq='+ responseData.result.resultList[idx].seq + '&schField=TITLE&schKeyword=">';
							txt += responseData.result.resultList[idx].title;				           	
							txt += '</a>';
							txt += '</li>';
						}
					}
					$("#ulNotice").html(txt);
				},
				error:function(xhr, textStatus, errorThrown){
					alert("관리자에게 문의 하세요.");
				}
			});
		}
		function fnMonthsMenu(val){
			var w = 1020;
			var h = 900;
			var left = (screen.width/2)-(w/2);
			var top = (screen.height/2)-(h/2);
			var features = 'toolbar=no, location=no, directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width='+w+',height='+h+',top='+top+',left='+left;
			if(val=="kids")
				var popup = window.open("/front/mypage/getMonthMenuPop.do?site=kids&goodsGorupId=0007", 'DeliveryChangeDatePop', features);
			else
				var popup = window.open("/front/mypage/getMonthMenuPop.do", 'DeliveryChangeDatePop', features);
			
			popup.focus();
		}
		
		function fnAddressSearch(){
			var w = 800;
			var h = 650;
			var left = (screen.width/2)-(w/2);
			var top = (screen.height/2)-(h/2);
			//var features = 'toolbar=no, location=no, directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,width='+w+',height='+h+',top='+top+',left='+left;
			//var popup = window.open("/front/common/getDeliverySearchPop.do", 'AddressPop', features);
			var features = 'toolbar=no, directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width='+w+',height='+h+',top='+top+',left='+left;
			var popup =window.open("/front/common/getAddressSearchJiPop.do?t=c", 'AddressPop', features);
			popup.focus();
		}
		</script>
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
<!--20160218 스크립트변경-->
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
//wcs_add["wa"] = "s_21c6843ec726";
wcs_add["wa"] = "s_2dc62f6f179";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>
<!--<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "75c04b93692dcc";
wcs_do();
</script>--><!-- 이희정용 -->
 
<script language='javascript' type='text/javascript'> 
var mr_id = 'member';	// 로그인 회원판단( 'member' 고정값)
var mr_ag = 0 ; 		// 로그인사용자 나이 (회원의 연령대 분석)
var mr_gd = ''; 		// 로그인사용자 성별 ('man' , 'woman')
</script> 
<!-- AceClick WebSite Gathering Script V0.9.20131114 -->
<script type="text/Javascript">
if(typeof(AMRS_GC)=='undefined'){
 var AMRS_O=[];var AMRS_CK = new Image();var AMRS_GC='AG6A392928575';var AMRS_GD='mrsg.aceclick.co.kr';var AMRS_GP='8080';var AMRS_TI=(new Date()).getTime();
 var AMRS_PR = location.protocol=="https:"?"https://"+AMRS_GD+":843":"http://"+AMRS_GD+":"+AMRS_GP; AMRS_CK.src = AMRS_PR+'/?cookie'; 
 if(typeof(Array.prototype.push)!='undefined'){ AMRS_O.push(AMRS_CK);}
 document.writeln("<scr"+"ipt type='text/Javascript' src='"+location.protocol+"//mrss.aceclick.co.kr/aceclick.js?rt="+AMRS_TI+"'></scr"+"ipt>");
}
</script>
<!-- AceClick WebSite Gathering Script End V0.9.20131114 -->
<!-- AceCounter Log Gathering Script V.70.2012031601 -->
<script language='javascript'>
if( typeof HL_GUL == 'undefined' ){

var HL_GUL = 'ngc12.nsm-corp.com';var HL_GPT='80'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+HL_GUL:"http://"+HL_GUL+":"+HL_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };
var _JV="AMZ2014031401";//script Version
var HL_GCD = 'CS3B39477715891'; // gcode
var _UD='undefined';var _UN='unknown';
function _IX(s,t){return s.indexOf(t)}
function _GV(b,a,c,d){ var f = b.split(c);for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0) return f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length); }	return ''; }
function _XV(b,a,c,d,e){ var f = b.split(c);var g='';for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0){ try{eval(e+"=f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length);");}catch(_e){}; continue;}else{ if(g) g+= '&'; g+= f[i];}; } return g;};
function _NOB(a){return (a!=_UD&&a>0)?new Object(a):new Object()}
function _NIM(){return new Image()}
function _IL(a){return a!=_UD?a.length:0}
function _ILF(a){ var b = 0; try{eval("b = a.length");}catch(_e){b=0;}; return b; }
function _VF(a,b){return a!=_UD&&(typeof a==b)?1:0}
function _LST(a,b){if(_IX(a,b)>0){ a=a.substring(0,_IX(a,b));}; return a;}
function _CST(a,b){if(_IX(a,b)>0) a=a.substring(_IX(a,b)+_IL(b),_IL(a));return a}
function _UL(a){a=_LST(a,'#');a=_CST(a,'://');return a}
function _AA(a){return new Array(a?a:0)}
function _IDV(a){return (typeof a!=_UD)?1:0}
if(!_IDV(HL_GUL)) var HL_GUL ='ngc12.nsm-corp.com'; 
if(!_IDV(HL_GPT)) var HL_GPT ='80';
_DC = document.cookie ;
function _AGC(nm) { var cn = nm + "="; var nl = cn.length; var cl = _DC.length; var i = 0; while ( i < cl ) { var j = i + nl; if ( _DC.substring( i, j ) == cn ){ var val = _DC.indexOf(";", j ); if ( val == -1 ) val = _DC.length; return unescape(_DC.substring(j, val)); }; i = _DC.indexOf(" ", i ) + 1; if ( i == 0 ) break; } return ''; }
function _ASC( nm, val, exp ){var expd = new Date(); if ( exp ){ expd.setTime( expd.getTime() + ( exp * 1000 )); document.cookie = nm+"="+ escape(val) + "; expires="+ expd.toGMTString() +"; path="; }else{ document.cookie = nm + "=" + escape(val);};}
function SetUID() {     var newid = ''; var d = new Date(); var t = Math.floor(d.getTime()/1000); newid = 'UID-' + t.toString(16).toUpperCase(); for ( var i = 0; i < 16; i++ ){ var n = Math.floor(Math.random() * 16).toString(16).toUpperCase(); newid += n; }       return newid; }
var _FCV = _AGC("ACEFCID"); if ( !_FCV ) { _FCV = SetUID(); _ASC( "ACEFCID", _FCV , 86400 * 30 * 12 ); _FCV=_AGC("ACEFCID");}
var _AIO = _NIM(); var _AIU = _NIM();  var _AIW = _NIM();  var _AIX = _NIM();  var _AIB = _NIM();  var __hdki_xit = _NIM();
var _gX='/?xuid='+HL_GCD+'&sv='+_JV,_gF='/?fuid='+HL_GCD+'&sv='+_JV,_gU='/?uid='+HL_GCD+'&sv='+_JV+"&FCV="+_FCV,_gE='/?euid='+HL_GCD+'&sv='+_JV,_gW='/?wuid='+HL_GCD+'&sv='+_JV,_gO='/?ouid='+HL_GCD+'&sv='+_JV,_gB='/?buid='+HL_GCD+'&sv='+_JV;

var _d=_rf=_end=_fwd=_arg=_xrg=_av=_bv=_rl=_ak=_xrl=_cd=_cu=_bz='',_sv=11,_tz=20,_ja=_sc=_ul=_ua=_UA=_os=_vs=_UN,_je='n',_bR='blockedReferrer';
if(!_IDV(_CODE)) var _CODE = '' ;
_tz = Math.floor((new Date()).getTimezoneOffset()/60) + 29 ;if( _tz > 24 ) _tz = _tz - 24 ;
// Javascript Variables
if(!_IDV(_amt)) var _amt=0 ;if(!_IDV(_pk)) var _pk='' ;if(!_IDV(_pd)) var _pd='';if(!_IDV(_ct)) var _ct='';
if(!_IDV(_ll)) var _ll='';if(!_IDV(_ag)) var _ag=0;	if(!_IDV(_id)) var _id='' ;if(!_IDV(_mr)) var _mr = _UN;
if(!_IDV(_gd)) var _gd=_UN;if(!_IDV(_jn)) var _jn='';if(!_IDV(_jid)) var _jid='';if(!_IDV(_skey)) var _skey='';
if(!_IDV(_ud1)) var _ud1='';if(!_IDV(_ud2)) var _ud2='';if(!_IDV(_ud3)) var _ud3='';
if( !_ag ){ _ag = 0 ; }else{ _ag = parseInt(_ag); }
if( _ag < 0 || _ag > 150 ){ _ag = 0; }
if( _gd != 'man' && _gd != 'woman' ){ _gd =_UN;};if( _mr != 'married' && _mr != 'single' ){ _mr =_UN;};if( _jn != 'join' && _jn != 'withdraw' ){ _jn ='';};
if( _ag > 0 || _gd == 'man' || _gd == 'woman'){ _id = 'undefined_member';}
if( _jid != '' ){ _jid = 'undefined_member'; }
_je = (navigator.javaEnabled()==true)?'1':'0';_bn=navigator.appName;
if(_bn.substring(0,9)=="Microsoft") _bn="MSIE";
_bN=(_bn=="Netscape"),_bI=(_bn=="MSIE"),_bO=(_IX(navigator.userAgent,"Opera")>-1);if(_bO)_bI='';
_bz=navigator.appName; _pf=navigator.platform; _av=navigator.appVersion; _bv=parseFloat(_av) ;
if(_bI){_cu=navigator.cpuClass;}else{_cu=navigator.oscpu;};
if((_bn=="MSIE")&&(parseInt(_bv)==2)) _bv=3.01;_rf=document.referrer;var _prl='';var _frm=false;
function _WO(a,b,c){window.open(a,b,c)}
function ACEF_Tracking(a,b,c,d,e,f){ if(!_IDV(b)){var b = 'FLASH';}; if(!_IDV(e)){ var e = '0';};if(!_IDV(c)){ var c = '';};if(!_IDV(d)){ var d = '';}; var a_org=a; b = b.toUpperCase(); var b_org=b;	if(b_org=='FLASH_S'){ b='FLASH'; }; if( typeof CU_rl == 'undefined' ) var CU_rl = _PT(); if(_IDV(HL_GCD)){ var _AF_rl = document.URL; if(a.indexOf('://') < 0  && b_org != 'FLASH_S' ){ var _AT_rl  = ''; if( _AF_rl.indexOf('?') > 0 ){ _AF_rl = _AF_rl.substring(0,_AF_rl.indexOf('?'));}; var spurl = _AF_rl.split('/') ;	for(var ti=0;ti < spurl.length ; ti ++ ){ if( ti == spurl.length-1 ){ break ;}; if( _AT_rl  == '' ){ _AT_rl  = spurl[ti]; }else{ _AT_rl  += '/'+spurl[ti];}; }; var _AU_arg = ''; if( a.indexOf('?') > 0 ){ _AU_arg = a.substring(a.indexOf('?'),a.length); a = a.substring(0,a.indexOf('?')); }; var spurlt = a.split('/') ; if( spurlt.length > 0 ){ a = spurlt[spurlt.length-1];}; a = _AT_rl +'/'+a+_AU_arg;	_AF_rl=document.URL;}; _AF_rl = _AF_rl.substring(_AF_rl.indexOf('//')+2,_AF_rl.length); if( typeof f == 'undefined' ){ var f = a }else{f='http://'+_AF_rl.substring(0,_AF_rl.indexOf('/')+1)+f}; var _AS_rl = CU_rl+'/?xuid='+HL_GCD+'&url='+escape(_AF_rl)+'&xlnk='+escape(f)+'&fdv='+b+'&idx='+e+'&'; var _AF_img = new Image(); _AF_img.src = _AS_rl; if( b_org == 'FLASH' && a_org != '' ){ if(c==''){ window.location.href = a_org; }else{ if(d==''){ window.open(a_org,c);}else{ window.open(a_org,c,d); };};	};} ; }
function _PT(){return location.protocol=="https:"?"https://"+HL_GUL:"http://"+HL_GUL+":"+HL_GPT}
function _EL(a,b,c){if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent("on"+b,c)} }
function _NA(a){return new Array(a?a:0)}
function HL_ER(a,b,c,d){_xrg=_PT()+_gW+"&url="+escape(_UL(document.URL))+"&err="+((typeof a=="string")?a:"Unknown")+"&ern="+c+"&bz="+_bz+"&bv="+_vs+"&RID="+Math.random()+"&";
if(_IX(_bn,"Netscape") > -1 || _bn == "Mozilla"){ setTimeout("_AIW.src=_xrg;",1); } else{ _AIW.src=_xrg; } }
function HL_PL(a){if(!_IL(a))a=_UL(document.URL);
_arg = _PT()+_gU;
if( typeof HL_ERR !=_UD && HL_ERR == 'err'){ _arg = _PT()+_gE;};
if( _ll.length > 0 ) _arg += "&md=b";
_AIU.src = _arg+"&url="+escape(a)+"&ref="+escape(_rf)+"&cpu="+_cu+"&bz="+_bz+"&bv="+_vs+"&os="+_os+"&dim="+_d+"&cd="+_cd+"&je="+_je+"&jv="+_sv+"&tz="+_tz+"&ul="+_ul+"&ad_key="+escape(_ak)+"&skey="+escape(_skey)+"&age="+_ag+"&gender="+_gd+"&marry="+_mr+"&join="+_jn+"&member_key="+_id+"&jid="+_jid+"&udf1="+_ud1+"&udf2="+_ud2+"&udf3="+_ud3+"&amt="+_amt+"&frwd="+_fwd+"&pd="+escape(_pd)+"&ct="+escape(_ct)+"&ll="+escape(_ll)+"&RID="+Math.random()+"&";
setTimeout("",300);
}
_EL(window,"error",HL_ER); //window Error
if( typeof window.screen == 'object'){_sv=12;_d=screen.width+'*'+screen.height;_sc=_bI?screen.colorDepth:screen.pixelDepth;if(_sc==_UD)_sc=_UN;}
_ro=_NA();if(_ro.toSource||(_bI&&_ro.shift))_sv=13;
if( top && typeof top == 'object' &&_ILF(top.frames)){eval("try{_rl=top.document.URL;}catch(_e){_rl='';};"); if( _rl != document.URL ) _frm = true;};
if(_frm){ eval("try{_prl = top.document.URL;}catch(_e){_prl=_bR;};"); if(_prl == '') eval("try{_prl=parent.document.URL;}catch(_e){_prl='';};"); 
if( _IX(_prl,'#') > 0 ) _prl=_prl.substring(0,_IX(_prl,'#')); 
_prl=_LST(_prl,'#');
if( _IX(_rf,'#') > 0 ) _rf=_rf.substring(0,_IX(_rf,'#')); 
if( _IX(_prl,'/') > 0 && _prl.substring(_prl.length-1,1) == '/' ) _prl =_prl.substring(0,_prl.length-1);
if( _IX(_rf,'/') > 0 && _rf.substring(_rf.length-1,1) == '/' ) _rf =_rf.substring(0,_rf.length-1);
if( _rf == '' ) eval("try{_rf=parent.document.URL;}catch(_e){_rf=_bR;}"); 
if(_rf==_bR||_prl==_bR){ _rf='',_prl='';}; if( _rf == _prl ){ eval("try{_rf=top.document.referrer;}catch(_e){_rf='';}"); 
if( _rf == ''){ _rf = 'bookmark';};if( _IX(document.cookie,'ACEN_CK='+escape(_rf)) > -1 ){ _rf = _prl;} 
else{ 
if(_IX(_prl,'?') > 0){ _ak = _prl.substring(_IX(_prl,'?')+1,_prl.length); _prl = _ak; }
if( _IX(_prl.toUpperCase(),'OVRAW=') >= 0 ){ _ak = 'src=overture&kw='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVRAW='+_GV(_prl.toUpperCase(),'OVRAW','&','=')+'&OVKEY='+_GV(_prl.toUpperCase(),'OVKEY','&','=')+'&OVMTC='+_GV(_prl.toUpperCase(),'OVMTC','&','=').toLowerCase() }; 
if(_IX(_prl,'gclid=') >= 0 ){ _ak='src=adwords'; }; if(_IX(_prl,'DWIT=') >= 0 ){_ak='src=dnet_cb';}; 
if( _IX(_prl,"rcsite=") >= 0 &&  _IX(_prl,"rctype=") >= 0){ _prl += '&'; _ak = _prl.substring(_IX(_prl,'rcsite='),_prl.indexOf('&',_IX(_prl,'rcsite=')+7))+'-'+_prl.substring(_IX(_prl,'rctype=')+7,_prl.indexOf('&',_IX(_prl,'rctype=')+7))+'&'; };
if( _GV(_prl,'src','&','=') ) _ak += '&src='+_GV(_prl,'src','&','='); if( _GV(_prl,'kw','&','=') ) _ak += '&kw='+_GV(_prl,'kw','&','='); 
if( _IX(_prl, 'FWDRL')> 0 ){ _prl = _XV(_prl,'FWDRL','&','=','_rf'); _rf = unescape(_rf); }; if( _IX(_ak,'FWDRL') > 0 ){_ak = _XV(_ak,'FWDRL','&','=','_prl');}; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref; _fwd = _GV(_prl,'FWDIDX','&','=');
document.cookie='ACEN_CK='+escape(_rf)+';path=/;'; 
}; 
if(document.URL.indexOf('?')>0 && ( _IX(_ak,'rcsite=') < 0 && _IX(_ak,'NVAR=') < 0 && _IX(_ak,'src=') < 0 && _IX(_ak,'source=') < 0 && _IX(_ak,'DMCOL=') < 0 ) ) _ak =document.URL.substring(document.URL.indexOf('?')+1,document.URL.length); }; 
}
else{ 
_rf=_LST(_rf,'#');_ak=_CST(document.URL,'?');
if( _IX(_ak,"rcsite=") > 0 &&  _IX(_ak,"rctype=") > 0){
    _ak += '&';
    _ak = _ak.substring(_IX(_ak,'rcsite='),_ak.indexOf('&',_IX(_ak,'rcsite=')+7))+'-'+_ak.substring(_IX(_ak,'rctype=')+7,_ak.indexOf('&',_IX(_ak,'rctype=')+7))+'&';
}
}
_rl=document.URL;
var _trl = _rl.split('?'); if(_trl.length>1){ if( _IX(_trl[1],'FWDRL') > 0 ){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _fwd = _GV(_trl[1],'FWDIDX','&','='); _rl=_trl.join('?'); };  if( _IX(_ak,'FWDRL') > 0 ){ _ak = _XV(_ak,'FWDRL','&','=','_prl');}; }; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
if( _rf.indexOf('googlesyndication.com') > 0 ){ 
var _rf_idx = _rf.indexOf('&url=');  if( _rf_idx > 0 ){ var _rf_t = unescape(_rf.substring(_rf_idx+5,_rf.indexOf('&',_rf_idx+5)));  if( _rf_t.length > 0 ){ _rf = _rf_t ;};  };  };
_rl = _UL(_rl); _rf = _UL(_rf);

if( typeof _rf_t != 'undefined' && _rf_t != '' ) _rf = _rf_t ;
if( typeof _ak_t != 'undefined' && _ak_t != '' ) _ak = _ak_t ;

if( typeof _rf==_UD||( _rf == '' )) _rf = 'bookmark' ;_cd=(_bI)?screen.colorDepth:screen.pixelDepth;
_UA = navigator.userAgent;_ua = navigator.userAgent.toLowerCase();
if (navigator.language){  _ul = navigator.language.toLowerCase();}else if(navigator.userLanguage){  _ul = navigator.userLanguage.toLowerCase();};

_st = _IX(_UA,'(') + 1;_end = _IX(_UA,')');_str = _UA.substring(_st, _end);_if = _str.split('; ');_cmp = _UN ;

if(_bI){ _cmp = navigator.appName; _str = _if[1].substring(5, _if[1].length); _vs = (parseFloat(_str)).toString();} 
else if ( (_st = _IX(_ua,"opera")) > 0){ _cmp = "Opera" ;_vs = _ua.substring(_st+6, _ua.indexOf('.',_st+6)); } 
else if ((_st = _IX(_ua,"firefox")) > 0){_cmp = "Firefox"; _vs = _ua.substring(_st+8, _ua.indexOf('.',_st+8)); } 
else if ((_st = _IX(_ua,"netscape6")) > 0){ _cmp = "Netscape"; _vs = _ua.substring(_st+10, _ua.length);  
if ((_st = _IX(_vs,"b")) > 0 ) { _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str ;  };}
else if ((_st = _IX(_ua,"netscape/7")) > 0){  _cmp = "Netscape";  _vs = _ua.substring(_st+9, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ){ _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str;};
}
else{
if (_IX(_ua,"gecko") > 0){ if(_IX(_ua,"safari")>0){ _cmp = "Safari";_ut = _ua.split('/');for( var ii=0;ii<_ut.length;ii++) if(_IX(_ut[ii],'safari')>0){ _vst = _ut[ii].split(' '); _vs = _vst[0];} }else{ _cmp = navigator.vendor;  } } else if (_IX(_ua,"nav") > 0){ _cmp = "Netscape Navigator";}else{ _cmp = navigator.appName;}; _av = _UA ; 
}
if (_IX(_vs,'.')<0){  _vs = _vs + '.0'}
_bz = _cmp; 


var nhn_ssn={uid:HL_GCD,g:HL_GUL,p:HL_GPT,s:_JV,rl:_rl,m:[],run:nhn_ssn?nhn_ssn.uid:this.uid};
function CS3B39477715891(){var f={e:function(s,t){return s.indexOf(t);},d:function(s){var r=String(s); return r.toUpperCase();},f:function(o){var a;a=o;if(f.d(a.tagName)=='A' || f.d(a.tagName)=='AREA'){return a;}else if(f.d(a.tagName)=='BODY'){return 0;}else{return f.f(a.parentNode);} },n:function(s){var str=s+"";var ret="";for(i = 0; i < str.length; i++){	var at = str.charCodeAt(i);var ch=String. fromCharCode(at);	if(at==10 || at==32){ret+=''+ch.replace(ch,'');}else if (at==34||at==39|at==35){ret+=''+ch.replace(ch,' ');	}else{ret+=''+ch;}  } return ret;},ea:function(c,f){var wd;if(c=='click'){wd=window.document;}else{wd=window;}if(wd.addEventListener){wd.addEventListener(c,f,false)}else if(wd.attachEvent){wd.attachEvent("on"+c,f)} } };
var p={h:location.host,p:(location.protocol=='https:')?"https://"+nhn_ssn.g:"http://"+nhn_ssn.g+":"+nhn_ssn.p,s:'/?xuid='+nhn_ssn.uid+'&sv='+nhn_ssn.s,u:function(){var r='';r=String(nhn_ssn.rl);var sh=r.indexOf('#'); if(sh!=-1){r=r.substring(0,sh);}return r+'';},ol:new Image(0,0),xL:function(x){if(typeof(Amz_T_e)==s.u){ p.ol.src=p.p+p.s+'&url='+escape(p.u())+'&xlnk='+escape(x)+'&xidx=0'+'&crn='+Math.random()+'&';nhn_ssn.m.push(p.ol);} } };
var s={Lp:'a.tagName=="B" || a.tagName=="I" || a.tagName== "U" || a.tagName== "FONT" || a.tagName=="I" || a.tagName=="STRONG"'  ,f:'function',	j:'javascript:',u:'undefined'};var c={Run:function(){f.ea('click',this.ec);},ec:function(e){var ok='';var m = document.all ? event.srcElement : e.target;var a=m;var o=m.tagName;if(o=="A" || o=="AREA" || o=="IMG" || eval(s.Lp)){ok=c.lc(m);if(ok.length != 0){p.xL(unescape(ok));};	};},lc:function(o){ try{var ar='';var obj;obj=f.f(o);if(typeof obj==s.u){return '';};if(typeof(obj.href)==s.u){return '';};ar = String(obj.href);if(ar.length == 0){return '';};ar=f.n(ar);if(f.e(ar,'void(') == -1 && f.e(ar,'void0') == -1){	return ar;}else{return s.j + 'void(0)';};return '';}catch(er){return '';} } };
if(p.u().charAt(1) != ':'){if(nhn_ssn.uid!=nhn_ssn.run){c.Run(); } };
};eval(nhn_ssn.uid + '();');


if( _IX(_pf,_UD) >= 0 || _pf ==  '' ){ _os = _UN ;}else{ _os = _pf ; };
if( _IX(_os,'Win32') >= 0 ){if( _IX(_av,'98')>=0){ _os = 'Windows 98';}else if( _IX(_av,'95')>=0 ){ _os = 'Windows 95';}else if( _IX(_av,'Me')>=0 ){ _os = 'Windows Me';}else if( _IX(_av,'NT')>=0 ){ _os = 'Windows NT';}else{ _os = 'Windows';};if( _IX(_ua,'nt 5.0')>=0){ _os = 'Windows 2000';};if( _IX(_ua,'nt 5.1')>=0){_os = 'Windows XP';if( _IX(_ua,'sv1') > 0 ){_os = 'Windows XP SP2';};};if( _IX(_ua,'nt 5.2')>=0){_os ='Windows Server 2003';};if( _IX(_ua,'nt 6.0')>=0){_os ='Windows Vista';};if( _IX(_ua,'nt 6.1')>=0){_os ='Windows 7';};};
_pf_s = _pf.substring(0,4);if( _pf_s == 'Wind'){if( _pf_s == 'Win1'){_os = 'Windows 3.1';}else if( _pf_s == 'Mac6' ){ _os = 'Mac';}else if( _pf_s == 'MacO' ){ _os ='Mac';}else if( _pf_s == 'MacP' ){_os='Mac';}else if(_pf_s == 'Linu'){_os='Linux';}else if( _pf_s == 'WebT' ){ _os='WebTV';}else if(  _pf_s =='OSF1' ){ _os ='Compaq Open VMS';}else if(_pf_s == 'HP-U' ){ _os='HP Unix';}else if(  _pf_s == 'OS/2' ){ _os = 'OS/2' ;}else if( _pf_s == 'AIX4' ){ _os = 'AIX';}else if( _pf_s == 'Free' ){ _os = 'FreeBSD';}else if( _pf_s == 'SunO' ){ _os = 'SunO';}else if( _pf_s == 'Drea' ){ _os = 'Drea'; }else if( _pf_s == 'Plan' ){ _os = 'Plan'; }else{ _os = _UN; };};
if( _cu == 'x86' ){ _cu = 'Intel x86';}else if( _cu == 'PPC' ){ _cu = 'Power PC';}else if( _cu == '68k' ){ _cu = 'Motorola 680x';}else if( _cu == 'Alpha' ){ _cu = 'Compaq Alpa';}else if( _cu == 'Arm' ){ _cu = 'ARM';}else{ _cu = _UN;};if( _d == '' || typeof _d==_UD ){ _d = '0*0';}

HL_PL(_rl); // Site Logging
}
</script>
<!-- AceCounter Log Gathering Script End -->
<!-- Withpang Tracker v2.0 start -->
<script type="text/javascript">

	(function (w, d, i) {
		w[i]={
			sc : (encodeURIComponent("")),
			form : (encodeURIComponent(d.referrer)),
			url : (encodeURIComponent(w.location.href))
		};

		if(w[i]) {
			var _ar = _ar || [];
			var _s = "log.dreamsearch.or.kr/servlet/rf";
			for(x in w[i]) _ar.push(x + "=" + w[i][x]);
			(new Image).src = d.location.protocol +"//"+ _s +"?"+ _ar.join("&");
		}
	})(window, document, "wp_rf");

</script>
<!-- Withpang Tracker v2.0 end -->

<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['gtp20.acecounter.com','8080','AM6A37750352759','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script>
<noscript><img src='http://gtp20.acecounter.com:8080/?uid=AM6A37750352759&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End --> 
<!-- Google 리마케팅 태그 코드 -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 821531361;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/821531361/?guid=ON&amp;script=0"/>
</div>
</noscript>

	<!-- footer area END -->
</div>
<!-- End wrap -->
<!-- custom javascript area -->
<script type="text/javascript">
$(document).ready(function() {
	// 검색조건 설정
	if ("" != "") {
		$("#schField").val("");
	}
	
	// Select Box //
	$("SELECT").selectBox();
});

function fnNoticeView(seq) {
	$("#seq").val(seq);
	$("form[name=searchFrm]").attr("action", "/front/customer/getNoticeView.do");
	//submitGet(document.searchFrm);
	submitPost(document.searchFrm);
}
</script>
<!-- custom javascript area -->
</body>
</html>