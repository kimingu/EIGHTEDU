<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
   // 2_1_1. session 객체에 담겨진 loginUser 정보를 변수에 담기
   User loginUser = (User) session.getAttribute("loginUser");

   // 회원 가입 성공 메세지 출력용
   
   String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
   height: 600px;
   width: 100%;
   float:right;
   margin-left: 10%;
   margin-top: 2%;
}
.inner {
   height: 80%;
   width: 80%;
   border: 1px solid black;
   border-radius: 30px;
   margin: auto;
   margin-top: auto;
}
#outBtn{
   margin-left: 35%;
   background: gray;
   color:white;
   border: black;
}
#backBtn{
   margin-left: 3%;
   background: gray;
   color:white;
   border: black;
}
</style>
</head>
<body>
   <div class="wrapper">
      
      <div class="inner">
         <form method="post" action="<%=contextPath %>/changePwd.us">
            <h1 align="center">비밀 번호 변경</h1>
            <hr>
            <br>
            <br> 
            <label id="l1" style="display:inline-block"><h3>회원 아이디 :</h3></label><input type="text" id="userId" name="userId" style="margin-left:18%"><br> 
            <label id="l2" style="display:inline-block"><h3>비밀번호 :</h3></label><input type="password" id="userPwd" name="userPwd" style="margin-left:25%"><br>
            <label id="l3" style="display:inline-block"><h3>변경할 비밀번호  :</h3></label><input type="password" id="changePwd" name="changePwd" style="margin-left:7%"> <br>
            <br>
            <br>
            <br>
            <br>
            <button id="outBtn" type="submit">변경하기</button>
            <button id="backBtn" type="button"
               onclick="window.close();">취소</button>
         </form>
      </div>
   </div>
</body>
</html>