<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.ArrayList, master.Class.model.vo.*" %>

   <%
    ArrayList<Classs> list = (ArrayList<Classs>)request.getAttribute("list");

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
            <a class="nav-link active" href="<%=contextPath %>/views/lectureAttendPage/main.jsp" id="side_main">
              <span data-feather="home"></span>
             	교실 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/leclist.le">
              <span data-feather="file"></span>
            	  나의교실
            </a>
            	
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=영어교실"">
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
   


    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">

         <img src = "<%= contextPath %>/resources/file/image/my_class.jpg" width="100%" height="50%">
      </div>

      

   <div>
   
   </div>
   
   <hr>
   <h2></h2>
   
      <div class="tableArea" align="right">
         <table align=center id="listArea">
            <tr id="senter">
               <th width="100" style="text-align: center">강의목차</th>
               <th width="500" style="text-align: center">강의제목</th>
               <th width="100" style="text-align: center">동영상</th>

            </tr>
            
            <%if(list.isEmpty()) {%>
              <tr>
            	<td colspan="5">해당 영상을 준비중입니다.</td>
            </tr>
            <% } else { 
            	for(Classs c : list) {
            %>

            
               <tr>
               <td width="100" style="text-align: center"><%=c.getC_next() %>강</td>
               <td width="500" style="text-align: center"><%=c.getC_title() %>  [<%=c.getC_time() %>]</td>
               <td style="text-align: center"><button type="button" onclick="location.href='<%=contextPath %>/detail.vi?c_code='+<%=c.getC_code()%>">공부하기</button></td>
              
               
               
            </tr>
         		<%}
            } %>
                    
      </table>
    
    <!-- list.get(0)을 준 이유는 해당하는 강의가 하나라도 있을 경우에는 수강와뇰 버튼이 보이게 하기 위해서! -->
    	<%if(!list.isEmpty()){ %>
      <button type="button" onclick="location.href='<%=contextPath %>/UpdateUserClass.le?l_code='+<%=list.get(0).getL_code()%>">수강완료</button>
      <%} %>
   
      </div>
  
      

      </main>
      
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
</html>