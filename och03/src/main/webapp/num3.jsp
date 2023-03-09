<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>num 누계</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	int result =0;
	for(int i = 1; i<=num; i++) {
		result +=i; 
	}
	out.println(num+"일 때 합계는"+result);
	%>
</body>
</html>