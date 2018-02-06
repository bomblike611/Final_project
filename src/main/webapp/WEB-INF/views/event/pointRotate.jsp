<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/event/rotate.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../temp/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/JQueryRotate.js"></script>
<section id="main">
<img src="../resources/upload/event/roulette.png" id="image">
<img src="../resources/upload/event/niddle.png" id="n_id">
<br />
<div id="result_id"></div>
<div id="result_id2"></div>
<div id="result_id3"></div>
<script>
/* serpiko.tistory.com */
window.onload = function(){
     
    var pArr = ["1","10","20","30","꽝","50","60","70","80","90"];
 
    $('#image').click(function(){
        rotation();
    });
 
    function rotation(){
        $("#image").rotate({
          angle:0,
          animateTo:360 * 5 + randomize(0, 360),
          center: ["50%", "50%"],
          easing: $.easing.easeInOutElastic,
          callback: function(){
                        var n = $(this).getRotateAngle();
                        endAnimate(n);
                    },
          duration:5000
       });
    }
 
    function endAnimate($n){
        var n = $n;
        $('#result_id').html("<p>움직인각도:" + n + "</p>");
        var real_angle = n%360 +18;
        var part = Math.floor(real_angle/36);
     
        $('#result_id2').html("<p>상품범위:" + part + "</p>");
 
        if(part < 1){
            $('#result_id3').html("<p>당첨내역:" + pArr[0] + "</p>");
            return;
        }
 
        if(part >= 10){
            $('#result_id3').html("<p>당첨내역:" + pArr[pArr.length-1] + "</p>");
            return;
        }
 
        $('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
        alert("축하드립니다! Point : "+pArr[part]+"점 적립!");
    }
 
    function randomize($min, $max){
        return Math.floor(Math.random() * ($max - $min + 1)) + $min;
    }
};
</script>
</section>
</body>
</html>