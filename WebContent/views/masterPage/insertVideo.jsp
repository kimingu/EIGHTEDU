<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, master.Class.model.vo.*, lecture.model.vo.*"%>

<%
	ArrayList<Classs> list = (ArrayList<Classs>)request.getAttribute("list"); // 해당 강좌의 리스트들을 불러옴
	ArrayList<Lecture> list1 = (ArrayList<Lecture>)request.getAttribute("list1"); // 해당 강좌에 포함되어있는 강의 리스트들을 불러옴   강좌안에 강의가 있는구조
	

	
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
	width: 60%;
	height: 400px;
	margin-top: 10px;
}

#line2 {
	border: 1px solid lightgray;
	width: 20%;
	height: 600px;
	margin-top: 10px;
	margin-left: 20px;
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
	border: 1px solid white;
	margin: 10px;
	margin-top: 1px;
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
	margin-top: 320px;
}

.question {
	width: 100%;
	border-top: 2px solid #bdbdbd;
	border-bottom: 2px solid #bdbdbd;
	font-family: "NanumGothic", sans-serif;
}

.question .qtit {
	text-align: left;
	margin: 50px 0 10px 0;
}

.question tr {
	border-top: 1px solid #cdcdcd;
}

.question tr:first-child {
	border-top: 0;
}

.question th {
	background: #f6f6f6;
	width: 20%;
	text-align: left;
	padding-left: 3%
}

.question td {
	text-align: left;
	background: #fff;
	padding-top: 1% !important;
	padding-bottom: 1% !important;
	color: #5c5c5c;
	font-size: 15px;
	line-height: 26px;
	padding-left: 3%
}

.question input[type="text"], .question select {
	margin-right: 1%;
	color: #5c5c5c;
	line-height: 12px;
	font-size: 14px;
	font-family: "NanumGothic", sans-serif;
	background: #f6f6f6;
	vertical-align: middle;
	border: 1px solid #cdcdcd;
	padding: 1%;
}

.question select {
	padding: 0.9%;
}

.question textarea {
	vertical-align: middle;
	border: 1px solid #cdcdcd;
	width: 94%;
	height: 100px;
	background: #f6f6f6;
	padding: 1%
}

.question label {
	margin-right: 1%;
}

.question .button {
	margin-right: 1%;
	line-height: 12px;
	font-size: 14px;
	font-family: "NanumGothic", sans-serif;
	background: #5e5e5e;
	vertical-align: middle;
	border: 1px solid #5e5e5e;
	padding: 1%;
	cursor: pointer;
}

.question .button a {
	color: #fff;
}

.question .add {
	margin-top: 1%;
}

.question .wid10 {
	width: 10%;
}

.question .wid20 {
	width: 20%;
}

.question .wid30 {
	width: 30%;
}

.question .wid80 {
	width: 80%;
}

.btngreen {
	margin-top: 30px;
}

.btngreen a {
	width: 8%;
	margin: 0 auto;
	display: block;
	padding: 0.7em 1.5em 0.8em 1.5em;
	font-size: 16px;
	color: #fff;
	border: 1px solid #008d2d;
	border-radius: 2em;
	background: #008d2d;
	text-align: center;
	letter-spacing: -0.5px;
	font-weight: bold;
}

.btngreen a:hover {
	background: #fff;
	color: #008d2d;
}
</style>
</head>

<body>
	<%@ include file="../common/menuBar.jsp"%>
	<form action="<%=contextPath%>/insert.video" method="post">

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
							<td class="th" scope="row">영상주소</td>
							<td><input type="text" class="wid80"
								placeholder="영상주소를 입력해주세요" name="v_link" />
						</tr>





						<tr>
							<th class="th" scope="row">강좌명</th>

							<td><select  class="l_title" name="l_title">
									<%if(list1.isEmpty()){ %>
									<tr>
										<td colspan="5">해당 강좌이 없네요 ㅠ.</td>
									</tr>
									<% } else { 
            							for(Lecture l : list1) {
           								 %>

									<option id="selectedLecture" value="<%=l.getL_title()%>"><%=l.getL_title()%></option>
									<%}
           						}%>
							</select></td>
						</tr>



						<tr>
							<th class="th" scope="row">강의명</th>


							<td><select name="c_title" class="c_title">
							<%if(list.isEmpty()){ %>
									<tr>
										<td colspan="5">해당 강좌이 없네요 ㅠ.</td>
									</tr>
									<% } else { 
            							for(Classs c : list) {
           								 %>

									<option id="selectedLecture" value="<%=c.getC_title()%>"><%=c.getC_title()%></option>

									<%}
 	
           						}%>
							
							
	
								</select>
						</td>
						</tr>
						

					</table>
					
					
					<script>
					
	//      jquery를 이용해서 document.on("변화한다면", "l_title의 값이", 함수를 발동시켜라)
						$(document).on("change", ".l_title", function(){
							
							// 위에서 l_title 값이 바뀌면 실행되는 구문이므로 아래의 해당값은 l_title 값이다.
							var value = $(this).children('option:selected').val();
							
							$.ajax({
								url : "list.cl",
								data : {data : value},
								type : "post",
								
								success : function(list){ // 성공한다면 list를 불러오는데 해당 리스트를 hash.map으로 가져오기때문에 여러종류의 리스트가 들어가있다.
									$.each(list, function(index,value){ // each를 통한 반복문으로 모든 값들을 가져온다.
										if(index.includes("Classs")){ // 만약 list에서 가져온 값의 이름이 Classs 라면
											var $select = $(".c_title"); // 해당 강의들의 모든 리스트들을 가져온다.
											$select.html(""); // 모두 가져온 강의 리스트들을 싹 비워준다. (비워주는 이유는 새로운 값들이 넣어지기위해)
											for(var i = 0; i < value.length; i++){  // Classs에 포함된 값의 길이만큼 반복해라 (강의리스트만큼)
												var $c = $("<option>").text(value[i].c_title); // 옵션 선택지에 값이 들어가게 강의 목록의 이름들이
												$select.append($c); // 계속해서 추가해라!
											}
										}
									});
								}
							});
							
						});
						
					
					</script>

					<div align="center">
						<hr>
						<button id="submit" type="submit">등록하기</button>
						<button type="button" onclick="javascript:history.back();">취소하기</button>
					</div>


				</div>



			</div>
	</form>


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
</html>