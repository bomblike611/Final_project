<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty search}">
	<li class="list_item">
		<div class="busker_img">
			<img src="/busk/resources/upload/${search[0].fname}">
		</div>
		<h3>${search[0].teamName}</h3>
		<p>
			팀원 :
			<c:forEach items="${search}" var="names">
				${names.name}
			</c:forEach>
		</p>
		<div class="link" title="${search[0].teamName}">Link</div>
	</li>
</c:if>
<c:if test="${empty search}">
	<div class="cannotfind">
		<img src="/busk/resources/images/busker/cannot.jpg" style="width: 90%; height: 90%; margin-top: 5%;">
		<p>요청하신 자료를 찾을수 없습니다.</p>
	</div>
</c:if>