<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>구구단 선택...</h2>
<%
	int num = Integer.parseInt(request.getAttribute("num").toString());

	for (int i=2; i<10 ; i++) {
		out.println(i+" * "+num+" = "+i*num+"<p>");
	}
%>
</body>
</html>