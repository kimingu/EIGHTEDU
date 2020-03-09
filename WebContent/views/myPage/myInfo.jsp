<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/menuBar.jsp" %>
<%
   String no = loginUser.getUserNo();
   String ad = loginUser.getAddress();
   String[] address = {};
   if(ad != null){
      address = loginUser.getAddress().split(",");
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .wrapper{
      height:800px;
      width:100%;
   }
   .inner{
      height:80%;
      width:50%;
      border:1px solid black;
      border-radius:30px;
      margin:auto;
      margin-top:auto;
   }
   button{
      background: gray;
      color:white;
      border: black;
   }
   #changeInfo{
      margin-left:34%;
   }
   .labels{
      margin-left:8%;
   }
   #userName, #address, #alias, #gender{
      margin-left:20%;
   }
   #userNos{
      margin-left:9%;
   }
   #phone, #email, #userId{
      margin-left: 18%;
   }
   #point{
      margin-left: 13%;
   }
</style>
</head>
<body>
   <% if(msg != null){ %>
      alert(msg);
   <% } %>
   <div class="wrapper">
      <br><br>
      <div class="inner">
         <form method="post" action="<%=contextPath %>/update.us">
         <br>
         <h1 align="center">내 정보</h1>
         <hr>
         <br>
         <input name="userCode" value=<%=loginUser.getUserCode() %> type="hidden">
         <label class="labels"><h3>이름 :</h3></label><input type="text" name="userName" id="userName" value="<%=loginUser.getUserName()%>"><br>
         <label class="labels"><h3>아이디 :</h3></label><input type="text" name="userId" id="userId" value="<%=loginUser.getUserId()%>" readonly><br>
         <label class="labels"><h3>연락처 :</h3></label><input type="text" id="phone" name="phone" value="<%=loginUser.getPhone()%>"><br> 
         <label class="labels"><h3>이메일 :</h3></label><input type="email" id="email" name="email" value="<%=loginUser.getEmail()%>"><br> 
         <label class="labels"><h3>* 주소 :</h3></label>
            <% if(ad != null && address.length == 5) {%>
            <input type="text" id="sample4_postcode" placeholder="<%=address[0] %>" style="margin-left:17%" name="address1" required>
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample4_roadAddress" placeholder="<%=address[1] %>" style="margin-left:35%" name="address2" size="35%" required>
            <input type="text" id="sample4_jibunAddress" placeholder="<%=address[2] %>" name="address3"  size="35%" readonly>
            <span id="guide" style="color:#999;display:none"></span>
            <input type="text" id="sample4_detailAddress" placeholder="<%=address[3] %>" style="margin-left:35%" name="address4"  size="35%" required>
            <input type="text" id="sample4_extraAddress" placeholder="<%=address[4] %>"  name="address5"  size="35%" readonly><br>
            <% }else{ %>
            <input type="text" id="sample4_postcode" placeholder="우편번호" style="margin-left:17%" name="address1" required>
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="margin-left:35%" name="address2" required>
            <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3" readonly>
            <span id="guide" style="color:#999;display:none"></span>
            <input type="text" id="sample4_detailAddress" placeholder="상세주소" style="margin-left:35%" name="address4" required>
            <input type="text" id="sample4_extraAddress" placeholder="참고항목"  name="address5" readonly><br>
            <% } %>
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
         <label class="labels"><h3>성별 :</h3></label><input type="text" id="gender" name="gender" value="<%=loginUser.getGender()%>"><br> 
         <label class="labels"><h3>별칭 :</h3></label><input type="text" id="alias" name="alias" value="<%=loginUser.getAliass()%>"><br>
         <label class="labels"><h3>주민등록번호 : </h3></label><input type="text" name="userNos" id="userNos" value="<%=no.substring(0, 8) %>******" readonly><br>
         <label class="labels"><h3>내 포인트 : </h3></label><input type="text" name="point" id="point" value="<%=loginUser.getPoint() %>" readonly>
         <button type="button" onclick="chargeM();">충전하기</button>
         <br>
         <br><br><br>
         <input type="hidden" name="userNo" value="<%=no %>">
         <button type="submit" id="changeInfo">정보 수정</button>
         <button type="button" id="changePwdBtn" onclick="changePwd();">비밀번호 변경</button>
         <button type="button" id="withDrawBtn" onclick="location.href='<%=contextPath%>/views/myPage/out.jsp'">회원 탈퇴</button>
         </form>
      </div>
      
   </div>
   <script type="text/javascript">
      function changePwd(){
         window.open("http://localhost:8800/eightedu/views/myPage/updatePwd.jsp", "pop1", "width=500 height=600 top=100 left=400");
      }
      function chargeM(){
         window.open("http://localhost:8800/eightedu/views/myPage/charge.jsp", "pop1", "width=500 height=600 top=100 left=400");
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

   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script>
      window.jQuery
            || document
                  .write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
   </script>
   <script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
      crossorigin="anonymous"></script>
</body>
</html>