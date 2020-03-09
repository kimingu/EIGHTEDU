<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	String msg = (String)session.getAttribute("msg");
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if("<%=msg%>" != "null"){
			alert("<%=msg%>");
			<% session.removeAttribute("msg"); %>
		}
		self.close();
		opener.location.href = "<%=request.getContextPath()%>/productList.pro";
	</script>
</body>
</html>