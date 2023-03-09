<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1부터 100까지의 합 스크립트릿+Expression</h2>
	<%
		//parameter sum get
		String sum = request.getParameter("sum").toString();
	%>
	<%=sum %><p>
</body>
</html>