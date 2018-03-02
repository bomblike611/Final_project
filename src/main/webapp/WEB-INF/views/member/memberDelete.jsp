<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/busk/resources/css/member.css" rel="stylesheet">
</head>
<body>
	<%@include file="../temp/header.jsp"%>
	<div class="join_agree">
		<h2 class="tit_bk_left pt30">Member Delete</h2>
		
		
		<div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" id="modal" style="background-color: #333; margin-top: 45%">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" style="color: white; text-align: center; float: center;">회원탈퇴</h4>
               </div>
               <div class="modal-body">
                  <form action="./memberDelete" method="post">
                     <input type="password" name="id" placeholder="비밀번호" class="form-control" style="width: 50%; display: block; margin-left: auto; margin-right: auto;"><br>
                     <input type="password" name="pw" placeholder="User PassWord" class="form-control" style="width: 50%; display: block; margin-left: auto; margin-right: auto;"><br><br>
                     <button type="submit" class="btn" style="background-color: #74c200; width: 30%; display: block; margin-left: auto; margin-right: auto; color: white;">회원탈퇴</button>
                  </form>
               </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
		
	</div>
</body>
</html>