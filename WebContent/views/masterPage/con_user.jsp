<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.ArrayList, master.user.model.vo.*"%>
<%
	ArrayList<master.user.model.vo.User> list = (ArrayList<master.user.model.vo.User>)request.getAttribute("list");
	ArrayList<master.user.model.vo.User> list2 = (ArrayList<master.user.model.vo.User>)request.getAttribute("list2");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	PageInfo pi2 = (PageInfo)request.getAttribute("pi2");

   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   
   int listCount2 = pi2.getListCount();
   int currentPage2 = pi2.getCurrentPage();
   int maxPage2 = pi2.getMaxPage();
   int startPage2 = pi2.getStartPage();
   int endPage2 = pi2.getEndPage();
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
      width:650px;
      height:350px;
      margin:auto;
   }
   
   .AllUser{
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
                     href="<%=contextPath%>/views/masterPage/dashBoard.jsp" id="koo">
                        <span data-feather="file"></span> 대시보드
                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
                        <span data-feather="shopping-cart"></span> 컨텐츠 관리
                  </a></li>
               </ul>
            </div>
         </nav>

         <div class="AllUser">
            <br>
            
            <h2 align="center">회원 리스트</h2>
            <div class="tableArea">
               <table align="center" id="listArea">
                  <tr>
                     <th width="100">No.</th>
                  <th width="100">아이디</th>
                  <th width="150">닉네임</th>
                  <th width="200">이메일</th>
                  <th width="200">연락처</th>
                  <th width="200">주소</th>
                  <th width="200">가입일</th>
                  <th width="100">비고</th>
                  </tr>

                  <% if(list.isEmpty()){ %>
                  <tr>
                     <td colspan="8">조회된 리스트가 없습니다.</td>
                  </tr>
                  <%
                  } else {
                	  for(master.user.model.vo.User u : list){
                  	%>
               <tr>
                  <td><%= u.getUser_Code()%></td>
                  <td><%= u.getUser_Id()%></td>
                  <td><%= u.getUser_Name() %></td>
                  <td><%= u.getEmail() %></td>
                  <td><%= u.getPhone() %></td>
                  <td><%= u.getAddress()%></td>
                  <td><%= u.getEnroll_date()%></td>
                  <td><button id="deletebtn" onclick="location='delete.mus?user_code=<%= u.getUser_Code()%>'">삭제</button><td>                  
                  
                  <!-- 음영 길이 안 늘어난 이유 : 밑에서 listArea td에 css를 먹였으니까 위에서 비고 칸 생성해서 길이 늘리려면
                  	 여기서도 <td></td>해서 내용칸을 만들어줘야 한다! -->
               </tr>
                  <% } %>
                  <% } %>
               </table>
               
            </div>
            <!-- 페이징바 -->
            <div class="pagingbar" align="center">
               <button onclick="location.href='<%= contextPath %>/list.us?currentPage=1'"> &lt;&lt; </button>
            
            <!-- 이전페이지로이동 -->
               <% if(currentPage == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.us?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
         <% } %>
         <!-- 페이지목록 -->
         <% for(int p = startPage; p <= endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.us?currentPage=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
            <!-- 다음페이지로 이동-->
            <% if(currentPage == maxPage){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.us?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
         <% } %>
         <!-- 맨 끝페이지로 이동 -->
         <button onclick="location.href='<%= contextPath %>/list.us?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
            
            
            <br>
            <br>
            
            
            <div class="ReportUser">
            <br>
            
            <h2 align="center">블랙 회원 리스트</h2>
            <div class="tableArea">
               <table align="center" id="listArea">
                  <tr>
                     <th width="100">No.</th>
                  <th width="100">아이디</th>
                  <th width="150">닉네임</th>
                  <th width="200">이메일</th>
                  <th width="200">연락처</th>
                  <th width="200">주소</th>
                  <th width="200">가입일</th>
                  <th width="100">비고</th>
                  </tr>

                  <% if(list2.isEmpty()){ %>
                  <tr>
                     <td colspan="8">조회된 리스트가 없습니다.</td>
                  </tr>
                  <%
                  } else {
                	  for(master.user.model.vo.User u : list2){
                  	%>
               <tr>
                  <td><%= u.getUser_Code()%></td>
                  <td><%= u.getUser_Id()%></td>
                  <td><%= u.getUser_Name() %></td>
                  <td><%= u.getEmail() %></td>
                  <td><%= u.getPhone() %></td>
                  <td><%= u.getAddress()%></td>
                  <td><%= u.getEnroll_date()%></td>
                  <td><button id="deletebtn" onclick="location='return.us?user_code=<%= u.getUser_Code()%>'">복구</button><td>                  
                  
                  <!-- 음영 길이 안 늘어난 이유 : 밑에서 listArea td에 css를 먹였으니까 위에서 비고 칸 생성해서 길이 늘리려면
                  	 여기서도 <td></td>해서 내용칸을 만들어줘야 한다! -->
               </tr>
                  <% } %>
                  <% } %>
               </table>
               
            </div>
               <!-- 페이징바 -->
            <div class="pagingbar" align="center">
               <button onclick="location.href='<%= contextPath %>/list.us?currentPage2=1'"> &lt;&lt; </button>
            
            <!-- 이전페이지로이동 -->
               <% if(currentPage2 == 1){ %>
            <button disabled> &lt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.us?currentPage2=<%= currentPage2 - 1 %>'"> &lt; </button>
         <% } %>
         <!-- 페이지목록 -->
         <% for(int p = startPage2; p <= endPage2; p++){ %>
            <% if(p == currentPage2){ %>
               <button disabled> <%= p %> </button>
            <% } else { %>
               <button onclick="location.href='<%= contextPath %>/list.us?currentPage2=<%= p %>'"><%= p %></button>
            <% } %>
         <% } %>
            <!-- 다음페이지로 이동-->
            <% if(currentPage2 == maxPage2){ %>
            <button disabled> &gt; </button>
         <% } else { %>
            <button onclick="location.href='<%= contextPath %>/list.us?currentPage2=<%= currentPage2 + 1 %>'"> &gt; </button>
         <% } %>
         <!-- 맨 끝페이지로 이동 -->
         <button onclick="location.href='<%= contextPath %>/list.us?currentPage2=<%= maxPage2 %>'"> &gt;&gt; </button>
            </div>
            
            <script>
      $(function(){
         $("#listArea td").mouseenter(function(){
            $(this).parent().css({
            	"background":"darkgray", 
            	/* "cursor":"pointer" */
            	});
         }).mouseout(function(){
            $(this).parent().css({
            	"background":"white"
            	});
      });
      });
   </script>
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