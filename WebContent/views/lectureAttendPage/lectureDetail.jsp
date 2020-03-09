<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import = "lecture.model.vo.*"%>
   
   <%
   	Video v = (Video)request.getAttribute("video");
   %>
   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
<!-- -->

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

#side_main {
color:black;
font-size:24px;
}

.nav-link {
color:rgb(154,157,160);
font-size:20px;
}




#title {
 text-align: center;
}

#senter {
font-size:18px;
color:black;
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

#youTubePlayer1{
	margin:1%;
	paddind:1%;


}

#memberJoinBtn{
	
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
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=영어교실">
              <span data-feather="shopping-cart"></span>
              	영어교실</a>
          </li>

        </ul>

        <ul class="nav flex-column mb-2">
       
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=일본어교실">
              <span data-feather="file-text"></span>
              	일본어교실
            </a>
     			<ul>
            		<li><p>초급반</p></li>
            		<li><p>중급반</p></li>
            	</ul>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/choicelist.le?l_type=중국어교실">
              <span data-feather="file-text"></span>
              	중국어교실
             
            </a>
          </li>

        </ul>
      </div>
    </nav>
   


    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

        
	 <h1></h1>
        <div id="youTubePlayer1"></div><!-- 플레이어를 불러올 영역-->



        <script>
            // youtube API 불러옴
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/player_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 플레이어변수 설정
var youTubePlayer1;

function onYouTubeIframeAPIReady() {
    youTubePlayer1 = new YT.Player('youTubePlayer1', {
        width: '1000',
        height: '563',
        videoId: '<%=v.getV_link()%>', // 유튜브 뒷부분 링크
        // https://www.youtube.com/watch?time_continue=46&v=0Ui6uGHmiks 이런식의 뒷부분만 추출
        playerVars: {rel: 0},//추천영상 안보여주게 설정
        events: {
          'onReady': onPlayerReady, //로딩할때 이벤트 실행
          'onStateChange': onPlayerStateChange //플레이어 상태 변화시 이벤트실행
        }
    });//youTubePlayer1셋팅
}


function onPlayerReady(event) {
    event.target.playVideo();//자동재생
    //로딩할때 실행될 동작을 작성한다.
}


function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
        //플레이어가 재생중일때 작성한 동작이 실행된다.
    }
  }
 
$(document).ready(function () {
    $(".btn_play").on("click", function () {
        youTubePlayer1.playVideo();//재생
    });
    $(".btn_stop").on("click", function () {
        youTubePlayer1.stopVideo();//정지
    });
    $(".btn_pause").on("click", function () {
        youTubePlayer1.pauseVideo();//일시정지
    });
});
        
        </script>
        
        <%-- 
        <div align="right">
        	<button class= btn id="A" onclick="review();" type="button">평가하기</button>
        	<button class= btn id="B" onclick="finish();" type="button">수강완료</button>
        </div>
        
        
        <script>
       function review(){
			location.href="<%= request.getContextPath() %>/views/lectureAttendPage/review.jsp";
		}
       
       // 이전으로 돌아가게 할 예정 list로
       function finish(){
			location.href="<%= request.getContextPath() %>/views/lectureAttendPage/review.jsp";
		}
       </script> --%>

   

      </main>
      
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