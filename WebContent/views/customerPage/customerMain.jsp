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
	#menu1:hover, #menu2:hover, #menu3:hover, #menu4:hover, #menu5:hover, #menu6:hover{
		opacity : 0.6;
	}

</style>

</head>
<body>
<header>
	<%@ include file="../common/menuBar.jsp"%>
</header>

	<br><br><br>
	<p id="title" align=center>고객센터</p>
	<br>

	<div class="cus">
		<table class="menu" align="center">
			<tr>
				<td width="250" height="250">공지사항
				<div id="menu1">
					<a href="<%=contextPath %>/list.no?n_name=공지사항">
						<img id="menu1" src="../../resources/file/image/main_notice.png" width="250" height="250">			
					</a>
				</div>
				</td>
				<td width="250" height="250">Q&A
				<div id="menu2">
					<a href="<%=contextPath %>/list.no?n_name=qna">
						<img id="menu2" src="../../resources/file/image/main_Q&A.png" width="250" height="250">			
					</a>
				</div>
				</td>
				<td width="250" height="250">문의내역
				<div id="menu3">
					<a href="<%=contextPath %>/list.no?n_name=문의내역">
						<img id="menu3" src="../../resources/file/image/main_refuns.png" width="250" height="250">			
					</a>
				</div>
				</td>
			</tr>
			<tr>
				<td width="250" height="250">문의글 작성
				<div id="menu4" onclick="insertNotice();">
				<img id="menu4" src="../../resources/file/image/main_help.png" width="250" height="250">			
				</div>
				</td>
				<td width="250" height="250">실시간 상담
				<div id="menu5">
					<a href="https://open.kakao.com/o/sr7MolLb">
						<img id="menu5" src="../../resources/file/image/main_chat.png" width="250" height="250">			
					</a>
				</div>
				</td>
				<td width="250" height="250">찾아오시는 길
				<div id="menu6">
					<a href="<%=contextPath %>/views/customerPage/howToCome.jsp">
						<img id="menu6" src="../../resources/file/image/main_multi.png" width="250" height="250">			
					</a>
				</div>
				</td>
			</tr>
		</table>
	</div>
	<script>
	function insertNotice(){
        <% if(loginUser != null){ %>
           location.href="insertNotice.jsp";
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