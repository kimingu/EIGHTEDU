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
#ingu {
	color: black;
	font-size: 24px;
}

.nav-link {
	color: rgb(154, 157, 160);
	font-size: 20px;
}

.nav-link : hover {
	color: black;
}



.nav-item ul {
	padding: 0 10px;
	margin: 0;
	height: 0;
	overflow: hidden; /*내용이 넘치면 잘리게함 = 안보이게함 height가 0이므로 안보임!*/
	transition: height 0.5s ease-in;
}

.nav-item : ul {
	overflow: auto; /*내용이 넘치면 스크롤을 통해서 아래로 출력하게함!*/
	height: 100px;
}
#line{
	width : 80%;
}
.lists:hover{
	background: gray;
	cursor: pointer;
}
.th, .td{
	text-align: center;
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


		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> <br>
         <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-2 mb-3 border-top">
            <img src="<%=contextPath%>/resources/file/image/point_shop.jpg" width="100%" height="50%">
         </div>

			<div id="line">
				<form action="<%= contextPath %>/delete.pro" method="post">
					<table>
						<tr>
							<th class="th" width="300px"><h3>상품코드</h3></th>
							<th class="th" width="300px"><h3>상품명</h3></th>
							<th class="th" width="300px"><h3>재고</h3></th>
							<th class="th" width="300px"><h3>가격</h3></th>
							<th class="th" width="300px"><h3>분류</h3></th>
						</tr>
						<hr>
						<% if(!list.isEmpty()){ %>
							<% for (Product p : list) {%>
							<tr class="lists" onclick="deleteForm(this);">
								<td class="td"><%=p.getPro_num() %></td>
								<td class="td"><%=p.getPro_name() %></td>
								<td class="td"><%=p.getRemain() %></td>
								<td class="td"><%=p.getPrice() %></td>
								<td class="td"><%=p.getPro_type() %></td>
								<input type="hidden" name="pronum" value="<%=p.getPro_num() %>">
							</tr>
							<% } %>
						<% } else {%>
							<tr>
								<td colspan="6">조회된 리스트가 없습니다.</td>
							</tr>
						<% } %>
					</table>
					<div id="insert-btn" align="center">
						<hr>
						<button type="button" onclick="location.href='<%=contextPath%>/views/masterPage/pointShopInsertForm.jsp'">상품 등록하기</button>
					</div>
				</form>
				<script>
					function deleteForm(h){
						if (confirm("정말 삭제하시겠습니까??") == true){    //확인
							location.href="<%= request.getContextPath()%>/deleteProduct.pro?pronum=" + $(h).children().eq(5).val();
						}else{   //취소
						    return;
						}
					}
				</script>
				<br>
				<div class="pagingArea" align="center">
				<!-- 맨 처음으로 (<<) -->
				<button onclick="location.href='<%= contextPath %>/ShopList.ma?currentPage=1'"> &lt;&lt; </button>
				
				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
					<button disabled> &lt; </button>
				<% } else { %>
					<button onclick="location.href='<%= contextPath %>/ShopList.ma?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
				<% } %>
				
				<!-- 10개의 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage){ %>
						<button disabled> <%= p %> </button>
					<% } else { %>
						<button onclick="location.href='<%= contextPath %>/ShopList.ma?currentPage=<%= p %>'"><%= p %></button>
					<% } %>
				<% } %>
				
				<!-- 다음 페이지로 (>) -->
				<% if(currentPage == maxPage){ %>
					<button disabled> &gt; </button>
				<% } else { %>
					<button onclick="location.href='<%= contextPath %>/ShopList.ma?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
				<% } %>
				
				<!-- 맨 끝으로 (>>) -->
				<button onclick="location.href='<%= contextPath %>/ShopList.ma?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			</div>
			</div>
				<!-- 페이징 바 -->
			
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
