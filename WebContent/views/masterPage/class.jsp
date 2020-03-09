<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, master.Class.model.vo.*"%>
    
    
    <%
   ArrayList<Classs> list = (ArrayList<Classs>) request.getAttribute("list");
    
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

   table {
      border:1px solid white;
      text-align:center;
   }
   
   .tableArea {
        min-height : 300px;
      width:100%;
      height:40%;
      margin:auto;
   }
   
   .order{
      margin-left:15%;
   }
   }
   
      
.title {
   text-align: center;
}
</style>

<!-- 필수 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
   
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
                     href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
                        <span data-feather="shopping-cart"></span> 컨텐츠 관리
                  </a></li>
               </ul>
            </div>
         </nav>


         <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
         <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">

            <img src="<%=contextPath%>/resources/file/image/lec_my.jpg"
               width="100%" height="50%">
         </div>


         <div>
            <table align="center" id="listArea">
               <tr id="senter">
            <th width="100" style="text-align: center">번호</th>
            <th width="350" style="text-align: center">강좌명</th>
              <th width="100" style="text-align: center">강의목차</th>
               <th width="500" style="text-align: center">강의제목</th>
               <th width="150" style="text-align: center">강사명</th>
               <th width="100" style="text-align: center">강의시간</th>
               </tr>
               <%
                  if (list.isEmpty()) {
               %>
               <tr>
                  <td colspan="6">존재하는 게시글이 없습니다.</td>
               </tr>
               <%
                  } else {
                     for (Classs c : list) {
               %>
               <tr>
               <input type="hidden" value="<%=c.getC_code()%>">
                  <td width="100"><%=c.getC_code() %></td>
                  <td width="350"><%=c.getL_title() %>
                  <td width="100"><%=c.getC_next()%></td>
                  <td width="500"><%=c.getC_title() %></td>
                  <td width="100"><%=c.getT_name() %></td>
                  <td width="100"><%=c.getC_time() %></td>
               </tr>
               <%
                  }
                  }
               %>

            </table>
         </div>
         <hr>
         
         <% if(keyword == null){ %>
         
         <div class="pagingArea" align="center">
         <!-- 맨 처음으로 (<<) -->
         <button onclick="location.href='<%= contextPath %>/list.cl?currentPage=1'"> 처음으로 </button>
         
         <!-- 이전 페이지로 (<) -->
         <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.cl?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
         <% } %>
         
         <!-- 10개의 페이지 목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.cl?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
         
         <!-- 다음 페이지로 (>) -->
         <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.cl?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
         <% } %>
         
         <!-- 맨 끝으로 (>>) -->
         <button onclick="location.href='<%= contextPath %>/list.cl?currentPage=<%= maxPage %>'"> 끝으로 </button>
         
          <button id="insertBtn"
               onclick="location.href='<%=contextPath%>/list.ch'">강의등록하기</button>
         
         </div>
         <% } else if(keyword != null){ %>
         
      <div class="pagingArea" align="center">
         <!-- 맨 처음으로 (<<) -->
         <button onclick="location.href='<%= contextPath %>/search.cl?currentPage=1&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> 처음으로 </button>
         
         <!-- 이전 페이지로 (<) -->
         <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/search.cl?currentPage=<%= currentPage - 1 %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> &lt; </button>
         <% } %>
         
         <!-- 10개의 페이지 목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/search.cl?currentPage=<%= p %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"><%=p%></button>
            <% } %>
         <% } %>
         
         <!-- 다음 페이지로 (>) -->
         <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/search.cl?currentPage=<%= currentPage + 1 %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> &gt; </button>
         <% } %>
         
         <!-- 맨 끝으로 (>>) -->
         <button onclick="location.href='<%= contextPath %>/search.cl?currentPage=<%= maxPage %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> 끝으로 </button>
         
         
         
         
         
         </div>
         <% } %>
      </div>
      <br>
      <div class="searchArea" align="center" style = "margin-left : 17%">
         <form action="<%=contextPath%>/search.cl">
            <select id="searchCondition" name="searchCondition">
               <option>-----</option>   
               <option value="l_title">강좌명</option>
               <option value="c_title">강의명</option>
               <option value="t_name">강사명</option>
            </select> 
            <input type="search" name="searchKeyword">
            <button id="searchBtn" type="submit">검색하기</button>
         
            
            
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
                  var c_code = $(this).parent().children("input").val();
                  
                  location.href="<%=contextPath%>/detail.cl?c_code="+c_code;

                           });

            });
         </script> 
         </main>

      </div>
   </div>
   
   

   <br> 

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