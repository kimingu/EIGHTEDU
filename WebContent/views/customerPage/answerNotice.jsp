<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int n_code = Integer.parseInt(request.getParameter("n_code"));
	String n_title = request.getParameter("n_title");
	String n_content = request.getParameter("n_content");
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
	background-color:white;
	color:black;
}
</style>
<body>

<form action="<%=request.getContextPath()%>/check.no" onsubmit="enter();" method="get">
  <div class="report">
  <br><br>
    <label for="report">유형</label><br>
    <select class="form-control" id="report1" name="report1">
      <option value="ok">답변하기</option>
      <option value="fail">미해결처리</option>
    </select>
  </div>
  <br>
  <div class="report">
    <label for="report">답변 내용</label><br>
    <textarea class="form-control" id="report2" rows="10" style="width:90%;" name="report2"></textarea>
  </div>
  <br>
  <input type="hidden" name="n_code" value="<%=n_code%>">
  <input type="hidden" name="n_title" value="<%=n_title%>">
  <input type="hidden" name="n_content" value="<%=n_content%>">
  
  <div class="button">
  <button type="submit" id="reportbtn">답변 등록</button>
 </div>
</form>
<script>
	function enter(){
		var str = document.getElementById("report2").value;
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
		document.getElementById("report2").value = str;
	}
</script>

</body>
</html>