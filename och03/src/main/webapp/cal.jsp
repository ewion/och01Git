<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사칙연산</h1>
	<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	int sum = num1+num2;
	int min = num1-num2;
	int tim = num1*num2;
	float f = (float)(num1/num2);
	%>
	더하기 <%=sum %><p>
	빼애기 <%=min %><p>
	곱하기 <%=tim %><p>
	나누기 <%=f %><p>
</body>
</html>