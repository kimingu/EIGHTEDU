<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outSide{
		border:1px solid red;
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
							id="ingu"> <span data-feather="home"></span> 쉬는시간 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/communityPage/englishBoard.jsp"
							id="koo"> <span data-feather="file"></span> 영어

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/communityPage/japaneseBoard.jsp"
							id="koo"> <span data-feather="shopping-cart"></span> 일본어

						</a></li>

					</ul>

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/communityPage/chineseBoard.jsp"
							id="koo"> <span data-feather="file-text"></span> 중국어

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/communityPage/koreaBoard.jsp"
							id="koo"> <span data-feather="file-text"></span> 그외언어

						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=contextPath %>/views/communityPage/dataBoard.jsp"
							id="koo"> <span data-feather="file-text"></span> 자료실
								<hr>
						</a></li>
						<li class="nav-item"></li>
					</ul>
				</div>
			</nav>
</body>
</html>