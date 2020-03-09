<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f3f351b25f32b8d45c2ce8051c5fb86"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #map {
      width:1510px;
      height:600px;
   }
   .come{
      margin-left : 5%;
   }
</style>
</head>
<body>
   <header>
      <%@ include file="../common/menuBar.jsp"%>
   </header>
   <br><br><br>
   <h2 class="come">에잇에듀를 방문하시나요?</h2>
   <h5 class="come">찾아오시는 쉽고 빠른 길을 알려드립니다.</h5>
   <br><br>
   <h2 class="come">찾아오시는 길</h2>
   <div id="wrap">
   <div id="map" class="come"></div>
   </div>
   <script>
      var container = document.getElementById('map');
      var options = {
         center : new kakao.maps.LatLng(37.498493, 127.032551),
         level : 2
      };
      var map = new kakao.maps.Map(container, options);
      var markerPosition = new kakao.maps.LatLng(37.498493, 127.032551);
      var marker = new kakao.maps.Marker({
         position : markerPosition
      });
      marker.setMap(map);
      var iwContent = '<div style="padding:5px;">주식회사 에잇에듀<br><a href="https://map.kakao.com/link/map/주식회사 에잇에듀,37.498493, 127.032551" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/주식회사 에잇에듀,37.498493, 127.032551" style="color:blue" target="_blank">길찾기</a></div>',
      // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      iwPosition = new kakao.maps.LatLng(37.498493, 127.032551); //인포윈도우 표시 위치입니다

      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
         position : iwPosition,
         content : iwContent
      });

      function resizeMap() {
          var mapContainer = document.getElementById('map');
          mapContainer.style.width = '650px';
          mapContainer.style.height = '650px'; 
      }

      function relayout() {  
          // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
          // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
          // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
          map.relayout();
      }
      
      // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다?><
      infowindow.open(map, marker);
   </script>
   
   <br><br><br>
   <h2 class="come">주식회사 에잇에듀</h2>
   <hr>
   <h5 class="come">고객 센터　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　국번없이 1588-8282</h5>
   <hr>
   <h5 class="come">회사 위치　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　역삼역 3번 출구 / 도보 5분</h5>
   <hr>
   
   <br><br><br>
   
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