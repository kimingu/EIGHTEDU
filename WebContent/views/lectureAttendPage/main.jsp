<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.ArrayList, lecture.model.vo.Lecture, lecture.model.vo.UserClass"%>
   
<%
	// Lecture list는 해당하는 모든 값을 가져오는 친구(강좌명들)
	// UserClass list2는 해당 Lecture list중 내가 결제한 리스트만 뽑아오는 것!
	
	// keyword , title은 검색하기 위해 값을 가져옴!
   ArrayList<Lecture> list = (ArrayList<Lecture>)request.getAttribute("list");
   ArrayList<UserClass> list2 = (ArrayList<UserClass>)request.getAttribute("list2");
   

   String keyword = (String)request.getAttribute("keyword");
   String title = (String)request.getAttribute("title");

   
%>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
<!-- -->

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

#side_main {
color:black;
font-size:24px;
}



.nav-link{
   color:rgb(154,157,160);
   font-size:20px;
}



.nav-link:hover {
   color: black;
}
#title {
 text-align: center;
}

#senter {
font-size:18px;
color:black;
}



.nav-item ul{
      padding: 0 10px;
       margin:0;
       height:0;
       overflow:hidden; /*내용이 넘치면 잘리게함 = 안보이게함 height가 0이므로 안보임!*/
       transition: height 0.5s ease-in;
}

.nav-item : ul{
    overflow : auto; /*내용이 넘치면 스크롤을 통해서 아래로 출력하게함!*/
     height:100px;
}

tr{
   height:40px;
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
            <a class="nav-link active" href="<%=contextPath %>/leclist.le" id="side_main">
              <span data-feather="home"></span>
                교실 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link"href="<%=contextPath %>/choicelist.le?l_type=나의교실">
              <span data-feather="file"></span>
                 나의교실
            </a>
               
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=영어교실">
              <span data-feather="shopping-cart"></span>
                 영어교실</a>
          </li>

        </ul>

        <ul class="nav flex-column mb-2">
       
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=일본어교실">
              <span data-feather="file-text"></span>
                 일본어교실
            </a>
              <ul>
                  <li><p>초급반</p></li>
                  <li><p>중급반</p></li>
               </ul>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=중국어교실">
              <span data-feather="file-text"></span>
                 중국어교실
             
            </a>
          </li>

        </ul>
      </div>
    </nav>
   



    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
    <br>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">
   <%if(title == null){ %>
         <img src = "<%= contextPath %>/resources/file/image/my_class.jpg" width="100%" height="50%">
         <%} else if (title.equals("영어교실")){ %>
         <img src = "<%= contextPath %>/resources/file/image/english_class.jpg" width="100%" height="50%">
         <% } else if (title.equals("일본어교실")){ %>
         <img src = "<%= contextPath %>/resources/file/image/japan_class.jpg" width="100%" height="50%">
         <%} else if(title.equals("중국어교실")){ %>
         <img src = "<%= contextPath %>/resources/file/image/china_class.jpg" width="100%" height="50%">
         <%} else {%>
         <img src = "<%= contextPath %>/resources/file/image/all_class.jpg" width="100%" height="50%">
         <%} %>
         
      </div>
      

      <div align="left">
<div class="searchArea" align="right">
         <form action="<%=contextPath%>/search.le">
            <select id="searchCondition" name="searchCondition">
               <option>-----</option>
               <option value="l_title">강좌명</option>
               <option value="t_name">강사명</option>
            </select> 
            <input type="search" name="searchKeyword">
            <button id="searchBtn" type="submit">검색하기</button>
         </form>
      </div>

</div>



<% if(keyword == null ){ %>

<h1><%= title %></h1>
   
   
   <% }else{ %>
         <h1>검색결과</h1>
   
   <%} %>
         <hr>
      <div class="tableArea">
         <table align="center" id="listArea">
            <tr id="senter">
                 <th width="500" style="text-align: center">강좌명</th>
               <th width="100" style="text-align: center">강의수</th>
               <th width="100" style="text-align: center">강사명</th>
               <th width="100" style="text-align: center">수강료</th>
               <th width="100" style="text-align: center">수강여부</th>

            </tr>

            
            <%if(list.isEmpty()){ %>
            <tr>
               <td colspan="5">구매한 강좌가 존재하지 않습니다.</td>
            </tr>
            <% } else { 
               for(Lecture l : list) {
            %>
            
            <tr>
            <input type="hidden" value="<%=l.getL_code()%>">
               <td style="text-align: center"><%= l.getL_title() %></td>
               <td style="text-align: center"><%= l.getL_number() %></td>
               <td style="text-align: center"><%= l.getT_name() %></td>
               <td style="text-align: center"><%= l.getL_price() %></td>
               <% if( (loginUser != null && loginUser.getUserId().equals("master"))){ %>
               
               <td style="text-align: center"><button type="button" onclick="location.href='<%=contextPath %>/detaillist.le?l_code='+<%=l.getL_code()%>">강의보기</button></td>
             
             <!-- u 유저가 가지고있는 강의 코드, l = 해당 강좌의 모든 코드--> 
               <%} else if(loginUser != null){%>
                  <%for(UserClass u : list2){ %>
                     <% if(u.getL_code() == l.getL_code()){ %>
                           
                  <td style="text-align: center"><button type="button" onclick="location.href='<%=contextPath %>/detaillist.le?l_code='+<%=l.getL_code()%>">강의보기</button></td>
                  
                  <% } 
                  }
                  %>
               <%} %>      
            </tr>
            
            
            <%}
               
               
           }%>

      </table>
      </div>
      <hr>
      
         <script>
   // 강좌설명 상세보기 기능
   $(function(){
         $("#listArea td:nth-child(2)").mouseenter(function(){
            $(this).parent().css({"background":"yellow", "cursor":"pointer"});
         }).mouseout(function(){
            $(this).parent().css("background","white");
         }).click(function(){
            var l_code = $(this).parent().children("input").val(); // 글 번호 가져옴
            location.href="<%= contextPath %>/detail.le?l_code="+l_code;
         });
   });
   
   
   </script>

   

        
      </main>
      
      </div>
      
    	<!--  마스터일때만 강좌등록 강의등록이 보이게! -->
      <%
         if(loginUser != null && loginUser.getUserId().equals("master")){
      %>
        <div align="right">
           <button class= btn id="A" onclick="insertLecture();" type="button">강좌등록</button>
           <button class= btn id="B" onclick="finish();" type="button">강의 등록</button>
        </div>
        <%
         }
        %>
        
        
        
        

       
        <script>
        function insertLecture(){
         location.href="<%= request.getContextPath() %>/views/lectureAttendPage/lectureInsertForm.jsp";
      }
       
       // 이전으로 돌아가게 할 예정 list로
       function finish(){
         location.href="<%= request.getContextPath() %>/list.cl";
      }
       </script>

    
        
       
      
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
</html>