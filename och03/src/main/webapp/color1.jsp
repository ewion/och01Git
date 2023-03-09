<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//변수선언  꺼내는 방법
	String color = request.getAttribute("color").toString();
	System.out.println("color1.jsp color -> "+color);
%>
</head>
<body bgcolor="<%=color%>">

</body>
</html>