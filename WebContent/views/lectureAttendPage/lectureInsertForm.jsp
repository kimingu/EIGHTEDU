<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

#line {
	border: 1px solid lightgray;
	width: 50%;
	height: 400px;
	margin-top: 10px;
	margin-left : 10%;
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

#subject, #satisfied {
	margin: 10px;
	margin-top: 1px;
	font-size: 20px;
	border-bottom: 2px solid #ccc;
	transition: all .2s ease-in-out;
	border-radius: 0;
	border: 0;
}

#board-content , #border-t_name {
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
	margin-top: 100px;
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
.question .wid30{width:40%;}
.question .wid80{width:80%;}

.btngreen{margin-top:30px;}
.btngreen a{width:8%;margin:0 auto;display:block;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#fff;border:1px solid #008d2d;border-radius:2em;background:#008d2d; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
.btngreen a:hover{background:#fff;color:#008d2d;}



</style>
</head>

<body>
   <%@ include file="../common/menuBar.jsp"%>
   <form action="<%= contextPath %>/insert.le" method="post">
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
            <a class="nav-link" href="<%=contextPath %>/views/lectureAttendPage/main.jsp">
              <span data-feather="file"></span>
            	  나의교실
            </a>
            	
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/leclist.le">
              <span data-feather="shopping-cart"></span>
              	영어교실</a>
          </li>

        </ul>

        <ul class="nav flex-column mb-2">
       
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/leclist.le">
              <span data-feather="file-text"></span>
              	일본어교실
            </a>
     			<ul>
            		<li><p>초급반</p></li>
            		<li><p>중급반</p></li>
            	</ul>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/leclist.le">
              <span data-feather="file-text"></span>
              	중국어교실
             
            </a>
          </li>

        </ul>
      </div>
    </nav>



			<div id="line">
			
	<table class="question">
        <tr>
            <th class="th" scope="row" >강좌명</th>
            <td><input type="text" class="wid80" placeholder="강좌명을 입력해주세요" name="title">
            </td>
        </tr>
        
          <tr>
            <th class="th" scope="row" >강의수</th>
            <td><input type="text" class="wid20" placeholder="ex) 22, 23" name="number">
            </td>
        </tr>
        
          <tr>
            <th class="th" scope="row" >수강료</th>
            <td><input type="text" class="wid20" placeholder="ex) 3000" name="price">
            </td>
        </tr>

        <tr>
            <th class="th" scope="row" >분류</th>
            <td><select name="type">
                <option value="영어교실">영어교실</option>
                <option value="일본어교실">일본어교실</option>
                <option value="중국어교실">중국어교실</option>

            </select>
            </td>
        </tr>
        
                
          <tr>
            <th class="th" scope="row" >강사명</th>
            <td><input type="text" class="wid40" placeholder="강사명을 입력해주세요" name="t_name">
            </td>
        </tr>
        
        
        <tr>
            <th class="th" scope="row">강좌소개</th>
            <td>
                <textarea  placeholder="강좌 소개를 입력해주세요" name="content"></textarea>
            </td>
        </tr>
  </table>
  

		</div>
			</div>
				<div id="insert-btn" align="center">
					<hr>
					<button id="submit" type="submit">등록하기</button>
			 		<button type="button" onclick="javascript:history.back();">취소하기</button>	
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
