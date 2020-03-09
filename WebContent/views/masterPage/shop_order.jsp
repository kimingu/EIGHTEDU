<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.ArrayList, master.order.model.vo.*"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	ArrayList<Order> list2 = (ArrayList<Order>)request.getAttribute("list2");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	PageInfo pi2 = (PageInfo)request.getAttribute("pi2");

   int listCount = pi.getListCount(); 
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   
   int listCount2 = pi.getListCount(); 
   int currentPage2 = pi.getCurrentPage();
   int maxPage2 = pi.getMaxPage();
   int startPage2 = pi.getStartPage();
   int endPage2 = pi.getEndPage();
%>
<!-- 주문 관리 페이지 -->
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
      width:650px;
      height:350px;
      margin:auto;
   }
   
   .order{
      margin-left:15%;
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
                     href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
                        <span data-feather="shopping-cart"></span> 컨텐츠 관리
                  </a></li>
               </ul>
            </div>
         </nav>

         <div class="order">
            <br>
            
            <h2 align="center">미접수 주문 리스트</h2>
            <div class="tableArea">
               <table align="center" id="listArea">
                  <tr>
                     <th width="200">주문번호</th>
                  <!-- <th width="100">상품명</th> -->
                  <th width="100">주문자</th>
                  <th width="100">주문수</th>
                  <th width="200">주문일</th>
                  <th width="150">주문상태</th>
                  </tr>
                  <% if(list.isEmpty()){ %>
                  <tr>
                     <td colspan="7">주문 목록이 없습니다.</td>
                  </tr>
                  <% } else { %>
                  <% for(Order o : list) {%>
               <tr>
                  <input type="hidden" value="<%= o.getOrder_Num()%>">
                  <td><%= o.getUser_code()%></td>
                  <td><%= o.getPro_num()%></td>
                  <td><%= o.getOrder_date() %></td>
               </tr>
                  <% } %>
                  <% } %>
               </table>
            </div>
            <!-- 페이징바 -->
            <div class="pagingbar" align="center">
               <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=1'"> &lt;&lt; </button>
            <!-- 이전페이지로이동 -->
               <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
         <% } %>
         <!-- 페이지목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
            <!-- 다음페이지로 이동-->
            <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
         <% } %>
         <!-- 맨 끝페이지로 이동 -->
         <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
            
            
             <div class="order">
            <br>
            
            <h2 align="center">접수완료 주문 리스트</h2>
            <div class="tableArea">
               <table align="center" id="listArea">
                  <tr>
                     <th width="200">주문번호</th>
                  <!-- <th width="100">상품명</th> -->
                  <th width="100">주문자</th>
                  <th width="100">주문수</th>
                  <th width="200">주문일</th>
                  <th width="150">주문상태</th>
                  </tr>
                  <% if(list2.isEmpty()){ %>
                  <tr>
                     <td colspan="7">주문 목록이 없습니다.</td>
                  </tr>
                  <% } else { %>
                  <% for(Order o : list2) {%>
               <tr>
                  <input type="hidden" value="<%= o.getOrder_Num()%>">
                  <td><%= o.getUser_code()%></td>
                  <td><%= o.getPro_num()%></td>
                  <td><%= o.getOrder_date() %></td>
               </tr>
                  <% } %>
                  <% } %>
               </table>
            </div>
            <!-- 페이징바 -->
            <div class="pagingbar" align="center">
               <button onclick="location.href='<%= contextPath %>/list.bo?currentPage2=1'"> &lt;&lt; </button>
            <!-- 이전페이지로이동 -->
               <% if(currentPage2 == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage2=<%= currentPage2 - 1 %>'"> &lt; </button>
         <% } %>
         <!-- 페이지목록 -->
         <% for(int p = startPage2; p <= endPage2; p++){ %>
            <% if(p == currentPage2){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.bo?currentPage2=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
            <!-- 다음페이지로 이동-->
            <% if(currentPage2 == maxPage2){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage2=<%= currentPage2 + 1 %>'"> &gt; </button>
         <% } %>
         <!-- 맨 끝페이지로 이동 -->
         <button onclick="location.href='<%= contextPath %>/list.bo?currentPage2=<%= maxPage2 %>'"> &gt;&gt; </button>
            </div>
            <script>
      // 상세보기 기능 구현
      $(function(){
         $("#listArea td").mouseenter(function(){
            $(this).parent().css({"background":"darkgray", "cursor":"pointer"});
         }).mouseout(function(){
            $(this).parent().css({"background":"black"});
         }).click(function(){
            var bId = $(this).parent().children("input").val();
      });
      });
   </script>

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