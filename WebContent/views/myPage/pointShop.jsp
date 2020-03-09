<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, product.model.vo.Product, board.model.vo.*"%>
<%
   ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
   
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
   height: 40%;
   width: 60%;
   margin: auto;
   margin-top: 3%;
}

#pageBtnbar{
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
   width: 16%;
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
   font-size: 15px;
   padding: 5px 25px;
   color: rgb(154, 157, 160);
}

#navi li a:hover {
   color: black;
}


div[id^=itemlist] {
   float: left;
   width: 24%;
   height: 100%;
   margin-right: 1%;
}

#itemImg {
   width: 100%;
   height: 100%;
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

.buyBtn{
   border:1px solid white;
   color: white;
   border-radius: 5px;
   margin-left: 35%;
}

.buyBtn:hover{
   cursor:pointer;
}
#item-wrapper{
	margin-bottom : 300px;
	margin-right : 50px;
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
         <div class="wrapper">
            <br> <br>
            <div class="inner1">
               <img src="<%=contextPath%>/resources/file/image/point_my.jpg"
                  id="bener">
            </div>
            <div class="inner2">
               <hr>
               <div id="navi-wrapper">
                  <ul id="navi">
                     <li><a href="#" id="all">전체보기</a></li>
                     <li><a href="#" id="note">노트</a></li>
                     <li><a href="#" id="pencil">필기구</a></li>
                     <li><a href="#" id="calendar">캘린더</a></li>
                     <li><a href="#" id="book">도서</a></li>
                     <li><a href="#" id="etc">기타</a></li>
                  </ul>
               </div>
               <hr>
               <div id="item-wrapper" style="height: 100%;">
                  <% if(list != null){ %>
                     <% for (Product p : list) {%>
                        <div id="itemlist">
                        <form action="<%=contextPath%>/productInfo.pro" method="post">
                           <img src="<%=contextPath%>/resources/file/image/<%=p.getPro_name() %>.jpg"
                              id="itemImg">
                           <input type="hidden" value="<%=p.getPro_num()%>" name="pronum">
                           <input type="hidden" value="<%=p.getPro_name()%>" name="proname">
                           <input type="hidden" value="<%=p.getPrice()%>" name="proprice">
                           <input type="hidden" value="<%=p.getRemain()%>" name="remain">
                           <% if(loginUser != null) { %>
                           <input type="hidden" value="<%=loginUser.getUserCode() %>" name="loginUserCode">
                           <% } %>
                           <h5 align="center" name="proname"><%=p.getPro_name() %></h5>
                           <h5 align="center" name="proprice"><%=p.getPrice() %></h5>
                           <h5 align="center" name="remain" style="margin-bottom:0px">남은 수량 : <%=p.getRemain() %></h5>
                           <img class="buyBtn" src="<%=contextPath %>/resources/file/image/buybutton.png" width="70px" height="55px" onclick="buyFunction(this);">
                        </form>
                        </div>
                     <% } %>
                  <% } else{ %>
                     <div id="noItem">
                        <h4 align="center">존재하는 상품이 없습니다.</h4>
                     </div>
                  <% } %>
                  
               </div>
            <div id="pageBtnbar">
               <!-- 맨 처음으로 (<<) -->
               <button id="goFirst"> &lt;&lt; </button>
               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
                  <button id="before" disabled> &lt; </button>
               <% } else { %>
                  <button id="before"> &lt; </button>
               <% } %>
               
               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
                  <% if(p == currentPage){ %>
                     <button id="page" disabled ><%= p %></button>
                  <% } else { %>
                     <button id="page"><%= p %></button>
                  <% } %>
               <% } %>
               
               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
                  <button id="next" disabled> &gt; </button>
               <% } else { %>
                  <button id="next"> &gt; </button>
               <% } %>
               
               <!-- 맨 끝으로 (>>) -->
               <button id="end"> &gt;&gt; </button>
                  </div>
               <input type="hidden" id="datas">
               <input type="hidden" id="max" value="<%=maxPage%>">
               <input type="hidden" id="current" value="<%=currentPage %>">
            </div>
               <script>
                  function myLectList(){
                     $(".l1").submit();
                  }
                  $(function(){
                     
                     $(document).on('click', 'button', function(e){
                        var data = $("#datas").val();
                        var currentPage = $("#current").val();
                        switch(e.target.id){
                        case "goFirst": currentPage = 1; break;
                        case "before": currentPage = parseInt(currentPage) - 1; break;
                        case "page": currentPage = e.target.innerHTML; break;
                        case "next": currentPage = parseInt(currentPage) + 1; break;
                        case "end": currentPage = $("#max").val(); break;
                        }
                        
                        $.ajax({
                           url : "productList.pro",
                           data : {data : data, currentPage : currentPage},
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
                                 else if(index.includes("product")){
                                    var $inner = $("#item-wrapper");
                                    $inner.html("");
                                    if(v){
                                       $.each(v, function(index, value){
                                          var root = "<%=request.getContextPath()%>/resources/file/image/";
                                          var root2 = "<%=request.getContextPath()%>/buyProduct.pro";
                                          var fileN = value.pro_name + ".jpg";
                                          var $div = $("<div id='itemList' style='float: left; width: 24%; height: 70%; margin-right: 1%;'>");
                                          var $form = $("<form action='" + root2 + "' method='post'>");
                                          var $img = $("<img src='"+ root + fileN + "' id='itemImg' style='width: 100%; height: 40%; border: 1px solid black;'>");
                                          var $input1 = $("<input type='hidden' value='" + value.pro_num +"' name='pronum'>");
                                          var $input2 = $("<input type='hidden' value='" + value.pro_name +"' name='proname'>");
                                          var $input3 = $("<input type='hidden' value='" + value.price +"' name='proprice'>");
                                          var $input4 = $("<input type='hidden' value='" + value.remain +"' name='remain'>");
                                          var $input5 = $("<input type='hidden' value='" + <%=loginUser.getUserCode() %> + "' name='loginUserCode'>");
                                          var $h4 = $("<h5 align='center'>").text(value.pro_name);
                                          var $h42 = $("<h5 align='center'>").text(value.price);
                                          var $h43 = $("<h5 align='center' style='margin-bottom:0px'>").text("남은수량 : " + value.remain);
                                          var $img2 = $("<img class='buyBtn' src='resources/file/image/buybutton.png' width='70px' height='50px' onclick='buyFunction(this);'>");
                                          $form.append($img);
                                          $form.append($input1);
                                          $form.append($input2);
                                          $form.append($input3);
                                          $form.append($input4);
                                          $form.append($input5);
                                          $form.append($h4);
                                          $form.append($h42);
                                          $form.append($h43);
                                          $form.append($img2);
                                          $div.append($form);
                                          $inner.append($div);
                                       });
                                    }else{
                                       var $div = $("<div>");
                                       var $h4 = $("<h4 align='center'>").text("존재하는 상품이 없습니다.");
                                       $div.append($h4);
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
                        
                        switch(e.target.id){
                        case "all": data = "전체"; break;
                        case "note": data = "노트"; break;
                        case "pencil": data = "필기구"; break;
                        case "calendar": data = "캘린더"; break;
                        case "book": data= "도서"; break; 
                        case "etc": data = "기타"; break;
                        }
                        $("#datas").val(data);
                        $.ajax({
                           url : "productList.pro",
                           data : {data : data},
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
                                 else if(index.includes("product")){
                                    var $inner = $("#item-wrapper");
                                    $inner.html("");
                                    if(!v.includes("[]")){
                                       $.each(v, function(index, value){
                                          var root = "<%=request.getContextPath()%>/resources/file/image/";
                                          var root2 = "<%=request.getContextPath()%>/buyProduct.pro";
                                          var fileN = value.pro_name + ".jpg";
                                          var $div = $("<div id='itemList' style='float: left; width: 24%; height: 100%; margin-right: 1%;'>");
                                          var $form = $("<form action='" + root2 + "' method='post'>");
                                          var $img = $("<img src='"+ root + fileN + "' id='itemImg'>");
                                          var $input1 = $("<input type='hidden' value='" + value.pro_num +"' name='pronum'>");
                                          var $input2 = $("<input type='hidden' value='" + value.pro_name +"' name='proname'>");
                                          var $input3 = $("<input type='hidden' value='" + value.price+"' name='proprice'>");
                                          var $input4 = $("<input type='hidden' value='" + value.remain +"' name='remain'>");
                                          var $input5 = $("<input type='hidden' value='" + <%=loginUser.getUserCode() %> + "' name='loginUserCode'>");
                                          var $h4 = $("<h5 align='center'>").text(value.pro_name);
                                          var $h42 = $("<h5 align='center'>").text(value.price);
                                          var $h43 = $("<h5 align='center' style='margin-bottom:0px'>").text("남은수량 : " + value.remain);
                                          var $img2 = $("<img class='buyBtn' src='resources/file/image/buybutton.png' width='70px' height='50px' onclick='buyFunction(this);'>");
                                          $form.append($img);
                                          $form.append($input1);
                                          $form.append($input2);
                                          $form.append($input3);
                                          $form.append($input4);
                                          $form.append($input5);
                                          $form.append($h4);
                                          $form.append($h42);
                                          $form.append($h43);
                                          $form.append($img2);
                                          $div.append($form);
                                          $inner.append($div);
                                       });
                                    }
                                 }else if(index.includes("[]")){
                                    var $inner = $("#item-wrapper");
                                    $inner.html("");
                                    var $div = $("<div>");
                                    var $h4 = $("<h4 align='center'>").text("존재하는 상품이 없습니다.");
                                    $div.append($h4);
                                    $inner.append($div);
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
                  function buyFunction(img){
                     if($(img).siblings('input[name=remain]').val() == 0){
                        alert("재고가 없습니다.");
                     }else{
                        <% if(loginUser != null && loginUser.getAddress() == null){%>
                           alert("주소등록이 필요합니다.");
                           location.href="<%=contextPath%>/views/myPage/myInfo.jsp";
                        <% }else if(loginUser != null){ %>
                           var win = window.open("http://localhost:8888/eightedu/views/myPage/productInfo.jsp", "pop1", "width=500 height=600 top=100 left=400");
                           var root = "<%=contextPath%>/buyProduct.pro";
                           var l = "<%=loginUser.getUserCode()%>";
                           var address = "<%=loginUser.getAddress()%>";
                           var root2 = "<%=contextPath%>/resources/file/image/";
                           console.log("<img src='" + root2 + $(img).siblings('input[name=proname]').val()+ ".jpg 'width='100%' height='50%'>");
                           win.document.write("<img src='" + root2 + $(img).siblings('input[name=proname]').val()+ ".jpg 'width='100%' height='50%'>");
                           win.document.write("<form action='" + root + "' method='post'>");
                           win.document.write("<p><b>상품번호 : </b>"+$(img).siblings('input[name=pronum]').val()+"</p>");
                           win.document.write("<p><b>상품이름 : </b>"+$(img).siblings('input[name=proname]').val()+"</p>");
                           win.document.write("<p><b>상품 가격 : </b>"+$(img).siblings('input[name=proprice]').val()+"</p>");
                           win.document.write("<p><b>상품 재고 수량 : </b>"+$(img).siblings('input[name=remain]').val()+"</p>");
                           win.document.write("<p><b>배송지 : </b>"+address+"</p>");
                           win.document.write("<input type='hidden' value='"+ l +"' name='loginUserCode'>");
                           win.document.write("<input type='hidden' value='"+ $(img).siblings('input[name=pronum]').val() +"' name='pronum'>");
                           win.document.write("<button type='submit' style='border: 1px solid black; border-radius: 3px; background: white'>구매하기</button>")
                           win.document.write("<button type='button' style='border: 1px solid black; border-radius: 3px; background: white' onclick='window.close();'>취소하기</button>");
                           win.document.write("</form>");
                        <% }else { %>
                           alert("로그인이 필요합니다.");
                           location.href="<%=contextPath%>/views/loginPage/loginPage.jsp";
                        <% }%>
                     }
                  }
               </script>
               
               
               
            
            

      </div>
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