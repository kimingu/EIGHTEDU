f<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	String n_name = (String)request.getAttribute("n_name");
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
</style>
</head>

<body>
	<%@ include file="../common/menuBar.jsp"%>


<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-white sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" id="ingu">
              <span data-feather="home"></span>
             고객센터 
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=공지사항"id="koo">
              <span data-feather="file"></span>
              공지사항      
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=qna" id="koo">
              <span data-feather="shopping-cart"></span>
      Q & A
            </a>
          </li>
        </ul>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=문의내역" id="koo">
              <span data-feather="file-text"></span>
              문의하기
                 
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://open.kakao.com/o/s7Qic8Db" id="koo">
              <span data-feather="file-text"></span>
              실시간 상담 
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/views/customerPage/howToCome.jsp" id="koo">
              <span data-feather="file-text"></span>
              찾아오시는 길 
                 <hr>
            </a>
          </li>
          <li class="nav-item">
           
          </li>
        </ul>
      </div>
    </nav>
   


    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">
		<% if(n_name.equals("공지사항")) {%>
         <img src = "<%= contextPath %>/resources/file/image/notice_image.jpg" width="100%" height="50%">
         <%} else if(n_name.equals("qna")){ %>
         <img src = "<%= contextPath %>/resources/file/image/qna_image.jpg" width="100%" height="50%">
         <%} else if(n_name.equals("문의내역")){ %>
         <img src = "<%= contextPath %>/resources/file/image/inquiry_image.jpg" width="100%" height="50%">
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
					<% if(list.isEmpty()){ %>
					<tr id="listNotice">
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for(Notice n : list) {
					%>
					<tr id="listNotice">
						<% if (loginUser != null) {%>
						<input id="u_id" type="hidden" value="<%=loginUser.getUserId() %>">
						<%} %>
						<input id="n_name" type="hidden" value="<%=n_name%>">
						<input id="n_code" type="hidden" value="<%=n.getN_code()%>">
						<input id="m_code" type="hidden" value="<%=m_code%>">
						<td width="100"><%=n.getN_code()%></td>
						<td width="100"><%=n.getM_name()%></td>
						<td width="500"><%=n.getN_title()%></td>
						<td width="100"><%=n.getAliass()%></td>
						<td width="100"><%=n.getN_count()%></td>
						<td width="150"><%=n.getCreate_date()%></td>
					</tr>
					<%}} %>
				</table>
			</div>
			
			<script>
				window.onload = function() {
					var n_name = $("#n_name").val();
					var m_code = $("#m_code").val();
					console.log(n_name);
					var notice = [ "전체보기", "주요공지", "일반공지", "진행중이벤트", "완료된이벤트", "에잇에듀뉴스" ];	
					var noticeVal = ["——", "301", "302", "303", "304", "305"];
					var noticeId = ["noAll", "big", "normal", "ing", "end", "news"];
					var qna = [ "전체보기", "회원관련", "결제관련", "강의관련","환불관련", "탈퇴관련" ];
					var qnaVal = ["310", "311", "312", "313", "314", "315"];
					var qnaId = ["qnaAll", "user", "pay", "lecture", "refund", "out"];
					var inquiry = [  "","전체보기", "미접수문의", "완료된문의","미해결문의" ];
					var inquiryVal = ["", "——", "321", "322", "323"];
					var inquiryId = ["", "inAll", "mada", "owari", "nai"];
					var changeCate;
					var changeVal;
					var changeId;
					if (n_name == "공지사항" || m_code == "301" || m_code == "302" || m_code == "303" || m_code == "304" || m_code == "305" ) {
						changeCate = notice;
						changeVal = noticeVal;
						changeId = noticeId;
					} else if (n_name == "qna" || m_code == "311" || m_code == "312" || m_code == "313" || m_code == "314" || m_code == "315") {
						changeCate = qna;
						changeVal = qnaVal;
						changeId = qnaId;
					} else if (n_name == "문의내역" || m_code == "321" || m_code == "322" || m_code == "323") {
						changeCate = inquiry;
						changeVal = inquiryVal;
						changeId = inquiryId;
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
			 $("#navi").click(function(e){
	               var data;
	               console.log(e.target.id);
	               switch(e.target.id){
	               case "big" : data = "301"; break;
	               case "normal" : data = "302"; break;
	               case "ing" : data = "303"; break;
	               case "end" : data = "304"; break;
	               case "news" : data = "305"; break;
	               case "user" : data = "311"; break;
	               case "pay" : data = "312"; break;
	               case "lecture" : data = "313"; break;
	               case "refund" : data = "314"; break;
	               case "out" : data = "315"; break;
	               case "mada" : data = "321"; break;
	               case "owari" : data = "322"; break;
	               case "nai" : data = "323"; break;
	               case "noAll" : data = "300"; break;
	               case "qnaAll" : data = "310"; break;
	               case "inAll" : data ="320"; break;
	               }
	               console.log(data);
	               
	           	   location.href="<%=request.getContextPath()%>/list.no?data="+data;

	              /*  $.ajax({
	                  url : "list.no",
	                  data : {data : data},
	                  type : "get",
	                  success : function(list){
						var $listArea = $("#listArea");
						$listArea.html("");
	                  },
	                  error : function(){
	                	  console.log("통신실패!");
	                  }
	               }); */
	            }); 
			 </script>
			
			<%if(keyword == null && m_code == null) {%>
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=1&n_name=<%=n_name%>'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
				<button disabled>&lt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=currentPage-1%>&n_name=<%=n_name%>'">
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
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=p%>&n_name=<%=n_name%>'"><%=p%></button>
				<% } %>
				<% } %>

				<!-- 다음 페이지로 (>) -->
				<% if(currentPage == maxPage){ %>
				<button disabled>&gt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>&n_name=<%=n_name%>'">
					&gt;</button>
				<% } %>

				<!-- 맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=maxPage%>&n_name=<%=n_name%>'">
					&gt;&gt;</button>
			</div>
			<%}else if(keyword != null && m_code == null) { %>
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%= contextPath %>/search.no?currentPage=1&n_name=<%=n_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
				<button disabled>&lt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/search.no?currentPage=<%=currentPage-1%>&n_name=<%=n_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
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
					onclick="location.href='<%= contextPath %>/search.no?currentPage=<%=p%>&n_name=<%=n_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"><%=p%></button>
				<% } %>
				<% } %>

				<!-- 다음 페이지로 (>) -->
				<% if(currentPage == maxPage){ %>
				<button disabled>&gt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%=contextPath%>/search.no?currentPage=<%=currentPage+1%>&n_name=<%=n_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
					&gt;</button>
				<% } %>

				<!-- 맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%= contextPath %>/search.no?currentPage=<%=maxPage%>&n_name=<%=n_name%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'">
					&gt;&gt;</button>
			</div>
			<%} else if(m_code != null && keyword == null){ %>
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=1&data=<%=m_code%>'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
				<button disabled>&lt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=currentPage-1%>&data=<%=m_code%>'">
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
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=p%>&data=<%=m_code%>'"><%=p%></button>
				<% } %>
				<% } %>

				<!-- 다음 페이지로 (>) -->
				<% if(currentPage == maxPage){ %>
				<button disabled>&gt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>&data=<%=m_code%>'">
					&gt;</button>
				<% } %>

				<!-- 맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%= contextPath %>/list.no?currentPage=<%=maxPage%>&data=<%=m_code%>'">
					&gt;&gt;</button>
			</div>
			<%} %>
			<br>
			
			<hr>
			<div class="searchArea" align="center">
			<form action="<%=contextPath%>/search.no">
				<input id="n_name" name="n_name" type="hidden" value="<%=n_name%>">
				<select id="searchCondition" name="searchCondition">
					<option>-----</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> 
				<input type="search" name="searchKeyword">
				<button id="searchBtn" type="submit">검색하기</button>			
			<% if(loginUser != null && loginUser.getUserId().equals("master")){ %>
				<button id="insertBtn" type="button"
					onclick="location.href='<%=contextPath%>/views/customerPage/insertNotice.jsp'">작성하기</button>
			<%} else if(loginUser != null && !loginUser.getUserId().equals("master") && n_name.equals("문의내역")){ %>
			<button id="insertBtn" type="button"
					onclick="location.href='<%=contextPath%>/views/customerPage/insertNotice.jsp'">작성하기</button>
			<%} %>
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
						//var b_code = $(this).parent().children("input").val();

						var n_code = $(this).parent().children("#n_code").val();
						location.href="<%=contextPath%>/detail.no?n_code="+n_code;
									});
				});
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