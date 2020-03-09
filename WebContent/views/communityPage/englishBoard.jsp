<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	String b_name = (String)request.getAttribute("b_name");
	String m_code = (String)request.getAttribute("data");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String keyword = (String)request.getAttribute("keyword");
	String condition = (String)request.getAttribute("condition");
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

 #insertBtn {
float:right;
} 

/* 
#search{
width:500px;
float:center;
} */
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
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">
		<% if(b_name.equals("영어")) {%>
         <img src = "<%= contextPath %>/resources/file/image/english_board.jpg" width="100%" height="50%">
         <%} else if(b_name.equals("일본어")){ %>
         <img src = "<%= contextPath %>/resources/file/image/japan_board.jpg" width="100%" height="50%">
         <%} else if(b_name.equals("중국어")){ %>
         <img src = "<%= contextPath %>/resources/file/image/china_board.jpg" width="100%" height="50%">
         <%} else if(b_name.equals("자료실")){ %>
         <img src = "<%= contextPath %>/resources/file/image/data_board.jpg" width="100%" height="50%">
         <%} %>
			</div>

			<div id="navi-wrapper">
				<ul id="navi" align="center">
				</ul>
			</div>
			<div>
				<hr>
			</div>

			<div class="tableArea">
				<table align="center" id="listArea">
					<tr id="senter">
						<th width="100">글번호</th>
						<th width="100">카테고리</th>
						<th width="500" id="title">글제목</th>
						<th width="100">작성자</th>
						<th width="100">조회수</th>
						<th width="150">작성일</th>
					</tr>
					<%
						if (list.isEmpty()) {
					%>
					<tr id="listBoard">
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (Board b : list) {
					%>
					<tr id="listBoard">
						<input id="b_name" type="hidden" value="<%=b_name%>">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<input id="m_code" type="hidden" value="<%=m_code%>">
						<td width="100"><%=b.getB_code()%></td>
						<td width="100"><%=b.getM_name()%></td>
						<td width="500"><%=b.getB_title()%></td>
						<td width="100"><%=b.getAliass()%></td>
						<td width="100"><%=b.getB_count()%></td>
						<td width="150"><%=b.getCreate_date()%></td>
					</tr>
					<% }} %>

				</table>
			</div>
			<script>
            window.onload = function() {
               var b_name = $("#b_name").val();
               var m_code = $("#m_code").val();
               
               var ebBoard = [ "전체보기","잡담", "질문","정보", "공부팁", "시험후기" ];
               var ebBoardVal = [ "100","101","102","103","104","105" ];
               var ebBoardId = [ "ebboAll","ebnoise","ebqna","ebinfo","ebtip","ebtest" ];
               
               var dataBoard = [ "전체보기", "기출문제", "답안지","수업자료", "사진", "그 외 자료" ];
               var dataVal = [ "110","111","112","113","114","115" ];
               var dataId = [ "dtAll", "prev", "answer", "teaching", "picture", "out" ];
               
               var jpBoard = [ "전체보기","잡담", "질문","정보", "공부팁", "시험후기" ];
               var jpBoardVal = [ "120","121","122","123","124","125" ];
               var jpBoardId = [ "jpboAll","jpnoise","jpqna","jpinfo","jptip","jptest" ];
               
               var chBoard = [ "전체보기","잡담", "질문","정보", "공부팁", "시험후기" ];
               var chBoardVal = [ "130","131","132","133","134","135" ];
               var chBoardId = [ "chboAll","chnoise","chqna","chinfo","chtip","chtest" ];

               var changeCate;
               var changeVal;
			   var changeId;
               
               if (b_name == "영어" || m_code == "101" || m_code == "102" || m_code == "103" || m_code =="104" || m_code =="105" ) {         	   
                  changeCate = ebBoard;
                  changeVal = ebBoardVal;
                  changeId = ebBoardId;
               } else if (b_name == "자료실" || m_code == "111" || m_code == "112" || m_code == "113" || m_code == "114" || m_code == "115") {
                  changeCate = dataBoard;
                  changeVal = dataVal;
                  changeId = dataId;
               } else if( b_name == "일본어"|| m_code == "121" || m_code == "122" || m_code == "123" || m_code =="124" || m_code =="125") {
            	   changeCate = jpBoard;
                   changeVal = jpBoardVal;
                   changeId = jpBoardId;
               } else if( b_name == "중국어"|| m_code == "131" || m_code == "132" || m_code == "133" || m_code =="134" || m_code =="135") {
            	   changeCate = chBoard;
                   changeVal = chBoardVal;
                   changeId = chBoardId;
               }
               
               $('#navi').empty();
               for (var i = 0; i < changeCate.length; i++) {
            	  var li = $("<li value='"+changeVal[i]+"'><a href='#' id='" + changeId[i] + "'>" + changeCate[i]+"</a></li>");
                  $('#navi').append(li);
               }
            }         
         </script>
			<hr>
			
			<script>
			 $('#navi').click(function(e){
	              var data;
	               switch(e.target.id){
	               case "ebboAll" : data = "100"; break;
	               case "ebnoise" : data = "101"; break;
	               case "ebqna" : data = "102"; break;
	               case "ebinfo" : data = "103"; break;
	               case "ebtip" : data = "104"; break;
	               case "ebtest" : data = "105"; break;
	               case "dtAll" : data = "110"; break;
	               case "prev" : data = "111"; break;
	               case "answer" : data = "112"; break;
	               case "teaching" : data = "113"; break;
	               case "picture" : data = "114"; break;
	               case "out" : data = "115"; break;
	               case "jpboAll" : data = "120"; break;
	               case "jpnoise" : data = "121"; break;
	               case "jpqna" : data = "122"; break;
	               case "jpinfo" : data = "123"; break;
	               case "jptip" : data = "124"; break;
	               case "jptest" : data = "125"; break;
	               case "chboAll" : data = "130"; break;
	               case "chnoise" : data = "131"; break;
	               case "chqna" : data = "132"; break;
	               case "chinfo" : data = "133"; break;
	               case "chtip" : data = "134"; break;
	               case "chtest" : data = "135"; break;
	               }
	               console.log(data);
	               
	           	   location.href="<%=request.getContextPath()%>/list.bo?data="+data;
			 });
			</script>
			
			<%if(keyword == null && m_code == null) {%>
         <div class="pagingArea" align="center">
            <!-- 맨 처음으로 (<<) -->
            <button
               onclick="location.href='<%= contextPath %>/list.bo?currentPage=1&b_name=<%=b_name%>'">
               &lt;&lt;</button>

            <!-- 이전 페이지로 (<) -->
            <% if(currentPage == 1){ %>
            <button disabled>&lt;</button>
            <% } else { %>
            <button
               onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=currentPage-1%>&b_name=<%=b_name%>'">
               &lt;</button>
            <% } %>

            <!-- 10개의 페이지 목록 -->
            <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
            <button disabled>
               <%= p %>
            </button>
            <% } else { %>
            <button
               onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=p%>&b_name=<%=b_name%>'"><%=p%></button>
            <% } %>
            <% } %>

            <!-- 다음 페이지로 (>) -->
            <% if(currentPage == maxPage){ %>
            <button disabled>&gt;</button>
            <% } else { %>
            <button
               onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>&b_name=<%=b_name%>'">
               &gt;</button>
            <% } %>

            <!-- 맨 끝으로 (>>) -->
            <button
               onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=maxPage%>&b_name=<%=b_name%>'">
               &gt;&gt;</button>
         </div>
         <%}else if(keyword != null && m_code == null) { %>
         <div class="pagingArea" align="center">
            <!-- 맨 처음으로 (<<) -->
            <button
               onclick="location.href='<%= contextPath %>/search.bo?currentPage=1&b_name=<%=b_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
               &lt;&lt;</button>

            <!-- 이전 페이지로 (<) -->
            <% if(currentPage == 1){ %>
            <button disabled>&lt;</button>
            <% } else { %>
            <button
               onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%=currentPage-1%>&b_name=<%=b_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
               &lt;</button>
            <% } %>

            <!-- 10개의 페이지 목록 -->
            <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
            <button disabled>
               <%= p %>
            </button>
            <% } else { %>
            <button
               onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%=p%>&b_name=<%=b_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"><%=p%></button>
            <% } %>
            <% } %>

            <!-- 다음 페이지로 (>) -->
            <% if(currentPage == maxPage){ %>
            <button disabled>&gt;</button>
            <% } else { %>
            <button
               onclick="location.href='<%=contextPath%>/search.bo?currentPage=<%=currentPage+1%>&b_name=<%=b_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
               &gt;</button>
            <% } %>

            <!-- 맨 끝으로 (>>) -->
            <button
               onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%=maxPage%>&b_name=<%=b_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
               &gt;&gt;</button>
         </div>
         <%}else if(m_code != null && keyword == null){ %>
         	<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%= contextPath %>/list.bo?currentPage=1&data=<%=m_code%>'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
				<button disabled>&lt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=currentPage-1%>&data=<%=m_code%>'">
					&lt;</button>
				<% } %>

				<!-- 10개의 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
				<button disabled>
					<%= p %>
				</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=p%>&data=<%=m_code%>'"><%=p%></button>
				<% } %>
				<% } %>

				<!-- 다음 페이지로 (>) -->
				<% if(currentPage == maxPage){ %>
				<button disabled>&gt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>&data=<%=m_code%>'">
					&gt;</button>
				<% } %>

				<!-- 맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%=maxPage%>&data=<%=m_code%>'">
					&gt;&gt;</button>
			</div>
			<%} %>
         <br>


			<div class="searchArea" align="center">
				<form action="<%=contextPath%>/search.bo" id="search">
				<input id="b_name" name="b_name" type="hidden" value="<%=b_name%>">
					<select id="searchCondition" name="searchCondition">
						<option>-----</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					<input type="search" name="searchKeyword">
					<button id="searchBtn" type="submit">검색하기</button>
				<%
					if (loginUser != null) {
				%>
				<button id="insertBtn" type="button"
					onclick="location.href='<%=contextPath%>/views/communityPage/insertBoard.jsp'">작성하기</button>
				<%
					}
				%>
				</form>

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
			</script> </main>

		</div>
	</div>

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