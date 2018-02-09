<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<button class="cancelBtn">${kind}</button>
<button class="cancelBtn">${money}원</button>
<p style="width: 90%; margin: 0 auto;">후원자 정보를 입력해 주세요</p>
<input type="hidden" value="${member.id}" id="id">
<table style="width: 90%; margin: 0 auto;">
  <tr>
  	<td class="member_cul">이름</td>
  	<td><input class="member_info" type="text" value="${member.name}" id="name"></td>
  </tr>
  <tr>
  	<td class="member_cul">핸드폰</td>
  	<td><input class="member_info" type="text" value="${member.phone}" id="phone"></td>
  </tr>
  <tr>
  	<td class="member_cul">이메일</td>
  	<td><input class="member_info" type="text" value="${member.email}" id="email"></td>
  </tr>
  <tr>
  	<td class="member_cul">주소</td>
  	<td>
  		<p><input class="member_info addr_search" id="postcode" type="text" readonly="readonly" placeholder="우편번호"><img class="addr_search" src="/busk/resources/upload/search.png" style="width: 20px; height: 20px; cursor: pointer; margin-left: 10px;"></p>
  		<p><input class="member_info addr_search" id="roadAddress" type="text" readonly="readonly" placeholder="도로명주소"></p>
  		<p><input class="member_info" id="jibunAddress" type="text" placeholder="상세주소"></p>
  	</td>
  </tr>
  <tr>
  	<td class="member_cul">응원의 한줄</td>
  	<td><input class="member_info" type="text" id="message"></td>
  </tr>
</table>
<button class="cancelBtn" id="prev">이전</button><button class="nextBtn" id="next">다음 -></button>