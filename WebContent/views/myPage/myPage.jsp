<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer{
		margin-top : 3%;
	}
	#title{
		font-size : 300%;
	}
	.menu{
		text-align : center;
		font-size : 200%;
	}
	#menu1:hover, #menu2:hover, #menu3:hover, #menu4:hover{
		opacity : 0.6;
	}

</style>

</head>
<body>
<header>
	<%@ include file="../common/menuBar.jsp"%>
</header>

	<br><br><br>
	<p id="title" align=center>내 사물함</p>
	<br>

	<div class="cus">
		<table class="menu" align="center">
			<tr>
				<td width="250" height="250">내 정보
				<div id="menu1" onclick="showMyInfo();">
						<img id="menu1" src="../../resources/file/image/mypage.png" width="250" height="250">			
				</div>
				</td>
				<td width="250" height="250">포인트 샵
				<div id="menu2" onclick="showPointShop();">
						<img id="menu2" src="../../resources/file/image/cart.png" width="250" height="250">			
				</div>
				</td>
			</tr>
			<tr>
				<td width="250" height="250">현재 수강 정보
				<div id="menu3" onclick="showMyLectList();">
						<img id="menu4" src="../../resources/file/image/list.png" width="250" height="250">			
				</div>
				</td>
				<td width="250" height="250">회원 탈퇴
				<div id="menu4" onclick="showOut();">
						<img id="menu5" src="../../resources/file/image/out.png" width="250" height="250">			
				</div>
				</td>
			</tr>
		</table>
	</div>
	<form method="post" action="<%=contextPath %>/MyLectList.us">
      <% if(loginUser != null) {%>
      <input type="hidden" name="userCode" value="<%=loginUser.getUserCode() %>">
      <% } %>
   </form>
	 <script>
      function showMyInfo(){
         <% if(loginUser != null){ %>
            location.href="myInfo.jsp";
         <% }else{ %>
            location.href="<%=contextPath%>/views/loginPage/loginPage.jsp";
         <% } %>
      }
      function showPointShop(){
         <% if(loginUser != null){ %>
            location.href="<%=contextPath %>/productList.pro";
         <% }else{ %>
            location.href="<%=contextPath%>/views/loginPage/loginPage.jsp";
         <% } %>
         
      }
      function showMyLectList(){
         <% if(loginUser != null){ %>
            <%-- location.href="<%=contextPath %>/MyLectList.us"; --%>
            $("form").submit();
         <% }else{ %>
            location.href="<%=contextPath%>/views/loginPage/loginPage.jsp";
         <% } %>
      }
      function showOut(){
         <% if(loginUser != null){ %>
            location.href="out.jsp";
         <% }else{ %>
            location.href="<%=contextPath%>/views/loginPage/loginPage.jsp";
         <% } %>
      }
   </script>
<footer>
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
</footer>	
</body>
</html>