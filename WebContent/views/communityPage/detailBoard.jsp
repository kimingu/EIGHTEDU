<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("board");
	String aliass = b.getAliass();

	ArrayList<BoardComment> rlist = (ArrayList<BoardComment>) request.getAttribute("rlist");

	 
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

#line3 {
   border: 1px solid lightgray;
   width: 75%;
   height: 15%;
   margin-top: 10px;
   margin-left: 16.5%;
   
}

#replySelectArea {

	width: 70%;
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
   min-height : 500px;
   padding:10px;
}

input-title:focus {
	border-color: #F9800B;
}

#center {
	width: 80%;
/* 	height: 1000px; */
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


.replyArea {
	width: 800px;
	color: white;
	background: black;
	margin: auto;
}

#kokoko {
	width: 4px;
}


#kokoko11{
	width: 20px;
}

#replySelectTable {
/* 	margin-left: 1px; */
	margin-top: 10px; 
	border: 1px solid lightgray;
	width:100%;
	
}

#gogo {
	margin: 0;
}

#btnButton{
margin-bottom : 1%;
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

#replySelectArea {
width: 75%;
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
						<li class="nav-item"><a class="nav-link active"
							href="<%=contextPath%>/list.bo" id="ingu"> <span
								data-feather="home"></span> 쉬는시간 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=영어" id="koo"> <span
								data-feather="file"></span> 영어

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=일본어" id="koo"> <span
								data-feather="shopping-cart"></span> 일본어

						</a></li>

					</ul>

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=중국어" id="koo"> <span
								data-feather="file-text"></span> 중국어

						</a></li>
						
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath%>/list.bo?b_name=자료실"
							id="koo"> <span data-feather="file-text"></span> 자료실
								<hr>
						</a></li>
						<li class="nav-item"></li>
					</ul>
				</div>
			</nav>



			<div id="line">

				<div id="info-line" style="width: 97%;">
					<span id="info">쉬는시간</span> <span>회원들끼리 정보를 나눌수 있는 커뮤니티 게시판
						입니다.</span>
					<hr>
				</div>


				<div id="board-title">
					<p id="subject"><%=b.getB_title()%></p>
				</div>

				<div class="tableArea" width="470px">
					<table align="center" width="470px" id="gogo">
						<tr>
							<td id="kokoko">카테고리</td>
							<td id="kokoko11"><span><%=b.getM_name()%></span></td>
						</tr>
						
						<tr>
							<td id="kokoko">작성자</td>
							<td id="kokoko"><span><%=b.getAliass()%></span></td>
							<td id="kokoko">조회수</td>
							<td id="kokoko"><span><%=b.getB_count()%></span></td>
							<td id="kokoko">작성일</td>
							<td id="kokoko"><span><%=b.getCreate_date()%></span>
						</tr>
					</table>
				</div>



				<div id="board-content">
					<p><%=b.getB_content()%></p>
				</div>
				<div align="center" id="btnButton">
					<button type="button"
						onclick="location.href='<%=contextPath%>/list.bo?b_name=<%=b.getB_name()%>'">이전으로</button>
					<% if(loginUser != null && !loginUser.getAliass().equals("관리자")) { %>	
					<button type="button"
						onclick="window.open('<%=request.getContextPath()%>/report?b_code=<%=b.getB_code()%>&user_code=<%=b.getUser_code()%>', '신고사유','width=500,height=400')">신고하기</button>
					<%} else if(loginUser != null && loginUser.getAliass().equals("관리자")) { %>	
					<!-- 신고하기 버튼 추가!!! -->
					<button type="button"
						onclick="location.href='<%=request.getContextPath()%>/black.re?user_code=<%=b.getUser_code()%>'">블랙처리</button>
					<button id="updateBtn" type="button" onclick="updateBoard();">수정하기</button>
					<button id="deleteBtn" type="button" onclick="deleteBoard();">삭제하기</button>
					<%} %>
					<!-- 로그인한 회원이 글쓴이인 경우 -->
					<%
						if (loginUser != null && aliass.equals(loginUser.getAliass()) && !loginUser.getAliass().equals("관리자")) {
					%>
					
					<button id="updateBtn" type="button" onclick="updateBoard();">수정하기</button>
					<button id="deleteBtn" type="button" onclick="deleteBoard();">삭제하기</button>
					<%
						}
					%>
				</div>

			</div>
			<form action="" id="detailForm" method="post">
				<input type="hidden" name="b_code" value="<%=b.getB_code()%>">
			</form>

			<script>
		function updateBoard(){
			$("#detailForm").attr("action", "<%=contextPath%>/updateForm.bo?b_code="+<%=b.getB_code()%>);
			$("#detailForm").submit();
		}
		
		function deleteBoard(){
			if(confirm("해당 글을 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/delete.bo?b_code=<%=b.getB_code()%>&b_name=<%=b.getB_name()%>";
			}
			
		}
		</script>



		</div>

	</div>



<%
		if (loginUser != null) {
	%> 

	<div id="line3">

		<div id="comment_content" style="float:left;">
			<!-- <input type="text" id="replyContent"> -->
			<textarea id="replyContent" style="resize: none;"></textarea>
		</div>
		<div style="width:19%; height:100%; float:left; padding:30px 0 0 30px;">
		<button id="addReply">댓글등록</button>
		</div>

	</div>

	 <%
		}
	%> 
	
	<div id="replySelectArea">
			<table id="replySelectTable" border="1" align="center">
			<% if(rlist != null){ %>
				<% for(BoardComment r : rlist){ %>
					<tr id="gura">
						<td width="100px"><%= r.getAliass() %></td>
						<td width="500px"><%= r.getC_content() %></td>
						<td width="100px"><%= r.getCreate_date() %></td>
					<%
						if (loginUser != null && r.getAliass().equals(loginUser.getAliass())) {
					%> 
						<td width="100px">
							<input type="hidden" value="<%=r.getC_code()%>" id="c_code" name="c_code">
							<input type="hidden" value="<%=r.getB_code()%>" id="b_code" name="b_code">
							<input type="hidden" value="<%=r.getUser_code() %>" id="user_code" name="user_code">		
							<button id="deleteBtn10" type="button" onclick="deleteComment(this);">삭제하기</button>
						</td>
						
					<% } %> 
					</tr>
				<% } %>
			<%} %>
			</table>
		</div>
		
	</div>
	
	   <script>
	   
		function deleteComment(h){
				var b_code = $(h).parent().children("#b_code").val();
				var c_code = $(h).parent().children("#c_code").val();
				var user_code = $(h).parent().children("#user_code").val();
				
			if(confirm("해당 댓글을 삭제하시겠습니까?")){
				location.href="<%=contextPath%>/commentDelete.bo?c_code="+c_code+"&b_code="+b_code+"&user_code="+user_code;
			}
			
		}	 
			 
			 
			 $(function(){});
			 $("asdf").click({
				 
			 })
			 
			 
		$("#addReply").click(function() {
				<%
					if (loginUser != null) {
				%> 
					var user_code = "<%=loginUser.getUserCode()%>";
					var b_code = "<%=b.getB_code()%>";
					var c_content = $("#replyContent").val();
					c_content = c_content.replace(/(?:\r\n|\r|\n)/g, '<br>');
				   
				    
				      
				<% } %>
					$.ajax({
						url : "insertComment.bo",
						type : "post",
						dataType : "json",
						data : {
							user_code: user_code,
							b_code : b_code,
							c_content : c_content
						},
						success : function(data) {
							console.log(data);

							$replyTable = $("#replySelectTable");
							$replyTable.html("");

							// 새로 받아온 갱신 된 댓글 리스트를 반복문을 통해 table에 추가
							for ( var key in data) {

								var $tr = $("<tr>");
								var $user_codeTd = $("<td>").text(data[key].aliass).css("width","100px");
								var $contentTd = $("<td>").html(data[key].c_content).css("width", "400px");
								var $dateTd = $("<td>").text(data[key].create_date).css("width", "200px");
								
							 	var $btnTd = $("<td>").css("width","100px");
							 	var $input1 = $("<input type='hidden' id='c_code' name='c_code'>").val(data[key].c_code);
							 	var $input2 = $("<input type='hidden' id='b_code' name='b_code'>").val(data[key].b_code);
								var $input3 = $("<input type='hidden' id='user_code' name='user_code'>").val(data[key].user_code);
							 	var $btn = $("<button id='deleteBtn10' type='button' onclick='deleteComment(this);'>").text("삭제하기");
								$btnTd.append($input1);
								$btnTd.append($input2);
								$btnTd.append($input3);
								
								if(user_code == data[key].user_code){
									$btnTd.append($btn);
								}
								
								$tr.append($user_codeTd);
								$tr.append($contentTd);
								$tr.append($dateTd);
								
							 	$tr.append($btnTd); 
								
								$replyTable.append($tr);
							}

							// 댓글 작성 부분 리셋
							$("#replyContent").val("");

						},
						error : function() {
							console.log("통신 실패!");
						}
					});
		}); 
	</script> 
	<br> 
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