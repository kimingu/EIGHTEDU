<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User"%>
<% 
   String contextPath = request.getContextPath();
   String msg = (String)session.getAttribute("msg");
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
h3{
	display: inline;
}
</style>

</head>
<body>
	<script>
		if("<%=msg%>" != "null"){
			alert("<%=msg%>");
			<% session.removeAttribute("msg"); %>
		}
	</script>
	<div class="wrapper">
		
		<div class="inner">
			<form method="post" action="<%=contextPath %>/findId.us">
				<h1 align="center">아이디 찾기</h1>
				<hr>
				<br>
				<br> 
				<h3>회원 이름 :</h3>
				<input type="text" id="userName" name="userName" style="margin-left:8%"><br> 
				<br><br>
				<h3>주민등록번호 :</h3>
				<input type="text" id="userNo" name="userNo"><br>
				
				<br>
				<br>
				<br>
				<button id="outBtn" type="submit">찾기</button>
				<button id="backBtn" type="button"
					onclick="window.close();">취소</button>
			</form>
		</div>
	</div>
</body>
</html>