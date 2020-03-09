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

#title {
	font-size: 300%;
}

.menu {
	text-align: center;
	font-size: 200%;
}

#menu1:hover, #menu2:hover, #menu3:hover {
	opacity: 0.6;
}

.cus{
	margin-left:10%;
}
</style>
</head>

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
							href="<%=contextPath%>/views/masterPage/dashBoard.jsp" id="koo">
								<span data-feather="file"></span> 대시보드
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
								<span data-feather="shopping-cart"></span> 컨텐츠 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/views/masterPage/support_customer.jsp"
							id="koo"> <span data-feather="file-text"></span> 고객지원
								<hr>
						</a></li>
					</ul>
				</div>
			</nav>

	<div class="cus">
		<p id="title" align=center>고객지원</p>
		<table class="menu" align="center">
			<tr>
				<td width="250" height="250">Q&A
					<div id="menu1">
						<a href="/eightedu/views/masterPage/sup_qna.jsp"> <img
							id="menu1" src="../../resources/file/image/main2_Q&A.png"
							width="250" height="250">
						</a>
					</div>
				</td>
				<td width="250" height="250">1:1 문의
					<div id="menu2">
						<a href="/eightedu/views/masterPage/sup_onetoone.jsp"> <img 
						id="menu2" src="../../resources/file/image/main5_chat.png" 
						width="250" height="250">
						</a>
					</div>
				</td>
				<td width="250" height="250">공지사항
					<div id="menu3">
						<a href="/eightedu/views/masterPage/sup_notice.jsp"> <img
							id="menu3" src="../../resources/file/image/main1_notice.png"
							width="250" height="250">
						</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="footer-wrapper">
		<div id="footer3">
			<a href="#"> 공지사항 </a> <a href="#"> 문의 및 신고 </a> <a href="#">
				이용약관 </a> <a href="#"> 개인정보취급방침 </a> <a href="#"> 청소년보호정책 </a> <a
				href="#"> 게시물 삭제요청방법 </a> <a href="#"> 광고문의 </a>
			<p>업체 및 기관 : 주식회사 에잇에듀 | 개인 : EIGHT.co</p>
			<p>Copyright ⓒ www.eightedu.com</p>
		</div>
	</div>
</body>
</html>