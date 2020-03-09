<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, master.teacher.model.vo.Report"%>

<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#listArea{
	margin-left:200px;
}
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
			<br><br>
			<div class="tableArea" align="center">
			<h1>접수된 신고 목록</h1>
			<br>
				<table id="listArea">
					<tr id="senter">
						<th width="100">신고번호</th>
						<th width="100">글작성자</th>
						<th width="100">글번호</th>
						<th width="200">신고종류</th>
						<th width="300">신고내용</th>
					</tr>
					<% if(list.isEmpty()){ %>
					<tr id="listNotice">
						<td colspan="5">접수된 신고가 없습니다.</td>
					</tr>
					<%
						} else {
							for(Report r : list) {
					%>
					<tr id="listNotice">
					<input type="hidden" id="b_code" value=<%=r.getB_code()%>>
					<input type="hidden" id="r_code" value=<%=r.getR_code()%>>
						<td width="100"><%=r.getR_code()%></td>
						<td width="100"><%=r.getUser_code()%></td>
						<td width="100"><%=r.getB_code()%></td>
						<td width="200"><%=r.getR_number()%></td>
						<td width="300"><%=r.getR_content()%></td>
					</tr>
					<%}} %>
				</table>
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
						window.open('<%=contextPath%>/detail.bo?b_code='+b_code, '신고된 게시판','width=1100,height=800');
						if(confirm("신고된 회원을 블랙리스트 회원으로 변경 하시겠습니까?")){							
							location.href="<%=contextPath%>/delete.te?t_code="+t_code;
							}
						});
					});
			</script>
			<br><br>
			
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