<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(search)입니다</title>
<link href="../resources/css/calendar/year.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    var text = '<table>\n<tr><td colspan=8 style="text-align:center" >' 
        text +=  y + '[' + ((m < 10) ? ('0' + m) : m)+']';      
        text += '<span id="wen" onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')">◀ </span>'; 
        text += '<span id="oh" onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')">▶ </span>'; 
        text += '</td>'; 
 		text += '<tr><td style="color:red;">SUN</td><td>MON</td><td>TUE</td><td>WED</td><td>THU</td><td>FRI</td><td style="color:blue;">SAT</td></tr>'; 
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

</script>
</head>
<body onload="showCalendar(2018,2)">

	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>
			<div id="calendarBox">
			<div id="calendarNav">
<!-- 							<table>
					<tr>
						<th class="red">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="blue">토</th>
					</tr>
				</table> -->
			</div>
	<div id="calendarDiv" style="font-family:Gulim;font-size:9pt;">
	
	
	
	</div> 	
	</div>
	</section>
<!-- 	<script>
    console.log( getDayArray(2016, 6) );
	</script> -->

</body>
</html>