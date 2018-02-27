<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>## 노래왕 버스킹 -(month)입니다</title>
<link href="../resources/css/calendar/month.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/* function f_search(){
	  var vObj = document.form1;
	  if(f_validation()){
	   vObj.action='URL;
	   vObj.target = "_self";
	   vObj.submit();
	  }else{
	   return;
	  }
	 }
	 function f_validation(){
	  var vObj = document.form1;
	  var date = new Date();
	  var year  = date.getFullYear();
	             var month = date.getMonth() + 1; // 0부터 시작하므로 1더함
	            if (("" + month).length == 1) { month = "0" + month; }
	  var today = year + month;
	  var mYyyyMm = retName("mYyyy").value + retName("mMm").value;	  
	             if (retName("mYyyy").value == "" ) {
	   alert("기준연도를 입력하시기 바랍니다.");
	   return false;
	  }else if (retName("mMm").value == "" ) {
	   alert("기준월을 입력하시기 바랍니다.");
	   return false;
	  }else if(today < mYyyyMm){
	   alert("현재 년,월 이후는 조회할 수 없습니다.");
	   retName("mYyyy").value = year;
	   retName("mMm").value = month;
	   return false;
	  }else{
	   return true;
	  }
	 } */
	 /*달력 메소드*/
	 function getDayText(year, month){
	     var dayTd = "<table>\n<tr>";
	     var colorClass = ""; 
	     var tdId = "";
	     var d1 = (year+(year-year%4)/4-(year-year%100)/100+(year-year%400)/400 
	              +month*2+(month*5-month*5%9)/9-(month<3?year%4||year%100==0&&year%400?2:3:4))%7; 
	     for (i = 0; i < 42; i++) {
	      colorClass = "";
	         if (i%7==0){
	             dayTd += "</tr>\n<tr>"; 
	         } 
	         
	         if (i < d1 || i >= d1+(month*9-month*9%8)/8%2+(month==2?year%4||year%100==0&&year%400?28:29:30)) {
	             dayTd += "<td> </td>"; 
	         }else{
	          if(i%7==0){
	           colorClass = "red";
	          }else if(i%7==6){
	           colorClass = "blue";
	          }
	          if(i+1-d1 < 10){
	           tdId = "D"+ year + month + "0" + (i+1-d1);
	          }else{
	           tdId = "D"+ year + month + (i+1-d1);
	          }
	             dayTd += "<td id=\"" + tdId + "\" class=\"" + colorClass + "\">" + (i+1-d1) + "</td>"; 
	         }
	     } 
	     return dayTd;
	 }
	//dayArray를 tag로 감싸서 text로 만듬
	 function getCalendarText(y, m){
	     var text = '<table>\n<tr><td colspan=8 style="border: 1px solid black" >' 
	     text += '<span onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')">◀ </span>'; 
	     text += '[' + y + '/' + ((m < 10) ? ('0' + m) : m) + ']'; 
	     text += '<span onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')">▶ </span>'; 
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
	 function showCalendar(y, m) {
	     text = getDayText(y,m);
	     document.getElementById('calendarDiv').innerHTML = text;
	 } 
	 
	     
<%-- 	     <%String date = "";
			String statu = "";
			String statx = "";
			if (GT_LIST != null && !GT_LIST.isEmpty()) {
				for (int i = 0; i < GT_LIST.getNumRows(); i++) {
					GT_LIST.setRow(i);
					date = GT_LIST.getString("DATUM").replace("-", "");
					statu = GT_LIST.getString("STATU");
					statx = GT_LIST.getString("STATX");
					if (statu.equals("10")) {%>
	document.getElementById("D<%=date%>").innerHTML += "<br/><br/><span style=\"color:yellow;\">&nbsp;●</span> <span class=\"black\"><%=statx%></span>";
	  <%} else if (statu.equals("20")) {%>
	document.getElementById("D<%=date%>").innerHTML += "<br/><br/><span style=\"color:blue;\">&nbsp;●</span> <span class=\"black\"><%=statx%></span>";
	  <%} else if (statu.equals("30")) {%>
	document.getElementById("D<%=date%>").innerHTML += "<br/><br/><span style=\"color:green;\">&nbsp;●</span> <span class=\"black\"><%=statx%></span>";
	  <%} else if (statu.equals("40")) {%>
	document.getElementById("D<%=date%>").innerHTML += "<br/><br/><span style=\"color:red;\">&nbsp;●</span> <span class=\"black\"><%=statx%></span>";
	  <%}
				}
			}%> --%>
/* 	 function f_preMon(){
	  var vObj = document.form1;
	  var v_mon = "";
	  v_mon =  Number(vObj.mMm.value) - 1;
	  if(v_mon < 10 ){
	   if(v_mon > 0){
	    vObj.mMm.value = "0" + v_mon;
	   }else{
	    vObj.mMm.value = "12";
	    vObj.mYyyy.value = parseInt(vObj.mYyyy.value) - 1;
	   }
	  }else{
	   vObj.mMm.value = mMm;
	  }
	  f_search();
	 }
	
	 function f_nextMon(){
	  var vObj = document.form1;
	  var v_mon = "";
	  v_mon =  Number(vObj.mMm.value) + 1;
	  if(v_mon < 10 ){
	   vObj.mMm.value = "0" + v_mon;
	  }else{
	   if(v_mon > 12){
	    vObj.mMm.value = "01";
	    vObj.mYyyy.value = parseInt(vObj.mYyyy.value) + 1;
	   }else{
	    vObj.mMm.value = v_mon;
	   }
	  }
	  f_search();
	 } */
</script>
</head>
<body onload="showCalendar(2018,2)">
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<%@ include file="./calHeader.jsp"%>

		<div id="calendarBox">
			<div id="calendarNav">
	<%-- 			<a href="javascript:f_preMon();"><img src="images/button/btn_previous.gif" align="absmiddle" alt="이전"
					class="leftBtn" /></a>
					<span class="num">
					<select id="mYyyy" name="mYyyy" onChange="f_search();">
					<%
							String curr_year = DateUtil.getDate().substring(0, 4);
							int i_year = StringUtil.stoi(curr_year) + 5;
							for (int i = i_year; i > 1999; i--) {
						%>
						<option value="<%=i%>" <%if (mYyyy.equals(StringUtil.itos(i))) {%>
							selected <%}%>><%=i%>년
						</option>
						<%
							}
						%>
				</select> <select id="mMm" name="mMm" onChange="javascript:f_search();">
						<%
							int i_mon = 1;
							String s_mon = "";
							for (int i = 0; i < 12; i++) {
								if (i_mon < 10) {
									s_mon = "0" + i_mon;
								} else {
									s_mon = StringUtil.itos(i_mon);
								}
						%>
						<option value="<%=s_mon%>" <%if (s_mon.equals(mMm)) {%> selected
							<%}%>>
							<%=i_mon%>월
						</option>
						<%
							i_mon++;
							}
						%>
				</select>
				</span> <a href="javascript:f_nextMon();"><img src="/btn_next.gif"
					align="absmiddle" alt="다음" class="rightBtn" /></a> --%>
				<table>
					<tr>
						<th class="red">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="blue">토</th>
					</tr>
				</table>
			</div>
			<div id="calendarDiv"></div>
		</div>
	</section>
</body>
</html>