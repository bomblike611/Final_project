<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(year)입니다</title>
<link href="../resources/css/calendar/year.css" rel="stylesheet">
<link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
<script type="text/javascript" src="js/jquery-ui-datepicker.min.js"></script>
<script type="text/javascript">


 	function getDayText(year, month){
	    var dayTd = [];
	    var d1 = (year+(year-year%4)/4-(year-year%100)/100+(year-year%400)/400 
	          +month*2+(month*5-month*5%9)/9-(month<3?year%4||year%100==0&&year%400?2:3:4))%7; 

	    for (i = 0; i < 42; i++) { 
	        if (i%7==0){
	            dayTd += '</tr>\n<tr>'; 
	        } 

	        if (i < d1 || i >= d1+(month*9-month*9%8)/8%2+(month==2?year%4||year%100==0&&year%400?28:29:30)) {
	            dayTd += '<td> </td>'; 
	        }else{
	            dayTd += '<td' + (i%7 ? '' : ' style="color:red;"') + '>' + (i+1-d1) + '</td>'; 
	        }
	    } 
	    return dayTd;
	}

	//dayArray를 tag로 감싸서 text로 만듬
	function getCalendarText(y, m){
	    var text = '<table>\n<tr><td colspan=7 style="text-align:center">' 
	  	text += '<span onclick="showCalendar('+(y-1)+','+m+')"> Y- </span>'; 
	    text += '<span onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')"> M- </span>'; 
	    text += '[' + y + '/' + ((m < 10) ? ('0' + m) : m) + ']'; 
	    text += '<span onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')"> M+ </span>'; 
	    text += '<span onclick="showCalendar('+(y+1)+','+m+')"> Y+ </span>'; 
	    text += '</td>'; 


	    var dayTd = getDayText(y,m); 

	    return text+dayTd + '</tr>\n</table>';
	}


	//날짜가 들어있는 array를 return
	function getDayArray(year, month){
	    var arDay = [];
	    var d1 = (year+(year-year%4)/4-(year-year%100)/100+(year-year%400)/400
	        +month*2+(month*5-month*5%9)/9-(month<3?year%4||year%100==0&&year%400?2:3:4))%7;
	    var i = 0;

	    var date = "";

	    for (i = 0; i < 42; i++) {
	        if (i < d1 || i >= d1+(month*9-month*9%8)/8%2+(month==2?year%4||year%100==0&&year%400?28:29:30)) {
	            date = "";
	            arDay.push({"no":i, "date":date, "day":i%7});
	        }else{
	            date = (i+1-d1);
	            arDay.push({"no":i, "date":date, "day":i%7});
	        }
	    }
	    return arDay;
	}

	//'calendarDiv에 달력 출력'
	function showCalendar(y, m) { 
	    text = getCalendarText(y, m);
	    document.getElementById('calendarDiv').innerHTML = text; 
	} 
	console.log( getDayArray(2018, 2) );
</script>

</head>
<body onload="showCalendar(2018,2)">
	<%@ include file="../temp/header.jsp" %>
		<section id="main">
	<%@ include file="./calHeader.jsp" %>
	
	<div id="mon">
		<p id="monin">DECEMBER 24</p>
	</div>

 	<div id="cal">
		<div id="calendarDiv"></div> 
	</div>
	
</section>
</body>
</html>