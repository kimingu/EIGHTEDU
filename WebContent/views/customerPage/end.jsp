<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int n_code = Integer.parseInt(request.getParameter("n_code")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("답변 작성을 완료하였습니다");
	self.close();
	opener.location.href="<%=request.getContextPath()%>/detail.no?n_code=<%=n_code%>";
</script>
</body>
</html>