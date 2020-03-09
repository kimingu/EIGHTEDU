<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
	height: 800px;
	width: 100%;
}

form {
	height: 80%;
	width: 50%;
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

#cancelBtn {
	margin-left: 34%;
}

#joinBtn, #checkIdBtn {
	margin-left: 10%;
}

label {
	margin-left: 8%;
}

#userName, #gender, #address, #alias{
	margin-left: 20%;
}

#userId, #phone, #email {
	margin-left: 17%;
}

#userPwd {
	margin-left: 14%;
}

#chkPassBox, #userNo {
	margin-left: 8%;
}

#cancelBtn, #joinBtn {
	width: 15%;
	height: 5%;
}

</style>
</head>
<body>
	<%@ include file="../common/menuBar.jsp"%>
	<div class="wrapper">
		<br> <br>
		<form action="<%=request.getContextPath()%>/insert.us" method="post" onsubmit="return joinValidate();">
			<h1 align="center">회원가입</h1>
				<hr>
				<label><h3>* 이름 :</h3></label><input type="text" name="userName" id="userName"><br>
				<label><h3>* 아이디 :</h3></label><input type="text" name="userId" id="userId">
				<button id="checkIdBtn" type="button" onclick="checkId();">중복확인</button>
				<br> 
				<label><h3>* 비밀번호 :</h3></label><input type="password" name="userPwd" id="userPwd"><br> 
				<label><h3>* 비밀번호확인 :</h3></label><input type="password" name="chkPass" id="chkPassBox">
				<label id="pwdResult"></label>
				<br> 
				<label><h3>* 주민등록번호	:</h3></label><input type="text" id="userNo" name="userNo"><br> 
				<label><h3>&nbsp;&nbsp;&nbsp;연락처 :</h3></label><input type="text" id="phone" name="phone"><br> 
				<label><h3>&nbsp;&nbsp;&nbsp;이메일 :</h3></label><input type="email" id="email" name="email"><br> 
				<label><h3>* 주소 :</h3></label>
				<input type="text" id="sample4_postcode" placeholder="우편번호" style="margin-left:19%" name="address1" required>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="margin-left:41%" name="address2" required>
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="margin-left:41%" name="address3" required>
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" readonly><br>

				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				    function sample4_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var roadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 참고 항목 변수
				
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample4_postcode').value = data.zonecode;
				                document.getElementById("sample4_roadAddress").value = roadAddr;
				                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				                
				                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                if(roadAddr !== ''){
				                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                } else {
				                    document.getElementById("sample4_extraAddress").value = '';
				                }
				
				                var guideTextBox = document.getElementById("guide");
				                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                if(data.autoRoadAddress) {
				                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                    guideTextBox.style.display = 'block';
				
				                } else if(data.autoJibunAddress) {
				                    var expJibunAddr = data.autoJibunAddress;
				                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                    guideTextBox.style.display = 'block';
				                } else {
				                    guideTextBox.innerHTML = '';
				                    guideTextBox.style.display = 'none';
				                }
				            }
				        }).open();
				    }
				</script>
				<label><h3>* 성별 :</h3></label><select id="gender" name="gender"><option>--</option><option>m</option><option>w</option></select><!-- <input type= id="gender" name="gender"> --><br> 
				<label><h3>* 별칭 :</h3></label><input type="text" id="alias" name="alias"><br> <br> <br>
				<br>
				<button type="button" id="cancelBtn"
					onclick="location.href='javascript:history.back()'">취소</button>
				<button type="submit" id="joinBtn" disabled>가입 신청</button>
		</form>
	</div>
	<script>
		function checkId(){
			var userId = $("#userId");
			$.ajax({
				url : "<%= request.getContextPath()%>/checkId.us",
				data : {userId : userId.val()},
				type : "post",
				success : function(data){
					if(data == "fail"){
						alert("사용할 수 없는 아이디입니다.");
						userId.focus();
					}else{
						alert("사용 가능한 아이디입니다.");
						$("#joinBtn").removeAttr("disabled");
					}
				},
				error : function(){
					console.log("실패");
				}
			});
		}
		function joinValidate(){
			if(!(/^[가-힣]{2,}$/.test($("input[name=userName]").val()))){
				alert('이름은 한글로 2글자 이상 입력');
				$("input[name=userName]").select();
				return false;
			}
			if(!(/^[a-z][a-z\d]{3,11}$/i.test($("input[name=userId]").val()))){
				alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)');
				$("input[name=userId]").select();
				return false;
			}
			if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가~힣]).{8,}/.test($("input[name=userPwd]").val()))){
				alert('비밀번호는 영문 대소문자, 숫자, 특수문자 1개이상 포함해주세요(8자 이상)');
				$("input[name=userPwd]").select();
				return false;
			}
			
			if($("input[name=userPwd]").val() != $("input[name=chkPass]").val()){
				$("#pwdResult").text("비밀번호 불일치").css("color", "red");
				return false;
			}
			
			if(!(/^[0-9]{6}-[0-9]{7}$/.test($("input[name=userNo]").val()))){
				alert('주민등록번호는 - 포함 14자리로 입력해주세요');
				$("input[name=userNo]").select();
				return false;
			}
			if(!(/^[가-힣a-z]{2,10}$/.test($("input[name=alias]").val()))){
				alert('별칭은 한글, 영문으로 2글자 이상 10자이하로 입력해주세요');
				$("input[name=alias]").select();
				return false;
			}
			
			return true;
		}
	</script>
	

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