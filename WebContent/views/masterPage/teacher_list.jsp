<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, master.teacher.model.vo.Teacher"%>

<%
	ArrayList<Teacher> t_list = (ArrayList<Teacher>)request.getAttribute("t_list");
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
			<h1>등록된 강사 목록</h1>
			<br>
				<table id="listArea">
					<tr id="senter">
						<th width="200">강사번호</th>
						<th width="200">강사이름</th>
						<th width="300">주소</th>
						<th width="120">휴대폰번호</th>
					</tr>
					<% if(t_list.isEmpty()){ %>
					<tr id="listNotice">
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for(Teacher t : t_list) {
					%>
					<tr id="listNotice">
					<input type="hidden" id="t_code" value=<%=t.getT_CODE()%>>
						<td width="200"><%=t.getT_CODE()%></td>
						<td width="200"><%=t.getT_NAME()%></td>
						<td width="300"><%=t.getT_ADDRESS()%></td>
						<td width="120"><%=t.getT_PHONE()%></td>
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
						var t_code = $(this).parent().children("#t_code").val();
						if(confirm("해당 강사를 목록에서 제거 하시겠습니까?")){							
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