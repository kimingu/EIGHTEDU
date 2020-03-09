<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.*, board.model.vo.*"%>
<%
	ArrayList<Notice> listNo = (ArrayList<Notice>) request.getAttribute("listNo");
	ArrayList<Board> listBo = (ArrayList<Board>) request.getAttribute("listBo");
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

	
<!-- 달력추가 -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


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
#noticeTitle{
	margin-top : 20px;
}
#listArea{
	margin-bottom : 20px;
}
</style>
<!-- Custom styles for this template -->
<link href="resources/css/mainStyle.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menuBar.jsp"%>
	<main role="main">

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
               <rect width="100%" height="100%" fill="#777" />
               <!-- 첫 번째 이미지 파일 -->
               <img src="resources/file/image/eightMain_1.jpg"
						width="100%" height="100%">
               </svg>
				<div class="container">
					<div class="carousel-caption text-left"></div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
               <rect width="100%" height="100%" fill="#777" />
               <!-- 두 번째 이미지 파일 -->
               <img src="resources/file/image/eightMain_2.jpg"
						width="100%" height="100%">
               </svg>
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
               <rect width="100%" height="100%" fill="#777" /></svg>
                 <!-- 세 번째 이미지 파일 -->
               <img src="resources/file/image/eightMain_3.jpg"
						width="100%" height="100%">
               </svg>
			</div>
		</div>
		<a class="carousel-control-prev" href="#myCarousel" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#myCarousel" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container marketing">
		<div class="row">
			<form class="form-inline mt-2 mt-md-0" id="Search" action="<%=contextPath%>/search.main">
				<input class="form-control mr-sm-2" type="text" placeholder="검색할 키워드를 입력하세요." name="searchInputArea"
					aria-label="search" style="text-align : center; margin-left:30px; width : 1000px">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		
         <br>
         <img src = "<%= contextPath %>/resources/file/image/teacher_image.jpg" width="100%" height="50%">
         
         
		<br><br><br><br>

		<div class="row featurette">

			<div class="container-fluid">
			
			
    <div class="card">
        <h3 class="card-header" id="monthAndYear"></h3>
        <table class="table table-bordered table-responsive-sm" id="calendar">
            <thead>
            <tr>
                <th>일요일</th>
                <th>월요일</th>
                <th>화요일</th>
                <th>수요일</th>
                <th>목요일</th>
                <th>금요일</th>
                <th>토요일</th>
            </tr>
            </thead>

            <tbody id="calendar-body">

            </tbody>
        </table>

        <div class="form-inline">

            <button class="btn btn-outline-primary col-sm-6" id="previous" onclick="previous()">이전달</button>

            <button class="btn btn-outline-primary col-sm-6" id="next" onclick="next()">다음달</button>
        </div>
        <br/>
        <form class="form-inline">

            <label class="lead mr-2 ml-2" for="month">　　　　　　해당일 검색 </label>
				
            <label for="year"></label><select class="form-control col-sm-4" name="year" id="year" onchange="jump()">
            <option value=1990>1990</option>
            <option value=1991>1991</option>
            <option value=1992>1992</option>
            <option value=1993>1993</option>
            <option value=1994>1994</option>
            <option value=1995>1995</option>
            <option value=1996>1996</option>
            <option value=1997>1997</option>
            <option value=1998>1998</option>
            <option value=1999>1999</option>
            <option value=2000>2000</option>
            <option value=2001>2001</option>
            <option value=2002>2002</option>
            <option value=2003>2003</option>
            <option value=2004>2004</option>
            <option value=2005>2005</option>
            <option value=2006>2006</option>
            <option value=2007>2007</option>
            <option value=2008>2008</option>
            <option value=2009>2009</option>
            <option value=2010>2010</option>
            <option value=2011>2011</option>
            <option value=2012>2012</option>
            <option value=2013>2013</option>
            <option value=2014>2014</option>
            <option value=2015>2015</option>
            <option value=2016>2016</option>
            <option value=2017>2017</option>
            <option value=2018>2018</option>
            <option value=2019>2019</option>
            <option value=2020>2020</option>
            <option value=2021>2021</option>
            <option value=2022>2022</option>
            <option value=2023>2023</option>
            <option value=2024>2024</option>
            <option value=2025>2025</option>
            <option value=2026>2026</option>
            <option value=2027>2027</option>
            <option value=2028>2028</option>
            <option value=2029>2029</option>
            <option value=2030>2030</option>
        </select>
    
             
            <select class="form-control col-sm-4" name="month" id="month" onchange="jump()">
                <option value=0>1월</option>
                <option value=1>2월</option>
                <option value=2>3월</option>
                <option value=3>4월</option>
                <option value=4>5월</option>
                <option value=5>6월</option>
                <option value=6>7월</option>
                <option value=7>8월</option>
                <option value=8>9월</option>
                <option value=9>10월</option>
                <option value=10>11월</option>
                <option value=11>12월</option>
            </select></form><br>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
        
<script>

let today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();
let selectYear = document.getElementById("year");
let selectMonth = document.getElementById("month");

let months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

let monthAndYear = document.getElementById("monthAndYear");
showCalendar(currentMonth, currentYear);


function next() {
    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
    currentMonth = (currentMonth + 1) % 12;
    showCalendar(currentMonth, currentYear);
}

function previous() {
    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
    showCalendar(currentMonth, currentYear);
}

function jump() {
    currentYear = parseInt(selectYear.value);
    currentMonth = parseInt(selectMonth.value);
    showCalendar(currentMonth, currentYear);
}

function showCalendar(month, year) {

    let firstDay = (new Date(year, month)).getDay();
    let daysInMonth = 32 - new Date(year, month, 32).getDate();

    let tbl = document.getElementById("calendar-body"); // body of the calendar

    // clearing all previous cells
    tbl.innerHTML = "";

    // filing data about month and in the page via DOM.
    monthAndYear.innerHTML = year + "년 " + months[month];
    selectYear.value = year;
    selectMonth.value = month;

    // creating all cells
    let date = 1;
    for (let i = 0; i < 6; i++) {
        // creates a table row
        let row = document.createElement("tr");

        //creating individual cells, filing them up with data.
        for (let j = 0; j < 7; j++) {
            if (i === 0 && j < firstDay) {
                let cell = document.createElement("td");
                let cellText = document.createTextNode("");
                cell.appendChild(cellText);
                row.appendChild(cell);
            }
            else if (date > daysInMonth) {
                break;
            }

            else {
                let cell = document.createElement("td");
                let cellText = document.createTextNode(date);
                if (date === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
                    cell.classList.add("bg-info");
                } // color today's date
                cell.appendChild(cellText);
                row.appendChild(cell);
                date++;
            }


        }

        tbl.appendChild(row); // appending each row into calendar body.
    }

}

</script>
		</div>
		<br><br>
		         <img src = "<%= contextPath %>/resources/file/image/two_ad.jpg" width="100%" height="50%"> <br><br>
         <img src="<%=contextPath%>/resources/file/image/one_ad.jpg" width="100%" height="50%"> <br><br>
                  <img src="<%=contextPath%>/resources/file/image/three_ad.jpg" width="100%" height="50%"> <br><br>
   

		<div class="row featurette">
			<div class="col-md-6 order-md-1" style="border: 1px solid lightgray">
				<h5 id="noticeTitle"><a href="<%=contextPath%>/list.bo?b_name=영어">커뮤니티 게시판 최신글</a></h5><hr>
				<table id="listArea" class="listBoard">
					<tr id="senter">
						<th width="100">카테고리</th>
						<th width="400" id="title">글제목</th>
						<th width="100" align="right">　　　 작성자</th>
					</tr>
					<% if(listNo.isEmpty()){ %>
					<tr id="listBoard">
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for(Board b : listBo) {
					%>
					<tr id="listBoard">
						<input id="b_code" type="hidden" value="<%=b.getB_code()%>">
						<td width="100"><%=b.getM_name() %></td>
						<td width="400"><%=b.getB_title() %></td>
						<td width="100" align="right"><%=b.getAliass() %></td>
					</tr>
					<%}} %>
				</table>
			</div>
			
			<div class="col-md-6 order-md-2" style="border: 1px solid lightgray">
				<h5 id="noticeTitle"><a href="<%=contextPath%>/list.no?n_name=공지사항">공지사항 게시판 최신글</a></h5><hr>
				<table id="listArea" class="listNotice">
					<tr id="senter">
						<th width="100">카테고리</th>
						<th width="400" id="title">글제목</th>
						<th width="100" align="right">　　　 작성자</th>
					</tr>
					<% if(listNo.isEmpty()){ %>
					<tr id="listNotice">
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for(Notice n : listNo) {
					%>
					<tr id="listNotice">
						<input id="n_code" type="hidden" value="<%=n.getN_code()%>">
						<td width="100"><%=n.getM_name() %></td>
						<td width="400"><%=n.getN_title() %></td>
						<td width="100" align="right"><%=n.getAliass() %></td>
					</tr>
					<%}} %>
				</table>
			</div>
		</div>
		
         <br>
       <img src="<%=contextPath%>/resources/file/image/four_ad.jpg" width="100%" height="50%"> <br><br>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script>
			window.jQuery
					|| document
							.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
		</script>
		<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
			crossorigin="anonymous"></script>
		<!-- /END THE FEATURETTES -->
	
	</div>
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
		</main>
		
	</div>
		<script>
				// 게시판 상세보기 기능 구현
				$(function() {
					$(".listBoard td").mouseenter(function() {
						$(this).parent().css({
							"background" : "darkgray",
							"cursor" : "pointer"
						});
					}).mouseout(function() {
						$(this).parent().css({
							"background" : "white"
						});
					}).click(function() {
						var b_code = $(this).parent().children("#b_code").val();
						location.href="<%=contextPath%>/detail.bo?b_code="+b_code;

					});
				});
				$(function() {
					$(".listNotice td").mouseenter(function() {
						$(this).parent().css({
							"background" : "darkgray",
							"cursor" : "pointer"
						});
					}).mouseout(function() {
						$(this).parent().css({
							"background" : "white"
						});
					}).click(function() {
						var n_code = $(this).parent().children("#n_code").val();
						location.href="<%=contextPath%>/detail.no?n_code="+n_code;

					});
				});
			</script>
	
	</body>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
		crossorigin="anonymous"></script>
		
</html>