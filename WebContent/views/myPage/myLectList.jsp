<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.*, user.model.vo.LecList, board.model.vo.*"%>
<%
   ArrayList<LecList> list = (ArrayList<LecList>)request.getAttribute("list");
   
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
               <img src="<%=contextPath%>/resources/file/image/class_my.jpg"
                  id="bener">
            </div>
            <div class="inner2">
               <hr>
               <div id="navi-wrapper">
                  <ul id="navi">
                     <li><a href="#" id="all">전체보기</a></li>
                     <li><a href="#" id="inClass">수강중</a></li>
                     <li><a href="#" id="endClass">수강완료</a></li>
                  </ul>
               </div>
               <hr>
               <div id="leclist">
                  <table id="lectable">
                     <tr>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>강사</th>
                        <th>상태</th>
                     </tr>
                     
                     <% if(!list.isEmpty()){ %>
                        <% for (int i = 0; i < list.size(); i++) {%>
                        <tr id="lectArea">
                           <td><%=list.get(i).getLecName() %></td>
                           <td><%=list.get(i).getLecType() %></td>
                           <td><%=list.get(i).getTeacherName() %></td>
                           <td><%=list.get(i).getLecLevel() %></td>
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
               <div id="pageBtnbar">
                  <!-- 맨 처음으로 (<<) -->
                  <button id="goFirst">&lt;&lt;</button>
                  <!-- 이전 페이지로 (<) -->
                  <% if(currentPage == 1){ %>
                  <button id="before" disabled>&lt;</button>
                  <% } else { %>
                  <button id="before">&lt;</button>
                  <% } %>

                  <!-- 10개의 페이지 목록 -->
                  <% for(int p = startPage; p <= endPage; p++){ %>
                  <% if(p == currentPage){ %>
                  <button id="page" disabled><%= p %></button>
                  <% } else { %>
                  <button id="page"><%= p %></button>
                  <% } %>
                  <% } %>

                  <!-- 다음 페이지로 (>) -->
                  <% if(currentPage == maxPage){ %>
                  <button id="next" disabled>&gt;</button>
                  <% } else { %>
                  <button id="next">&gt;</button>
                  <% } %>

                  <!-- 맨 끝으로 (>>) -->
                  <button id="end">&gt;&gt;</button>
               </div>
               <input type="hidden" id="datas"> <input type="hidden"
                  id="max" value="<%=maxPage%>"> <input type="hidden"
                  id="current" value="<%=currentPage %>">
               <input type="hidden" id="userCode" value="<%=loginUser.getUserCode()%>">
            </div>
            <script>
               $(function(){
                  $(document).on('click', 'button', function(e){
                     var data = $("#datas").val();
                     var userCode = $("#userCode").val();
                     var currentPage = $("#current").val();
                     switch(e.target.id){
                     case "goFirst": currentPage = 1; break;
                     case "before": currentPage = parseInt(currentPage) - 1; break;
                     case "page": currentPage = e.target.innerHTML; break;
                     case "next": currentPage = parseInt(currentPage) + 1; break;
                     case "end": currentPage = $("#max").val(); break;
                     }
                     
                     $.ajax({
                        url : "MyLectList.us",
                        data : {data : data, currentPage : currentPage, userCode : userCode},
                        type : "post",
                        success : function(list){
                           $.each(list, function(index, v){
                              if(index.includes("PageInfo")){
                                 var $pageBtnbar = $("#pageBtnbar");
                                 $pageBtnbar.html("");
                                 var $btn1 = $("<button id='goFirst'>").text(" << ");
                                 var $btn2;
                                 if(v.currentPage == 1){
                                    $btn2 = $("<button id='before' disabled>").text("<");
                                 }else{
                                    $btn2 = $("<button id='before'>").text(" < ");
                                 }
                                 var $btn3 = new Array();
                                 for(var p = v.startPage; p <= v.endPage; p++){
                                    if(p == v.currentPage){
                                       $btn3[p] = $("<button id='page' disabled>").text( p );
                                    }else{
                                       $btn3[p] = $("<button id='page'>").text( p );
                                    }
                                 }
                                 var $btn4;
                                 if(v.currentPage == v.maxPage){
                                    $btn4 = $("<button id='next' disabled>").text(" > ");
                                 }else{
                                    $btn4 = $("<button id='next'>").text(" > ");
                                 }
                                 var $btn5 = $("<button id='end'>").text(" >> ");
                                 var $btn6 = $("<input type=hidden>").text(v.currentPage);
                                 $pageBtnbar.append($btn1);
                                 $pageBtnbar.append($btn2);
                                 $pageBtnbar.append($btn3);
                                 $pageBtnbar.append($btn4);
                                 $pageBtnbar.append($btn5); 
                                 $pageBtnbar.append($btn6);
                                 $("#current").val(currentPage);
                                 console.log($("#current").val());
                              }
                              else if(index.includes("LecList")){
                                 var $inner = $("#lectable");
                                 var $trH = $("<tr>");
                                 var $th1 = $("<th>").text("과목명");
                                 var $th2 = $("<th>").text("분류");
                                 var $th3 = $("<th>").text("강사");
                                 var $th4 = $("<th>").text("상태");
                                 $inner.html("");
                                 $trH.append($th1);
                                 $trH.append($th2);
                                 $trH.append($th3);
                                 $trH.append($th4);
                                 $inner.append($trH);
                                 if(v){
                                    $.each(v, function(index, value){
                                       var $tr = $("<tr>");
                                       var $td1 = $("<td>").text(value.lecName);
                                       var $td2 = $("<td>").text(value.lecType);
                                       var $td3 = $("<td>").text(value.teacherName);
                                       var $td4 = $("<td>").text(value.lecLevel);
                                       $tr.append($td1);
                                       $tr.append($td2);
                                       $tr.append($td3);
                                       $tr.append($td4);
                                       $inner.append($tr);
                                    });
                                 }else{
                                    var $td = $("<td>").text("조회된 목록이 없습니다.");
                                    $inner.append($td);
                                 }
                              }else{
                                 $("#datas").val(v);
                              }
                           });
                        },
                        error: function(){
                           console.log("error");
                        }
                     });
                  });
                  
                  $("li").click(function(e){
                     var data;
                     var userCode = $("#userCode").val();
                     
                     switch(e.target.id){
                     case "all": data = "전체"; break;
                     case "inClass": data = "수강중"; break;
                     case "endClass": data = "수강완료"; break;s
                     }
                     $("#datas").val(data);
                     $.ajax({
                        url : "MyLectList.us",
                        data : {data : data, userCode : userCode},
                        type : "post",
                        success : function(list){
                           $.each(list, function(index, v){
                              if(index.includes("PageInfo")){
                                 var $pageBtnbar = $("#pageBtnbar");
                                 $pageBtnbar.html("");
                                 var $btn1 = $("<button id='goFirst'>").text("<<");
                                 var $btn2;
                                 if(v.currentPage == 1){
                                    $btn2 = $("<button id='before' disabled>").text("<");
                                 }else{
                                    $btn2 = $("<button id='before'>").text("<");
                                 }
                                 var $btn3 = new Array();
                                 for(var p = v.startPage; p <= v.endPage; p++){
                                    console.log(p);
                                    if(p == v.currentPage){
                                       $btn3[p] = $("<button id='page' disabled>").text(p);
                                    }else{
                                       $btn3[p] = $("<button id='page'>").text(p);
                                    }
                                 }
                                 var $btn4;
                                 if(v.currentPage == v.maxPage){
                                    $btn4 = $("<button id='next' disabled>").text(">");
                                 }else{
                                    $btn4 = $("<button id='next'>").text(">");
                                 }
                                 var $btn5 = $("<button id='end'>").text(">>");
                                 var $btn6 = $("<input type=hidden>").text(v.currentPage);
                                 $pageBtnbar.append($btn1);
                                 $pageBtnbar.append($btn2);
                                 $pageBtnbar.append($btn3);
                                 $pageBtnbar.append($btn4);
                                 $pageBtnbar.append($btn5); 
                                 $pageBtnbar.append($btn6);
                              }
                              else if(index.includes("LecList")){
                                 var $inner = $("#lectable");
                                 var $trH = $("<tr>");
                                 var $th1 = $("<th>").text("과목명");
                                 var $th2 = $("<th>").text("분류");
                                 var $th3 = $("<th>").text("강사");
                                 var $th4 = $("<th>").text("상태");
                                 $inner.html("");
                                 $trH.append($th1);
                                 $trH.append($th2);
                                 $trH.append($th3);
                                 $trH.append($th4);
                                 $inner.append($trH);
                                 if(v){
                                    $.each(v, function(index, value){
                                       var $tr = $("<tr>");
                                       var $td1 = $("<td>").text(value.lecName);
                                       var $td2 = $("<td>").text(value.lecType);
                                       var $td3 = $("<td>").text(value.teacherName);
                                       var $td4 = $("<td>").text(value.lecLevel);
                                       $tr.append($td1);
                                       $tr.append($td2);
                                       $tr.append($td3);
                                       $tr.append($td4);
                                       $inner.append($tr);
                                    });
                                 }else{
                                    var $td = $("<td>").text("조회된 목록이 없습니다.");
                                    $inner.append($td);
                                 }
                              }else if(index.includes("[]")){
                                 var $inner = $("#lectable");
                                 $inner.html("");
                                 var $td = $("<td>").text("조회된 목록이 없습니다.");
                                 $inner.append($td);
                              }else{
                                 $("#datas").val(v);
                              }
                           });
                        },
                        error: function(){
                           console.log("error");
                        }
                     });
                  });
                  
               });
               </script>
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