<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User, product.model.vo.Product, java.util.*, board.model.vo.Board, lecture.model.vo.Lecture, notice.model.vo.Notice"%>
<%
	String searchResult = (String)request.getAttribute("searchResult");
	ArrayList<Product> listP = (ArrayList<Product>)request.getAttribute("listP");
	ArrayList<Board> listB = (ArrayList<Board>)request.getAttribute("listB");
	ArrayList<Lecture> listL = (ArrayList<Lecture>)request.getAttribute("listL");
	ArrayList<Notice> listN = (ArrayList<Notice>)request.getAttribute("listN");
%>
<!--  메인 페이지 입니다. -->
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Carousel Template · Bootstrap</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/carousel/">

<!-- 필수 추가 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<!-- <link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#searchAll {
margin-left:150px;
color:black;
}
</style>
<!-- Custom styles for this template -->
<link href="resources/css/mainStyle.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menuBar.jsp"%>
	<main role="main"> <br>

	<h2 id="searchAll"><%=searchResult %>에 대한 통합검색결과	 | </h2>


	
	<div class="container marketing">
		<div class="row">
			<form class="form-inline mt-2 mt-md-0" id="Search" method="post" action="<%=contextPath%>/search.main">
				<input class="form-control mr-sm-2" type="text" placeholder="검색할 키워드를 입력하세요."
					aria-label="search" style="text-align : center; margin-left:30px; width : 1000px" name="searchInputArea">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<br>

		<h4>교실</h4>
		<table align="center" id="lectureArea">
			<tr id="senter">
				<th width="100">글번호</th>
				<th width="100">카테고리</th>
				<th width="500" id="title">글제목</th>
				<th width="100">강사</th>
				<th width="100">가격</th>
				<th width="150">강의수</th>
			</tr>
			<% if(!listL.isEmpty()) {%>
				<% for(int i = 0; i < listL.size(); i++){ %>
					<% if(i > 8) { %>
					<% break;} %>
					<tr>
						<td><%=listL.get(i).getL_code() %></td>
						<td><%=listL.get(i).getL_type() %></td>
						<td><%=listL.get(i).getL_title() %></td>
						<td><%=listL.get(i).getT_name() %></td>
						<td><%=listL.get(i).getL_price() %></td>
						<td><%=listL.get(i).getL_number() %></td>
					</tr>
				<% } %>
			<% } else { %>
				<tr>
					<td colspan="6">조회된 목록이 없습니다.</td>
				</tr>
			<% } %>
		</table>
		<% if(listL.size() > 8) { %>
			<a href="#" style="margin-left:90%; cursor:pointer" class="lectureMore">더보기</a>
		<% } %>
		<hr>

		<h4>쉬는시간</h4>
		<table align="center" id="boardArea">
			<tr id="senter">
				<th width="100">글번호</th>
				<th width="100">카테고리</th>
				<th width="500" id="title">글제목</th>
				<th width="100">작성자</th>
				<th width="100">조회수</th>
				<th width="150">작성일</th>
			</tr>
			<% if(!listB.isEmpty()){ %>
				<% for(int i = 0; i < listB.size(); i++){ %>
					<% if(i > 8) { %>
					<% break;} %>
					<tr>
						<td><%=listB.get(i).getB_code() %></td>
						<td><%=listB.get(i).getM_name() %></td>
						<td><%=listB.get(i).getB_title() %></td>
						<td><%=listB.get(i).getAliass() %></td>
						<td><%=listB.get(i).getB_count() %></td>
						<td><%=listB.get(i).getCreate_date() %></td>
					</tr>
				<% } %>
			<% } else { %>
				<tr>
					<td colspan="6">조회된 목록이 없습니다.</td>
				</tr>
			<% } %>
		</table>
		<% if(listB.size() > 8) { %>
			<a href="#" style="margin-left:90%; cursor:pointer" class="boardMore">더보기</a>
		<% } %>
		<hr>

		<h4>포인트샵</h4>
		<table align="center" id="productArea">
			<tr id="senter">
				<th width="100">상품번호</th>
				<th width="100">분류</th>
				<th width="200" id="title">상품명</th>
				<th width="100">재고</th>
				<th width="200">가격</th>
				<th width="350"></th>
			</tr>
			<% if(!listP.isEmpty()){ %>
				<% for(int i = 0; i < listP.size(); i++){ %>
					<% if(i > 8) { %>
					<% break;} %>
					<tr>
						<td><%=listP.get(i).getPro_num() %></td>
						<td><%=listP.get(i).getPro_type() %></td>
						<td><%=listP.get(i).getPro_name() %></td>
						<td><%=listP.get(i).getRemain() %></td>
						<td><%=listP.get(i).getPrice() %></td>
					</tr>
				<% } %>
			<% } else { %>
				<tr>
					<td colspan="4">조회된 목록이 없습니다.</td>
				</tr>
			<% } %>
		</table>
		<% if(listP.size() > 8) { %>
			<a style="margin-left:90%; cursor:pointer" class="productMore">더보기</a>
		<% } %>
		<hr>

		<h4>행정실</h4>
		<table align="center" id="noticeArea">
			<tr id="senter">
				<th width="100">글번호</th>
				<th width="100">카테고리</th>
				<th width="500" id="title">글제목</th>
				<th width="100">작성자</th>
				<th width="100">조회수</th>
				<th width="150">작성일</th>
			</tr>
			<% if(!listN.isEmpty()){ %>
				<% for(int i = 0; i < listN.size(); i++){ %>
					<% if(i > 8) { %>
					<% break;} %>
					<tr>
						<td><%=listN.get(i).getN_code() %></td>
						<td><%=listN.get(i).getM_name() %></td>
						<td><%=listN.get(i).getN_title() %></td>
						<td><%=listN.get(i).getAliass() %></td>
						<td><%=listN.get(i).getN_count() %></td>
						<td><%=listN.get(i).getCreate_date() %><td>
					</tr>
				<% } %>
			<% } else { %>
				<tr>
					<td colspan="6">조회된 목록이 없습니다.</td>
				</tr>
			<% } %>
		</table>
		<% if(listN.size() > 8) { %>
			<a href="#" style="margin-left:90%; cursor:pointer" class="noticeMore">더보기</a>
		<% } %>
		<hr>
	</main>
	<script>
		$(".lectureMore").on('click', function(){
			var data = "<%=searchResult %>";
			var data2 = "ajax";
			$.ajax({
				url : "search.main",
				data : {searchInputArea : data, ajax : data2},
				type : "post",
				success : function(list){
					$.each(list, function(index, v){
						if(index.includes("Lecture")){
							var $area = $("#lectureArea");
							var $productMore = $(".lectureMore");
							$productMore.html("");
							$area.html("");
							var $tr = $("<tr id='senter'>");
							var $th1 = $("<th width='100'>").text("글번호");
							var $th2 = $("<th width='100'>").text("카테고리");
							var $th3 = $("<th width='200' id='title'>").text("글제목");
							var $th4 = $("<th width='100'>").text("강사");
							var $th5 = $("<th width='200'>").text("가격");
							var $th6 = $("<th width='350'>").text("강의수");
							$tr.append($th1);
							$tr.append($th2);
							$tr.append($th3);
							$tr.append($th4);
							$tr.append($th5);
							$tr.append($th6);
							$area.append($tr); 
							for(var i = 0; i < v.length; i++){
								var $tr2 = $("<tr>");
								var $td1 = $("<td>").text(v[i].l_code);
								var $td2 = $("<td>").text(v[i].l_type);
								var $td3 = $("<td>").text(v[i].l_title);
								var $td4 = $("<td>").text(v[i].t_name);
								var $td5 = $("<td>").text(v[i].l_price);
								var $td6 = $("<td>").text(v[i].l_number);
								$tr2.append($td1);
								$tr2.append($td2);
								$tr2.append($td3);
								$tr2.append($td4);
								$tr2.append($td5);
								$tr2.append($td6);
								$area.append($tr2);
							}
						}
					});
				}, 
				error : function(){
					console.log("error");
				}
			});
		});
		$(".boardMore").on('click', function(){
			var data = "<%=searchResult %>";
			var data2 = "ajax";
			$.ajax({
				url : "search.main",
				data : {searchInputArea : data, ajax : data2},
				type : "post",
				success : function(list){
					$.each(list, function(index, v){
						if(index.includes("Board")){
							var $area = $("#boardArea");
							var $productMore = $(".boardMore");
							$productMore.html("");
							$area.html("");
							var $tr = $("<tr id='senter'>");
							var $th1 = $("<th width='100'>").text("글번호");
							var $th2 = $("<th width='100'>").text("카테고리");
							var $th3 = $("<th width='200' id='title'>").text("글제목");
							var $th4 = $("<th width='100'>").text("작성자");
							var $th5 = $("<th width='200'>").text("조회수");
							var $th6 = $("<th width='350'>").text("작성일");
							$tr.append($th1);
							$tr.append($th2);
							$tr.append($th3);
							$tr.append($th4);
							$tr.append($th5);
							$tr.append($th6);
							$area.append($tr); 
							for(var i = 0; i < v.length; i++){
								var $tr2 = $("<tr>");
								var $td1 = $("<td>").text(v[i].b_code);
								var $td2 = $("<td>").text(v[i].m_name);
								var $td3 = $("<td>").text(v[i].b_title);
								var $td4 = $("<td>").text(v[i].aliass);
								var $td5 = $("<td>").text(v[i].b_count);
								var $td6 = $("<td>").text(v[i].create_date);
								$tr2.append($td1);
								$tr2.append($td2);
								$tr2.append($td3);
								$tr2.append($td4);
								$tr2.append($td5);
								$tr2.append($td6);
							}
						}
					});
				}, 
				error : function(){
					console.log("error");
				}
			});
		});
		$(".productMore").on('click', function(){
			var data = "<%=searchResult %>";
			var data2 = "ajax";
			$.ajax({
				url : "search.main",
				data : {searchInputArea : data, ajax : data2},
				type : "post",
				success : function(list){
					$.each(list, function(index, v){
						if(index.includes("product")){
							var $area = $("#productArea");
							var $productMore = $(".productMore");
							$productMore.html("");
							$area.html("");
							var $tr = $("<tr id='senter'>");
							var $th1 = $("<th width='100'>").text("상품번호");
							var $th2 = $("<th width='100'>").text("분류");
							var $th3 = $("<th width='200' id='title'>").text("상품명");
							var $th4 = $("<th width='100'>").text("재고");
							var $th5 = $("<th width='200'>");
							var $th6 = $("<th width='350'>");
							$tr.append($th1);
							$tr.append($th2);
							$tr.append($th3);
							$tr.append($th4);
							$tr.append($th5);
							$tr.append($th6);
							$area.append($tr); 
							for(var i = 0; i < v.length; i++){
								var $tr2 = $("<tr>");
								var $td1 = $("<td>").text(v[i].pro_num);
								var $td2 = $("<td>").text(v[i].pro_type);
								var $td3 = $("<td>").text(v[i].pro_name);
								var $td4 = $("<td>").text(v[i].remain);
								$tr2.append($td1);
								$tr2.append($td2);
								$tr2.append($td3);
								$tr2.append($td4);
								$area.append($tr2);
							}
						}
					});
				}, 
				error : function(){
					console.log("error");
				}
			});
			
		});
		$(".noticeMore").on('click', function(){
			var data = "<%=searchResult %>";
			var data2 = "ajax";
			$.ajax({
				url : "search.main",
				data : {searchInputArea : data, ajax : data2},
				type : "post",
				success : function(list){
					$.each(list, function(index, v){
						if(index.includes("Notice")){
							var $area = $("#noticeArea");
							var $productMore = $(".noticeMore");
							$productMore.html("");
							$area.html("");
							var $tr = $("<tr id='senter'>");
							var $th1 = $("<th width='100'>").text("글번호");
							var $th2 = $("<th width='100'>").text("카테고리");
							var $th3 = $("<th width='200' id='title'>").text("글제목");
							var $th4 = $("<th width='100'>").text("작성자");
							var $th5 = $("<th width='200'>").text("조회수");
							var $th6 = $("<th width='350'>").text("작성일");
							$tr.append($th1);
							$tr.append($th2);
							$tr.append($th3);
							$tr.append($th4);
							$tr.append($th5);
							$tr.append($th6);
							$area.append($tr); 
							for(var i = 0; i < v.length; i++){
								var $tr2 = $("<tr>");
								var $td1 = $("<td>").text(v[i].n_code);
								var $td2 = $("<td>").text(v[i].m_name);
								var $td3 = $("<td>").text(v[i].n_title);
								var $td4 = $("<td>").text(v[i].aliass);
								var $td5 = $("<td>").text(v[i].n_count);
								var $td6 = $("<td>").text(v[i].create_date);
								var $td6 = 
								$tr2.append($td1);
								$tr2.append($td2);
								$tr2.append($td3);
								$tr2.append($td4);
								$tr2.append($td5);
								$tr2.append($td6);
								$area.append($tr2);
							}
						}
					});
				}, 
				error : function(){
					console.log("error");
				}
			});
		});
	</script>
	</main>
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
	crossorigin="anonymous"></script> -->
<script>
	window.jQuery
			|| document
					.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
</script>
<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
</html>