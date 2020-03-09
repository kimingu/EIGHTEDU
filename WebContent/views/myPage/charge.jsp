<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<!DOCTYPE html>
<%
   User loginUser = (User) session.getAttribute("loginUser");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
   th{
      border: 1px solid black;
      border-radius: 5px;
   }
   th:hover{
      cursor:pointer;
   }
   
</style>
</head>
<body>
   <h1 align="center">충전하기</h1>
   <table>
      <tr>
         <th><h3>5000원</h3></th>
         <th><h3>10000원</h3></th>
         <th><h3>20000원</h3></th>
         <th><h3>30000원</h3></th>
         <th><h3>40000원</h3></th>
      </tr>
      <tr>
         <th><h3>50000원</h3></th>
         <th><h3>60000원</h3></th>
         <th><h3>70000원</h3></th>
         <th><h3>80000원</h3></th>
         <th><h3>100000원</h3></th>
      </tr>
   </table>
   
   <br><br><br>
   <form method="post" action="<%=request.getContextPath()%>/charge.us">
   <h3 style="display:inline-block">선택한 상품 : </h3> <input type="text" class="choosePro" name="choosePro" >
   <br>
   <h3 style="display:inline-block">구매자 : </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="loginUser" value=<%=loginUser.getUserName() %>>
   <input type="hidden" name="userCode" value=<%=loginUser.getUserCode() %>>
   <br><br><br>
   
   <button type="submit">확인</button>
   <button onclick="window.close();">취소</button>
   </form>
   <script>
      $("th").click(function(){
         $(".choosePro").val($(this).children().html());
      });
   </script>
   
</body>
</html>