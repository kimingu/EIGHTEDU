<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	ArrayList<Board> listEng = (ArrayList<Board>) request.getAttribute("listEng");
	ArrayList<Board> listJp = (ArrayList<Board>) request.getAttribute("listJp");
	ArrayList<Board> listCh = (ArrayList<Board>) request.getAttribute("listCh");
	ArrayList<Board> listDt = (ArrayList<Board>) request.getAttribute("listDt");
	
	String b_name = (String) request.getAttribute("b_name");
	String b_code = (String)request.getAttribute("b_code");
%>


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

#line {
	width: 100%;
	height: 100%;
	margin-top: 10px;
}

#line2 {
	border: 1px solid lightgray;
	width: 48%;
	height: 400px;
	margin-top: 10px;
	float: left;
}

#line3 {
	border: 1px solid lightgray;
	width: 48%;
	height: 400px;
	margin-top: 10px;
	float: left;
	margin-left: 4%;
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

#title {
	text-align: center;
}

#senter {
	font-size: 18px;
	color: black;
}

#text1 {
	font-size: 20px;
	color: black;
}

#info-line {
	margin: 10px;
	width: 700px;
}

 #nono {
margin-left: 10px;
} 
</style>
</head>

<body>
	<%@ include file="../common/menuBar.jsp"%>


	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-white sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							href="<%=contextPath%>/mainList.bo"
							id="ingu"> <span data-feather="home"></span> 쉬는시간 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=영어" id="koo"> <span
								data-feather="file"></span> 영어

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=일본어" id="koo"> <span
								data-feather="shopping-cart"></span> 일본어

						</a></li>

					</ul>

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=중국어" id="koo"> <span
								data-feather="file-text"></span> 중국어

						</a></li>
						<%-- 		<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/views/communityPage/ratingBoard.jsp"
							id="koo"> <span data-feather="file-text"></span> 강의평가

						</a></li> --%>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=자료실" id="koo"> <span
								data-feather="file-text"></span> 자료실
								<hr>
						</a></li>
						<li class="nav-item"></li>
					</ul>
				</div>
			</nav>



			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<br>
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">
				<img src="<%=contextPath%>/resources/file/image/free_board.jpg"
					width="100%" height="50%">
			</div>


			<div id="line">

				<div id="line2">
					<div id="info-line" style="width: 97%;">
						<P id="text1"><a href="<%=contextPath%>/list.bo?b_name=영어">영어</a></P>
						<hr>
				<table  id="listArea">
					<tr id="senter">
						<th width="70" id="nono">카테고리</th>
						<th width="500" id="title">글제목</th>
						<th width="100">작성자</th>
					</tr>
					<%
						if (listEng.isEmpty()) {
					%>
					<tr id="listBoard">
						<td colspan="2">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Board b : listEng) {
					%>
					<tr id="listBoard">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<td width="70" align="center"><%=b.getM_name()%></td>
						<td width="250"><%=b.getB_title()%></td>
						<td width="70"><%=b.getAliass() %>
					</tr>
					<% }} %>

				</table>
					
					</div>
				</div>


				<div id="line3">
					<div id="info-line" style="width: 97%;">
						<p id="text1">
							<a href="<%=contextPath%>/list.bo?b_name=일본어">일본어</a>
						</p>
						<hr>
					<table  id="listArea">
					<tr id="senter">
						<th width="70" id="nono">카테고리</th>
						<th width="500" id="title">글제목</th>
						<th width="100">작성자</th>
					</tr>
					<%
						if (listJp.isEmpty()) {
					%>
					<tr id="listBoard">
						<td colspan="2">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Board b : listJp) {
					%>
					<tr id="listBoard">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<td width="70" align="center"><%=b.getM_name()%></td>
						<td width="250"><%=b.getB_title()%></td>
						<td width="70"><%=b.getAliass() %>
					</tr>
					<% }} %>

				</table>
					</div>
				</div>

				<div id="line2">
					<div id="info-line" style="width: 97%;">
						<p id="text1">
							<a href="<%=contextPath%>/list.bo?b_name=중국어">중국어</a>
						</p>
						<hr>
						<table  id="listArea">
					<tr id="senter">
						<th width="80" id="nono">카테고리</th>
						<th width="480" id="title">글제목</th>
						<th width="100">작성자</th>
					</tr>
					<%
						if (listCh.isEmpty()) {
					%>
					<tr id="listBoard">
						<td colspan="2">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Board b : listCh) {
					%>
					<tr id="listBoard">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<td width="70" align="center"><%=b.getM_name()%></td>
						<td width="250"><%=b.getB_title()%></td>
						<td width="70"><%=b.getAliass() %>
					</tr>
					<% }} %>

				</table>
					</div>
				</div>


				<div id="line3">
					<div id="info-line" style="width: 97%;">
						<p id="text1">
							<a href="<%=contextPath%>/list.bo?b_name=자료실">자료실</a>
						</p>
						<hr>
						<table  id="listArea">
					<tr id="senter">
						<th width="70" id="nono">카테고리</th>
						<th width="500" id="title">글제목</th>
						<th width="100">작성자</th>
					</tr>
					<%
						if (listDt.isEmpty()) {
					%>
					<tr id="listBoard">
						<td colspan="2">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Board b : listDt) {
					%>
					<tr id="listBoard">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<td width="70" align="center"><%=b.getM_name()%></td>
						<td width="250"><%=b.getB_title()%></td>
						<td width="70"><%=b.getAliass() %>
					</tr>
					<% }} %>

				</table>
					</div>

				</div>

			</div>
		</div>

		</main>
	</div>
	</div>
          <script>
				// 게시판 상세보기 기능 구현
				$(function() {
					$("#listArea td").mouseenter(function() {
						$(this).parent().css({
							"background" : "darkgray",
							"cursor" : "pointer"
						});
					}).mouseout(function() {
						$(this).parent().css({
							"background" : "white"
						});
					}).click(function() {
						var b_code = $(this).parent().children("#b_code").val();
						
						location.href="<%=contextPath%>/detail.bo?b_code="+ b_code;
				});

				})
			</script>
	<br>

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
</html>