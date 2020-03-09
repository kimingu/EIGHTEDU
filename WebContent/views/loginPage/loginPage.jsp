<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/menuBar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="google-signin-client_id" content="121597699992-qduv9a6alsj5gamriae7g8kdihd7ahet.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style>
.wrapper {
	height: 700px;
	width: 100%;
}

.inner {
	height: 80%;
	width: 30%;
	border: 1px solid black;
	border-radius: 30px;
	margin: auto;
	margin-top: auto;
}

button {
	background: gray;
	color: white;
	border: black;
}

#changeInfo {
	margin-left: 34%;
}

label {
	margin-left: 8%;
}

#userId, #userPwd {
	margin-left: 5%;
}

.newOrFind {
	padding-left: 15%;
}

.newOrFind>a {
	margin-left: 8%;
	text-decoration: none;
	color: black;
}

#kakao-login-btn {
	margin-left: 8%;
}

.naverLogin {
	margin-left: 16%;
	width: 30%;
	height: 15%;
	float: left;
}

.googleLogin {
	margin-left: 5%;
	width: 30%;
	height: 7%;
	float: left;
	width: 30%;
}

#login {
	width: 20%;
}
.newOrFind>a{
	text-decoration: none;
}
.newOrFind>a:hover{
	cursor:pointer;
}
</style>

</head>
<body>
	
	<div class="wrapper">
		<br> <br>
		<div class="inner">
			<h1 align="center">로그인</h1>
			<hr>
			<form action="<%=contextPath%>/login.us" method="post">
				<div id="11">
					<label><h3>아이디 :</h3></label>&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" name="userId" id="userId"><br> <label><h3>비밀번호
							:</h3></label> <input type="password" name="userPwd" id="userPwd">
					<button id="login" type="submit"
						style="border: 1px solid black, border-radius:5%">로그인</button>
					<br> <br>
				</div>
			</form>
			<div class="newOrFind">
				<a href="<%=contextPath%>/views/loginPage/newMember.jsp">회원가입</a><a
					onclick="findId();">아이디 찾기</a><a onclick="findPwd();">비밀번호 찾기</a>
			</div>
			<br> <br> <br>
			<script>
				function findId(){
					window.open("http://localhost:8800/eightedu/views/loginPage/FindId.jsp", "pop1", "width=500 height=600 top=100 left=400");
				}
				function findPwd(){
					window.open("http://localhost:8800/eightedu/views/loginPage/FindPwd.jsp", "pop1", "width=500 height=600 top=100 left=400");
				}
			</script>

			<div class="kakaoLogin">
				<form action="<%=contextPath %>/loginKakao.us" method="post" id="kakaoform">
					<a id="kakao-login-btn"></a> <a href="http://developers.kakao.com/logout"></a>
					<input type="hidden" name="userIdKakao" id="userIdKakao">
					<input type="hidden" name="userPwdKakao" id="userPwdKakao">
					<input type="hidden" name="userName" id="userName">
					<input type="hidden" name="email" id="email">
					<input type="hidden" name="phone" id="phone">
					<input type="hidden" name="gender" id="gender">
					<input type="hidden" name="userNo" id="userNo">
					<input type="hidden" name="address" id="address">
					<input type="hidden" name="alias" id="alias">
				</form>
				<script type='text/javascript'>
					//<![CDATA[
			        // 사용할 앱의 JavaScript 키를 설정해 주세요.
			        Kakao.init('91f9ddcecbbbd72adc86b455c52a85f3');
			        // 카카오 로그인 버튼을 생성합니다.
			        Kakao.Auth.createLoginButton({
			          container: '#kakao-login-btn',
			          size : 'large',
			          success: function(authObj) {
			            //alert(JSON.stringify(authObj));
			        	  Kakao.Auth.getStatusInfo(function(statusObj){
				        	   if(statusObj.status =="connected"){
				        	    console.log(statusObj);
				        	    console.log(statusObj.user);
				        	    console.log(statusObj.user.id);
				        	    console.log(statusObj.user);		
				        	    console.log(statusObj.user.kakao_account.email);
				        	    console.log(statusObj.user.kakao_account.gender);
				        	    $("#userIdKakao").val(statusObj.user.id + "@kakao");
				        	    $("#userPwdKakao").val(statusObj.user.id + "@kakao");
				        	    $("#userName").val(statusObj.user.properties.nickname);
				        	    $("#alias").val(statusObj.user.properties.nickname);
				        	    $("#email").val(statusObj.user.kakao_account.email);
				        	    $("#gender").val(statusObj.user.kakao_account.gender);
				        	   }else{
				        	    console.log(statusObj);
				        	    str = statusObj;
				        	    console.log(statusObj.user);
				        	    console.log(statusObj.user.id);
				        	    console.log(statusObj.user.properties);
				        	    console.log(statusObj.user.properties.nickname);
				        	   }

					        	$("#kakaoform").submit();
				        	});  
			          },
			          fail: function(err) {
			             //alert(JSON.stringify(err));
			          }
			        });
			        
		        </script>
			</div>
			
			<br> <br>

			<div class="naverLogin">
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naver_id_login"></div>
				<!-- //네이버아이디로로그인 버튼 노출 영역 -->
				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"raI2uLm8LOCiZG0Nmuqg",
							"http://localhost:8800/eightedu/views/loginPage/naverLogin.jsp");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("white", 2, 55);
					naver_id_login.setDomain("http://localhost:8800/eightedu/index.jsp"/* "http://localhost:8800/eightedu/index.jsp" */);
					naver_id_login.setState(state);
					naver_id_login.init_naver_id_login();
				</script>
			</div>

			<div class="g-signin2" data-onsuccess="onSignIn" data-width="150"  data-height="50">
			</div>
			<form action="<%=contextPath %>/LoginGoogle.us" method="post" id="googleform" name="googleform">
				<input type="hidden" name="userIdGoogle" id="userIdGoogle" value="">
				<input type="hidden" name="userPwdGoogle" id="userPwdGoogle" value="">
				<input type="hidden" name="userNameGoogle" id="userNameGoogle" value="">
				<input type="hidden" name="emailGoogle" id="emailGoogle" value="">
			</form>
			
			<script>
				function onSignIn(googleUser) {
				  var profile = googleUser.getBasicProfile();
				  var id_token = googleUser.getAuthResponse().id_token;
				  $('input[name="userNameGoogle"]').val(profile.getName());
				  $("#userIdGoogle").val(profile.getId());
				  $("#emailGoogle").val(profile.getEmail());
				  $('form[name="googleform"]').submit();
				}
			</script>
		</div>
	</div>
		<!-- FOOTER -->
	<div id="footer-wrapper">
		<div id="footer1"></div>
		<div id="footer2"></div>
		<div id="footer3">
			<a href="<%=contextPath %>/list.no?n_name=공지사항"> 공지사항 </a> <a href="<%=contextPath %>/list.no?n_name=문의내역"> 문의하기 </a> 
			<a href="https://open.kakao.com/o/s7Qic8Db">실시간 상담</a> <a href="<%=contextPath %>/list.no?n_name=qna"> 자주 찾는 질문 </a> <a href="<%=contextPath %>/views/customerPage/howToCome.jsp"> 찾아오시는 길 </a> 
			<a href="<%=contextPath %>/leclist.le"> 강의보기 </a> <a href="<%=contextPath %>/mainList.bo"> 커뮤니티 </a>
			<p>업체 및 기관 : 주식회사 에잇에듀 | 개인 : EIGHT.co</p>
			<p>Copyright ⓒ www.eightedu.com</p>
		</div>
		</div>
</body>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
</script> -->
<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
</body>
</html>