<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서정보 Scl hw4</h2>
	<%
	request.getAttribute("dno");
	request.getAttribute("dname");
	request.getAttribute("phone");
	request.getAttribute("position");
	
	%>
	<h2>부서정보 EL hw4</h2>
	부서코드 : ${dno }
	부서명 : ${dname }
	전화번호 : ${phone }
	근무지 : ${position }
	
</body>
</html>