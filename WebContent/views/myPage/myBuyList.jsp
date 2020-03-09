<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.*, user.model.vo.*, board.model.vo.*"%>
<%
   ArrayList<UserOrder> list = (ArrayList<UserOrder>)request.getAttribute("list");
   
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 중앙 게시판 이미지  */
.wrapper {
   height: 1000px;
   width: 80%;
}

.inner1 {
   height: 25%;
   width: 60%;
   margin: auto;
   margin-top: auto;
}

#bener {
   height: 100%;
   width: 100%;
}

.inner2 {
   height: 50%;
   width: 80%;
   margin: auto;
   margin-top: 3%;
}

#pageBtnbar {
   text-align: center;
   display: inline-block;
   margin-left: 40%;
}

#navi-wrapper {
   width: 100%;
   height: 8%;
   margin-left: 2%;
}

#navi {
   list-style-type: none;
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

div[id^=itemlist] {
   float: left;
   width: 24%;
   height: 50%;
   margin-right: 1%;
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

#leclist {
   margin-left: 10%;
}

#lectable {
   width: 100%;
}
.nav-item{
   cursor:pointer;
}
</style>
</head>
<body>
   <%@include file="../common/menuBar.jsp"%>
   <div class="container-fluid">
      <div class="row">
         <nav class="col-md-2 d-none d-md-block bg-white sidebar">
            <div class="sidebar-sticky">
               <ul class="nav flex-column">
                  <li class="nav-item"><a class="nav-link active" href="#"
                     id="ingu"> <span data-feather="home"></span> 마이페이지 <span
                        class="sr-only">(current)</span>
                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<%=contextPath %>/views/myPage/myInfo.jsp"
                     id="koo">  내 정보

                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<%=contextPath %>/productList.pro"
                     id="koo">포인트샵

                  </a></li>

               </ul>

               <ul class="nav flex-column mb-2">
                  <li class="nav-item"><a class="nav-link"
                     onclick="myLectList();"
                     id="koo">내 수강 정보

                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     onclick="myBuyList();"
                     id="koo">내 결제 내역

                  </a></li>
                  
               </ul>
            </div>
         </nav>
         <form method="post" action="<%=contextPath %>/MyLectList.us" class="l1">
            <% if(loginUser != null) {%>
            <input type="hidden" name="userCode" value="<%=loginUser.getUserCode() %>">
            <% } %>
         </form>
         <form method="post" action="<%=contextPath %>/MyBuyList.us" class="l2">
            <% if(loginUser != null) {%>
            <input type="hidden" name="userCode" value="<%=loginUser.getUserCode() %>">
            <% } %>
         </form>
         <script>
            function myLectList(){
               $(".l1").submit();
            }
            function myBuyList(){
               $(".l2").submit();
            }
         </script>
         <div class="wrapper">
            <br> <br>
            <div class="inner1">
               <img src="<%=contextPath%>/resources/file/image/pay_my.jpg"
                  id="bener">
            </div>
            <div class="inner2">   
               <hr>
               <div id="leclist">
                  <table id="lectable">
                     <tr>
                        <th>상품명</th>
                        <th>분류</th>
                        <th>가격</th>
                        <th>주문날짜</th>
                     </tr>
                     
                     <% if(!list.isEmpty()){ %>
                        <% for (int i = 0; i < list.size(); i++) {%>
                        <tr id="lectArea">
                           <td><%=list.get(i).getPro_name() %></td>
                           <td><%=list.get(i).getPro_type() %></td>
                           <td><%=list.get(i).getPrice() %></td>
                           <td><%=list.get(i).getOrder_date() %></td>
                        </tr>
                        <% } %>
                     <% } else{ %>
                        <tr>
                           <td colspan="4">조회된 목록이 없습니다.</td>
                        </tr>
                     <% } %>
                     
                  </table>
               </div>
               <br> <br>
               <div class="pagingArea" align="center">
            <!-- 맨 처음으로 (<<) -->
            <button onclick="location.href='<%= contextPath %>/MyBuyList.us?currentPage=1&userCode=<%=loginUser.getUserCode()%>'"> &lt;&lt; </button>
            
            <!-- 이전 페이지로 (<) -->
            <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/MyBuyList.us?currentPage=<%= currentPage - 1 %>&userCode=<%=loginUser.getUserCode()%>'"> &lt; </button>
            <% } %>
            
            <!-- 10개의 페이지 목록 -->
            <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
                  <button disabled> <%= p %> </button>
               <% } else { %>
                  <button onclick="location.href='<%= contextPath %>/MyBuyList.us?currentPage=<%= p %>&userCode=<%=loginUser.getUserCode()%>'"><%= p %></button>
               <% } %>
            <% } %>
            
            <!-- 다음 페이지로 (>) -->
            <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/MyBuyList.us?currentPage=<%= currentPage + 1 %>&userCode=<%=loginUser.getUserCode()%>'"> &gt; </button>
            <% } %>
            
            <!-- 맨 끝으로 (>>) -->
            <button onclick="location.href='<%= contextPath %>/MyBuyList.us?currentPage=<%= maxPage %>&userCode=<%=loginUser.getUserCode()%>'"> &gt;&gt; </button>
         </div>
            
         </div>
      </div>
   </div>
   </div>
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
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
   crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script>
<script>
   window.jQuery
         || document
               .write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
</script> -->
<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
   crossorigin="anonymous"></script>
</body>
</html>