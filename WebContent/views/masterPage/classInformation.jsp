<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="master.Class.model.vo.*"%>
<%
	Classs c = (Classs)request.getAttribute("classs");
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
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
	width: 70%;
	height: 400px;
	margin-top: 10px;
}

#line2 {
	border: 1px solid lightgray;
	width: 20%;
	height: 730px;
	margin-top: 10px;
	margin-left: 20px;
}

#line3 {
	border: 1px solid lightgray;
	width: 70%;
	height: 100px;
	margin-top: 10px;
	margin-left: 16.5%;
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
}

input-title:focus {
	border-color: #F9800B;
}

#center {
	width: 80%;
	height: 1000px;
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
}


.replyArea {
	width: 800px;
	color: white;
	background: black;
	margin: auto;
}



#replySelectTable {
	margin-left: 10px;
	margin-top: 10px;
	border: 1px solid lightgray;
}

#gogo {
	margin: 0;
}

#comment_content {
	width: 80%;
}

#replyContent {
	width: 100%;
	height:100%;
	padding:0;
}

#addReply {
float:left;

}


.question{width:100%;border-top:2px solid #bdbdbd;border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;}
.question .qtit{text-align:left; margin:50px 0 10px 0;}
.question tr{border-top:1px solid #cdcdcd;}
.question tr:first-child{border-top:0;}
.question th{background:#f6f6f6; width:20%;text-align:left; padding-left:3%}
.question td{text-align:left;background:#fff;padding-top:1%!important;padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
.question input[type="text"],
.question select{margin-right:1%;color:#5c5c5c;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;}
.question select{padding:0.9%;}
.question textarea{vertical-align:middle;border:1px solid #cdcdcd; width:94%; height:100px;background:#f6f6f6;padding:1%}
.question label{margin-right:1%;}
.question .button{margin-right:1%;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#5e5e5e;vertical-align:middle;border:1px solid #5e5e5e;padding:1%; cursor:pointer;}
.question .button a{color:#fff;}
.question .add{margin-top:1%;}
.question .wid10{width:10%;}
.question .wid20{width:20%;}
.question .wid30{width:30%;}
.question .wid80{width:80%;}

.btngreen{margin-top:30px;}
.btngreen a{width:8%;margin:0 auto;display:block;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#fff;border:1px solid #008d2d;border-radius:2em;background:#008d2d; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
.btngreen a:hover{background:#fff;color:#008d2d;}


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
         
         <div id=line>

		<div id="info-line" style="width: 97%;">
						<span id="info">안내</span> <span> 혐오 발언 등록시 활동 정치 처리 됩니다.</span>
						<hr>
		</div>
					
					
	<table class="question">

        <tr>
            <th class="th" scope="row" >강의명</th>
            <td><%=c.getC_title() %>
            </td>
        </tr>
 
        <tr>
            <th class="th" scope="row">강의시간</th>
            <td><%=c.getC_time() %></td>
        </tr>
         <tr>
            <th class="th" scope="row">강의목차</th>
            <td><%=c.getC_next() %></td>
        </tr>
        <tr>
            <th class="th" scope="row">강좌명</th>
            <td><%=c.getL_title() %></td>
        </tr>
         <tr>
            <th class="th" scope="row">강사명</th>
            <td><%= c.getT_name() %></td>
        </tr>

  </table>
  
       <div align="center">
		<hr>
						<button  type="submit" onclick="UpdateClass()">수정하기</button>
						<button  type="submit" onclick="DeleteClass()">삭제하기</button>
						<button type="button" onclick="location.href='<%=contextPath%>/list.cl'">취소하기</button>
		</div>
  
  
  </div>


			
		</div>
		

			<form action="" id="detailForm" method="post">
				<input type="hidden" name="b_code" value="<%=c.getC_code()%>">
			</form>

		<script>
        function UpdateClass(){
        	location.href = "<%=contextPath%>/updateForm.cl?c_code="+<%=c.getC_code()%>;
        	
        	
        }
        
        function DeleteClass(){
        	
        	if(confirm("해당 강의를 지우시겠습니까?")){
        		
			location.href="<%= contextPath %>/delete.cl?c_code="+<%=c.getC_code()%>;

        	}
		}
        

       
       // 이전으로 돌아가게 할 예정 list로

       </script>



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