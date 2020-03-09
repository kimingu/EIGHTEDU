<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_code = request.getParameter("user_code");
	String b_code = request.getParameter("b_code");
%>
<!DOCTYPE html>
<!-- 게시글 신고버튼 클릭 시 뜨는 디테일뷰 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
<style>
div.button
{
   text-align:center;
   
}
div.report{
	
	margin:auto;
	text-align:center;
	height: 100%;
	width:100%;
}
body{
	background-color:black;
	color:white;
}
</style>
<body>
<form action="insert.re">
  <div class="report">
  <br><br>
  <input type="hidden" value="<%=user_code%>" name="user_code">
  <input type="hidden" value="<%=b_code%>" name="b_code">
    <label for="report">신고유형</label><br><br>
    <select class="form-control" id="r_number" name="r_number">
      <option value="타인 비방/욕설">타인 비방/욕설</option>
      <option value="혐오 콘텐츠">혐오 콘텐츠</option>
      <option value="무단 광고">무단 광고</option>
      <option value="음담패설">음담패설</option>
    </select>
  </div>
  <br>
  <div class="report">
    <label for="report">신고 내용</label><br>
    <textarea class="form-control" id="r_content" name="r_content" rows="8" style="width:90%;"></textarea>
  </div>
  <br>
  <div class="button">
  <button id=reportbtn a href="#">신고 등록</button> <!-- alert해결 후 데이터 전송 되게하기 -->
  </div>
</form>

</body>
</html>