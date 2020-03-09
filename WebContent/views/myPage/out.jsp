<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
	height: 600px;
	width: 50%;
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
input{
	width: 40%;
}
#l1{
	margin-right: 5%;
	margin-left: 3%;
}
#l2{
	margin-right: 9%;
	margin-left: 3%;
}
#l3{
	margin-right: 2%;
	margin-left: 3%;
}
#outBtn{
	margin-left: 35%;
}
#backBtn{
	margin-left: 3%;
}
#ingu {
	color: black;
	font-size: 24px;
}

#koo {
	color: rgb(154, 157, 160);
	font-size: 20px;
}

#koo:hover {
	color: black;
}
</style>
</head>
<%@include file="../common/menuBar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-white sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#"
							id="ingu"> <span data-feather="home"></span> 마이페이지 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/myPage/myInfo.jsp"
							id="koo"> <span data-feather="file"></span> 내 정보

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/productList.pro"
							id="koo"> <span data-feather="shopping-cart"></span> 포인트샵

						</a></li>

					</ul>

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link"
							onclick="myLectList();"
							id="koo"> <span data-feather="file-text"></span> 내 수강 정보

						</a></li>
						
					</ul>
				</div>
			</nav>
			<form method="post" action="<%=contextPath %>/MyLectList.us" class="l1">
				<% if(loginUser != null) {%>
				<input type="hidden" name="userCode" value="<%=loginUser.getUserCode() %>">
				<% } %>
			</form>
			<script>
				function myLectList(){
					$(".l1").submit();
				}
			</script>
			<div class="wrapper">
		
				<div class="inner">
					<form method="post" action="<%=contextPath %>/delete.us">
						<h1 align="center">회원 탈퇴</h1>
						<hr>
						<br><br>
						<label id="l1"><h3>회원 아이디 : </h3></label><input type="text" id="userId" name="userId"><br>
						<label id="l2"><h3>비밀번호 : </h3></label><input type="password" id="userPwd" name="userPwd"><br>
						<label id="l3"><h3>비밀번호 확인 : </h3></label><input type="password" id="userPwd2">
						
						<br><br><br><br><br>
						<button id="outBtn" type="submit">탈퇴하기</button>
						<button id="backBtn" type="button" onclick="location.href='<%=contextPath%>/views/myPage/myPage.jsp'">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	

</html>