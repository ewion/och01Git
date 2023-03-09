<%@page import="och10.Division"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서정보 hw4</h2>
	<h2>model 2 view</h2>
	<% Division d = (Division)request.getAttribute("d"); %>
	
	부서번호 : <%= d.getDno()%><p>
	부서명 : <%= d.getDname()%><p> 
	전화번호 : <%= d.getPhone()%><p>
	근무지 : <%= d.getPosition()%><p>
	
</body>
</html>