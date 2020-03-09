<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, master.Video.model.vo.Video, master.Video.model.vo.PageInfo"%>
    
    
    <%
   ArrayList<Video> list = (ArrayList<Video>) request.getAttribute("list");
    
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

            <img src="<%=contextPath%>/resources/file/image/video_my.jpg"
               width="100%" height="50%">
         </div>


         <div class="tableArea">
            <table id="listArea">
               <tr id="senter">
            <th width="100" class="title">번호</th>
            <th width="300" class="title">강좌명</th>
            <th width="300" class="title">강의명</th>
               <th width="300" class="title">영상주소</th>
               <th width="100" class="title">영상길이</th>


               </tr>
               <%
                  if (list.isEmpty()) {
               %>
               <tr>
                  <td colspan="6">존재하는 게시글이 없습니다.</td>
               </tr>
               <%
                  } else {
                     for (Video v : list) {
               %>
               <tr>
               <input type="hidden" value ="<%= v.getV_code() %>">
                     <td width="100"><%=v.getV_code() %></td>
                     <td width"="300"><%= v.getL_title() %></td>   
                     <td width="300"><%=v.getC_title() %></td>
                     <td width="300"><%= v.getV_link() %></td>
                     <td width="100"><%=v.getC_time() %></td>
                                                            

               </tr>

               <%
                  }
                  }
               %>

            </table>
         </div>
         <hr>
         
         <%if(keyword == null){ %>
         
         <div class="pagingArea" align="center">
         <!-- 맨 처음으로 (<<) -->
         <button onclick="location.href='<%= contextPath %>/list.video?currentPage=1'"> 처음으로 </button>
         
         <!-- 이전 페이지로 (<) -->
         <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.video?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
         <% } %>
         
         <!-- 10개의 페이지 목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.video?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
         
         <!-- 다음 페이지로 (>) -->
         <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.video?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
         <% } %>
         
         <!-- 맨 끝으로 (>>) -->
         <button onclick="location.href='<%= contextPath %>/list.video?currentPage=<%= maxPage %>'"> 끝으로 </button>
         <button id="insertBtn"
               onclick="location.href='<%=contextPath%>/list.chvideo'">작성하기</button>
               
      </div>
      <br>
         <div class="searchArea" align="center">
         <form action="<%=contextPath%>/search.vi">
            <input id="n_name" name="n_name" type="hidden" >
            <select id="searchCondition" name="searchCondition">
               <option value="c_title">강의명</option>
               <option value="l_title">강좌명</option>
            </select> 
            <input type="search" name="searchKeyword">
            <button id="searchBtn" type="submit">검색하기</button>
            
         </form>
         </div>
         
         <% } else if(keyword != null){ %>
         
         <div class="pagingArea" align="center">
         <!-- 맨 처음으로 (<<) -->
         <button onclick="location.href='<%= contextPath %>/search.vi?currentPage=1&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> 처음으로 </button>
         
         <!-- 이전 페이지로 (<) -->
         <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/search.vi?currentPage=<%= currentPage - 1 %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> &lt; </button>
         <% } %>
         
         <!-- 10개의 페이지 목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/search.vi?currentPage=<%= p %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"><%=p%></button>
            <% } %>
         <% } %>
         
         <!-- 다음 페이지로 (>) -->
         <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/search.vi?currentPage=<%= currentPage + 1 %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> &gt; </button>
         <% } %>
         
         <!-- 맨 끝으로 (>>) -->
         <button onclick="location.href='<%= contextPath %>//search.vi?currentPage=<%= maxPage %>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>'"> 끝으로 </button>
         
               
      </div>
         <div align = "center">
         <form action="<%=contextPath%>/search.vi">
            <input id="n_name" name="n_name" type="hidden" >
            <select id="searchCondition" name="searchCondition">
               <option value="c_title">강의명</option>
               <option value="l_title">강좌명</option>
            </select> 
            <input type="search" name="searchKeyword">
            <button id="searchBtn" type="submit">검색하기</button>
            
         </form>
         </div>
         
         <%} %>
         
         
            
      
         
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
                  var v_code = $(this).parent().children("input").val();
                  
                  location.href="<%=contextPath%>/detail.video?v_code="+v_code;

                           });

            });
         </script> 
         </main>

      </div>
   </div>

   <br><br><br>
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