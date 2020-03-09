<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#navi-wrapper {
	width: 100%;
	height: 40px;
}

#navi {
	list-style-type: none;
	padding: 0;
	margin: 0;
	height: 100%;
}

#navi>li {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	position: relative;
}

#navi li a {
	display: block;
	height: 100%;
	box-sizing: border-box;
	line-height: 30px;
	text-decoration: none;
	font-weight: 900;
	font-size: 18px;
	padding: 5px 25px;
	color: rgb(154, 157, 160);
}

#navi li a:hover {
	color: black;
}

#master {
	color: black;
	font-size: 24px;
}

#koo {
	color: rgb(154, 157, 160);
	font-size: 20px;
}

#koo:hover {
	color: dimgray;
}

.user, .shop, .video {
	width: 40%;
	height: 40%;
	border: 1px solid black;
	border-radius: 10px;
	text-align: center;
	float: left;
	margin-left: 12%;
	margin-top: 3%;
	padding-top: 8%;
}

.user:hover, .shop:hover, .video:hover {
	cursor: pointer;
}

	#title{
		font-size : 300%;
	}
	.menu{
		text-align : center;
		font-size : 200%;
	}
	#menu1:hover, #menu2:hover, #menu3:hover{
		opacity : 0.6;
	}
	
	.cus{
	margin-left:17%;
	}

</style>

<body>
	   <%@ include file="../common/menuBar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-inline-block sidebar" id="side">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/views/masterPage/dashBoard.jsp"
							id="master"> <span data-feather="home"></span> 관리자페이지 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
								<span data-feather="shopping-cart"></span> 컨텐츠 관리
						</a></li>
					</ul>
				</div>
			</nav>

	<div class="cus">
		<p id="title" align=center>관리</p>
		<table class="menu" align="center">
			<tr>
				<td width="250" height="250">강사 관리
					<div id="menu1">
						<a href="<%=contextPath%>/views/masterPage/teacher.jsp">
							<img id="menu1" src="../../resources/file/image/user2.png"
							width="200" height="200">
						</a>
					</div>
				</td>
				<td width="250" height="250">회원 관리
					<div id="menu2">
						<a href="<%=contextPath%>/views/masterPage/userKanri.jsp"><!-- /views/masterPage/con_user.jsp -->
							<img id="menu2" src="../../resources/file/image/user2.png"
							width="220" height="220">
						</a>
					</div>
				</td>
			</tr>
			</table>
  
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
			</div>
</body>
</html>