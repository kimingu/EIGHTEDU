<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.model.vo.User"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn_img{
	margin-left:80%;
	width:60px;
	height:60px;
}
#wrap {margin:auto;text-align:center;}
#quick {position:absolute;z-index:2;top:10px;width:140px;right:50px;}
#container {position:relative;}
</style>
</head>
<body>
<div id="wrap">
  <div id="container">
    <div id="quick_bg">
      <div id="quick">
        <a href="#"><img src="<%=request.getContextPath()%>/resources/file/image/Go_Top3.png" class="btn_img" id="go_top"></a>
        <br>
        <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/resources/file/image/Go_Home2.png" class="btn_img"></a>
      </div>
    </div>
  </div>
</div>
<script>
	var quick_menu = $('#quick');
	var quick_top = 470;
 
	quick_menu.css('top', $(window).height() );
	$(document).ready(function(){
		quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 200 ); 
		$(window).scroll(function(){
			quick_menu.stop();
			quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
		});
	});
</script>
</body>
</html>