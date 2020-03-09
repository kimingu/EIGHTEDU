<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="lecture.model.vo.Lecture, java.util.*, lecture.model.vo.UserClass"%>
   
   <%
   	Lecture l = (Lecture)request.getAttribute("lecture"); // 해당 강좌의 값들을 모두 불러오기위해서 (원하는것만 뽑아서 사용할거임)
   ArrayList<UserClass> list = (ArrayList<UserClass>)request.getAttribute("list"); // 내가 구매한 강좌는 구매하기 버튼이 사라져야하므로 조건처리를 위해 가져옴
   ArrayList<Integer> tf = new ArrayList<>(); // 구매하기 버튼을 사라지게 하려고만든 임의의 Array값 어디서 가져온게 x 그냥 선언한거임
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
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">

         <img src = "<%= contextPath %>/resources/file/image/picExample.jpg" width="100%" height="50%">
      </div>

   <% if(loginUser == null || loginUser != null){ %>

  
            <div>
           
            
            	
            	<h2>강좌명 : <%=l.getL_title() %></h2>
            	<hr>
            	
            	<p>담당강사   :  <%=l.getT_name() %></p>
            	<p>강의구성   :  <%= l.getL_number() %>강</p>
            	<p>수강료   :  <%= l.getL_price() %>북</p>
            	<p>강의설명 </p>
            	<pre><%= l.getL_content() %></pre>
            	

			</div>
			
			
			<% } %>
			<hr>
			<br>
			      <!--  관리자만 볼 수 있게 바꿀 예정  -->
			      
		<div align="right">
<form action ="<%=contextPath%>/BuyLecture.le;" method="post" class="buylec">
  	<input type="hidden" name="l_code"	value="<%=l.getL_code() %>">
  	<% if(loginUser != null){ %>
  	
  	<!-- 해당 유저가 구매한 코드번호와 해당 강좌의 코드번호가 같다면
  		위에서 임의로 추가한 Arraytf에 1이라는 값을 추가해준다!
  	 -->
  	
  	<% for(UserClass u : list){ %>
  		<% if(u.getL_code() == l.getL_code()){ %>
  				<% tf.add(1);%> <!-- 구매한 코드번호와 해당 강좌의 코드 번호가 같으면 1이 추가되어 있으므로 empty값이 아니다! -->
  
 		 <%} %>
  	<% } %>
	
		
		<% if(tf.isEmpty()){ %> <!-- mmpty값이라면 구매한 내역이 없으므로 버튼이 보이게! 구매했더라면 empty값이 아니기때문에 구매하기 버튼이 보인다! -->
		<input type="hidden" name="loginUserCode" value="<%=loginUser.getUserCode() %>">
			<button class =btn id="c" onclick="buyLecture();" type="button">강좌 구매</button>
			
  
  	<%} %>
  	
  <% } %>
  	
  	
		 
  
  	</form>
		</div>
		<%
      	if(loginUser != null && loginUser.getUserId().equals("master")){
      %>
        <div align="right">
        	<button class= btn id="A" onclick="UpdateLecture();" type="button">강좌수정</button>
        	<button class= btn id="B" onclick="DeleteLecture();" type="button">강좌삭제</button>
        </div>
        <%
        }
        %>
        
        <script>
        function UpdateLecture(){
        	location.href = "<%=contextPath%>/update.le?l_code="+<%=l.getL_code()%>;
        	
        	
        }
        
        function DeleteLecture(){
        	
        	if(confirm("해당 강좌를 지우시겠습니까?")){
        		
			location.href="<%= contextPath %>/delete.le?l_code="+<%=l.getL_code()%>;

        	}
		}
        
        function UpdateLecture(){
        	location.href="<%=contextPath%>/updateForm.le?l_code="+<%=l.getL_code()%>;
        	
        }
        
        function buyLecture(){
        	 if (confirm("정말 구매 하시겠습니까??") == true){
					$(".buylec").submit();
        		 

        	 }else{

        	     return false;

        	 }
    
        }
       
       // 이전으로 돌아가게 할 예정 list로

       </script>


      </main>
      
      </div>
      </div>
      <br><br>
      
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