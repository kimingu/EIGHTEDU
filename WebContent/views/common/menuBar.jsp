<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.model.vo.User"%>
<%@include file="../common/remoteBar.jsp"%>
<%
   // 2_1_1. session 객체에 담겨진 loginUser 정보를 변수에 담기
   User loginUser = (User) session.getAttribute("loginUser");

   // 회원 가입 성공 메세지 출력용
   String msg = (String)session.getAttribute("msg");
   String contextPath = request.getContextPath();
%>
<!--  메인 페이지 입니다. -->
<!DOCTYPE html>
<html>
<head>
<style>
   #bar{
      margin-bottom : 1%;
   }
</style>
<link
   href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
   rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Carousel Template · Bootstrap</title>

<link rel="canonical"href="https://getbootstrap.com/docs/4.3/examples/carousel/">

<!-- 필수 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T">
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}
</style>
<!-- Custom styles for this template -->

<link href="<%=contextPath %>/resources/css/mainStyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <script>
		if("<%=msg%>" != "null"){
			alert("<%=msg%>");
			<% session.removeAttribute("msg"); %>
		}
	</script>
   <header id="bar">
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
         <a href="<%=contextPath %>/index.jsp"> 
         <img src="<%=contextPath %>/resources/file/image/eightLogo.png" name="logoimg" id="logoimg" class="logoimg">
         </a>
         <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item1" name="nav-item1" id="nav-item1"><a
                  class="nav-link" href="<%=contextPath %>/leclist.le"><h4>교실</h4></a></li>
               <li class="nav-item2" name="nav-item2" id="nav-item2"><a
                  class="nav-link" href="<%=contextPath %>/mainList.bo"><h4>쉬는시간</h4></a></li>
               <li class="nav-item3" name="nav-item3" id="nav-item3"><a
                  class="nav-link" href="<%=contextPath %>/views/myPage/myPage.jsp"><h4>내 사물함</h4></a></li>
               <li class="nav-item4" name="nav-item4" id="nav-item4"><a
                  class="nav-link" href="<%=contextPath %>/views/customerPage/customerMain.jsp"><h4>행정실</h4></a></li> 
            </ul>
         </div>
         <%
            if (loginUser == null) {
         %>
         <button type="button" class="login btn btn-warning" id="loginBtn"
            name="loginBtn" onclick="location.href='<%=contextPath%>/views/loginPage/loginPage.jsp'">등교하기</button>
         &nbsp;
         <button type="button" class="register btn btn-warning" id="registerBtn" 
            name="registerBtn" onclick="location.href='<%=contextPath%>/views/loginPage/newMember.jsp'">입학신청</button>
	<%
            } else if (loginUser.getUserId().equals("master")) {
         %>
         <button type="button" class="master-btn bg-dark text-secondary" onclick="location.href='<%=contextPath%>/views/masterPage/contents.jsp'"
            id="master-btn" name="master-btn" style="border: none">[관리자페이지]</button>
         &nbsp; <label><%=loginUser.getAliass() %>님의 방문을 환영합니다.</label>
         &nbsp;<label>내 포인트 : <%=loginUser.getPoint() %></label>&nbsp;&nbsp;
         <button type="button" class="logout btn btn-warning" id="logoutBtn" onclick="logout();"
            name="logoutBtn">하교하기</button>
         <%
            } else {
         %>
         &nbsp;<label><%=loginUser.getAliass()%>님의 방문을 환영합니다.</label>
         &nbsp;<label>내 포인트 : <%=loginUser.getPoint() %></label>&nbsp;&nbsp;
         <button type="button" class="logout btn btn-warning" id="logoutBtn" onclick="logout();"
            name="logoutBtn">하교하기</button>
         <%
            }
         %>
      </nav>
   </header>
   <script>
   		function logout(){
   			location.href='<%=request.getContextPath() %>/logout.us';
   		}
   </script>

</body>
</html>