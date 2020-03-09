<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!Doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Dashboard Template · Bootstrap</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">


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

#master {
   color: black;
   font-size: 24px;
}

#koo {
   color: rgb(154, 157, 160);
   font-size: 20px;
}

#koo:hover {
   color: dimgray;
}
</style>
<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
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
                     href="<%=contextPath%>/views/masterPage/dashBoard.jsp" id="koo">
                        <span data-feather="file"></span> 대시보드
                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<%=contextPath%>/views/masterPage/contents.jsp" id="koo">
                        <span data-feather="shopping-cart"></span> 컨텐츠 관리
                  </a></li>
               </ul>
            </div>
         </nav>

         <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
         <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
               <div class="btn-group mr-2">
                  <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
               </div>
               <button type="button"
                  class="btn btn-sm btn-outline-secondary dropdown-toggle">
                  <span data-feather="calendar"></span> This week
               </button>
            </div>
         </div>

         <div class="col-md-6">
            <div
               class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
               <div class="col p-4 d-flex flex-column position-static">
                  <strong class="d-inline-block mb-2 text-primary">신규 주문내역</strong>
                  <p class="card-text mb-auto">
                     주문 번호 0153243534 : 볼펜 <br> 주문 번호 1634364346 : 노트
                  </p>
                  <a href="<%=contextPath%>/views/masterPage/con_shop.jsp"
                     class="stretched-link">주문 관리 페이지로 이동</a>
               </div>
               <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="200" height="250"
                     xmlns="http://www.w3.org/2000/svg"
                     preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                     aria-label="Placeholder: Thumbnail">
                     <title>Placeholder</title><rect width="100%" height="100%"
                        fill="#55595c"></rect>
                     <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
               </div>
            </div>
         </div>

         <div class="col-md-6">
            <div
               class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
               <div class="col p-4 d-flex flex-column position-static">
                  <strong class="d-inline-block mb-2 text-success">오늘 인기
                     컨텐츠</strong>
                  <h3 class="mb-0">1. 8주 완성 토익</h3>
                  <p class="mb-auto">
                     2. 중국어 6개월로 끝내자! <br> 3. 일본어 마스터
                  </p>
                  <a href="#" class="stretched-link">수강 관리 페이지로 이동</a>
               </div>
               <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="200" height="250"
                     xmlns="http://www.w3.org/2000/svg"
                     preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                     aria-label="Placeholder: Thumbnail">
                     <title>Placeholder</title><rect width="100%" height="100%"
                        fill="#55595c"></rect>
                     <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
               </div>
            </div>

            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
         </main>
      </div>
   </div>

   <div id="footer-wrapper">
      <div id="footer3">
         <a href="#"> 공지사항 </a> <a href="#"> 문의 및 신고 </a> <a href="#">
            이용약관 </a> <a href="#"> 개인정보취급방침 </a> <a href="#"> 청소년보호정책 </a> <a
            href="#"> 게시물 삭제요청방법 </a> <a href="#"> 광고문의 </a>
         <p>업체 및 기관 : 주식회사 에잇에듀 | 개인 : EIGHT.co</p>
         <p>Copyright ⓒ www.eightedu.com</p>
      </div>
   </div>
</body>
</html>