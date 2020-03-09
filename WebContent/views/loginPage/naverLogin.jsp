<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/loginNaver.us" method="post" id="naverform">
		<input type="hidden" name="userId" id="userId">
		<input type="hidden" name="userPwd" id="userPwd">
		<input type="hidden" name="userName" id="userName">
		<input type="hidden" name="email" id="email">
		<input type="hidden" name="phone" id="phone">
		<input type="hidden" name="gender" id="gender">
		<input type="hidden" name="userNo" id="userNo">
		<input type="hidden" name="address" id="address">
		<input type="hidden" name="alias" id="alias">
	</form>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("raI2uLm8LOCiZG0Nmuqg",
				"http://localhost:8888/eightedu/views/loginPage/naverLogin.jsp");
		// 접근 토큰 값 출력
		// alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			if (naver_id_login.getProfileData('email') != "null") {
				$("#email").val(naver_id_login.getProfileData('email'));
			}
			if (naver_id_login.getProfileData('gender') != "null") {
				$("#gender").val(naver_id_login.getProfileData('gender'));
			}
			if (naver_id_login.getProfileData('nickname') != "null") {
				$("#alias").val(naver_id_login.getProfileData('nickname'));
			}
			if (naver_id_login.getProfileData('name') != "null") {
				$("#userName").val(naver_id_login.getProfileData('name'));
				console.log($("#userName").val());
			}
			if (naver_id_login.getProfileData('id') != "null") {
				$("#userId").val(naver_id_login.getProfileData('id'));	
			}
			$("#naverform").submit();
		}
	</script>
	
	
</body>
</html>