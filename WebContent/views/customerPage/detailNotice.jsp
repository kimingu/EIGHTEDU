<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="notice.model.vo.*, java.util.*"%>
<%
Notice n = (Notice)request.getAttribute("notice");
String aliass = n.getAliass();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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

#line {
   border: 1px solid lightgray;
   width: 75%;
/*    height: 730px; */
   margin-top: 10px;
   height:90%;
   min-height:300px;
}

#line2 {
   border: 1px solid lightgray;
   width: 20%;
   height: 70%;
   margin-top: 10px;
   margin-left: 20px;
   min-height:200px;
}


#info {
   background: black;
   padding: 1px 5px;
   color: white;
   margin: 0px 3px 0px 0px;
   border-top-right-radius: 5px;
   border-top-left-radius: 5px;
   border-bottom-right-radius: 5px;
   border-bottom-left-radius: 5px;
}

#info-line {
   margin: 10px;
   width: 700px;
}

#info-line2 {
   margin: 10px;
}

#subject {
   margin: 10px;
   margin-top: 1px;
   font-size: 20px;
   border-bottom: 2px solid #ccc;
   transition: all .2s ease-in-out;
   border-radius: 0;
   border: 0;
}

#board-content {
   border: 1px solid lightgray;
   margin: 10px;
   margin-top: 1px;
   height: 72%;
   min-height : 500px;
   padding:10px;
}

input-title:focus {
   border-color: #F9800B;
}

#center {
   width: 80%;
   /* height: 1000px; */
}

#koko {
   position: relative;
   width: 16.5%;
   padding-right: 15px;
   padding-left: 15px;
}

#insert-btn {
   margin-top: 400px;
}

.tableArea {
	border: 1px solid lightgray;
	margin-left: 10px; 
	margin-right: 10px;
	padding-left:5px;
	padding-top:3px;
}


#mainCate {
 	width: 4px;
}
#subCate{
	width : 20px;
}

#gogo{
margin:0;
}
#btnBottom{
margin-bottom : 1%;
}
#subject{
padding-left:5px;
padding-top:3px;
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
            <a class="nav-link active" id="ingu">
              <span data-feather="home"></span>
             고객센터 
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=공지사항"id="koo">
              <span data-feather="file"></span>
              공지사항      
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=qna" id="koo">
              <span data-feather="shopping-cart"></span>
      Q & A
            </a>
          </li>
        </ul>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/list.no?n_name=문의내역" id="koo">
              <span data-feather="file-text"></span>
              문의하기
                 
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://open.kakao.com/o/s7Qic8Db" id="koo">
              <span data-feather="file-text"></span>
              실시간 상담 
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/views/customerPage/howToCome.jsp" id="koo">
              <span data-feather="file-text"></span>
              찾아오시는 길 
                 <hr>
            </a>
          </li>
          <li class="nav-item">
           
          </li>
        </ul>
      </div>
    </nav>


            <div id="line">

               <div id="info-line" style="width: 97%;">
                  <span id="info">쉬는시간</span> <span>회원들끼리 정보를 나눌수 있는 커뮤니티 게시판 입니다.</span>
                  <hr>
               </div>


               <div id="board-title">
                  <p id="subject"><%=n.getN_title() %></p>
               </div>

               <div class="tableArea" width="470px">
                  <table align="center" width="470px" id="gogo">
                  <tr>
                  <td id="mainCate">카테고리</td>
                  <td id="subCate"><span><%=n.getM_name() %></span></td>
                  </tr>
                     <tr>
                        <td id="mainCate">작성자</td>
                        <td id="mainCate"><span><%=n.getAliass() %></span></td>
                        <td id="mainCate">조회수</td>
                        <td id="mainCate"><span><%=n.getN_count() %></span></td>
                        <td id="mainCate">작성일</td>
                        <td id="mainCate"><span><%=n.getCreate_date() %></span>
                     </tr>
                  </table>
               </div>



               <div id="board-content">
                  <p><%=n.getN_content() %></p>
               </div>
               <div align="center" id="btnBottom">
				<button type="button" onclick="location.href='<%= contextPath %>/list.no?n_name=<%=n.getN_name()%>'"k>이전으로</button>
				<!-- 로그인한 회원이 글쓴이인 경우 -->
			<%if(loginUser != null && aliass.equals(loginUser.getAliass()) || loginUser != null && loginUser.getUserId().equals("master")){ %> 
					<button id="updateBtn" type="button" onclick="updateNotice();">수정하기</button>
					<button id="deleteBtn" type="button" onclick="deleteNotice();">삭제하기</button>
				<% } %>
			<%if(loginUser != null && loginUser.getUserId().equals("master") && n.getN_name().equals("문의내역") && n.getM_code()==321){%>
				<button id="checkBtn" type="button" onclick="checkNotice();">답변하기</button>
				<%} %>
			
			</div>

            </div>
	<form action="updateNotice();" id="detailForm" method="post">
		<input type="hidden" name="n_code" value="<%= n.getN_code() %>">
	</form>
	
	<script>
	function updateNotice(){
		$("#detailForm").attr("action", "<%=contextPath%>/updateForm.no?n_code="+<%=n.getN_code()%>);
		$("#detailForm").submit();
	}
	
	function deleteNotice(){
		if(confirm("해당 글을 삭제하시겠습니까?")){ 
			location.href="<%=contextPath%>/delete.no?n_code=<%=n.getN_code()%>&n_name=<%=n.getN_name()%>";
		}
	}
	
	function checkNotice(){
		if(confirm("문의글을 확인 설정을 진행하시겠습니까?")){
			window.open('<%=contextPath%>/views/customerPage/answerNotice.jsp?n_code=<%=n.getN_code()%>&n_title=<%=n.getN_title()%>&n_content=<%=n.getN_content()%>', '신고사유','width=500,height=400');
			<%-- location.href="<%=contextPath%>/check.no?n_code=<%=n.getN_code()%>&n_title=<%=n.getN_title()%>"; --%>
		}
	}
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