<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<button class="cancelBtn">${kind}</button>
<button class="cancelBtn">${money}원</button>
<p>후원자 정보를 입력해 주세요</p>
<table style="width: 100%;">
  <tr>
  	<td class="member_cul">이름</td>
  	<td><input id="member_info" type="text" value="${member.name}" id="name"></td>
  </tr>
  <tr>
  	<td class="member_cul">핸드폰</td>
  	<td><input id="member_info" type="text" value="${member.phone}" id="phone"></td>
  </tr>
  <tr>
  	<td class="member_cul">이메일</td>
  	<td><input id="member_info" type="text" value="${member.email}" id="email"></td>
  </tr>
  <tr>
  	<td class="member_cul">주소</td>
  	<td>
  		<p><input id="member_info" type="text" readonly="readonly"><button>검색</button></p>
  		<p><input id="member_info" type="text" readonly="readonly"></p>
  		<p><input id="member_info" type="text"></p>
  	</td>
  </tr>
</table>
<button class="cancelBtn" id="prev">이전</button><button class="nextBtn" id="next">다음 -></button>