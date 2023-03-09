<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- emp Bean 선언
	Bean값 가져오기 
	사번/이름/업무/급여 -->
	<h2>HW3 직원정보</h2>
	<jsp:useBean id="emp" class="och08.emp" scope="request"/>
	
	사번 : <jsp:getProperty property="empno" name="emp"/>
	이름 : <jsp:getProperty property="ename" name="emp"/>
	업무 : <jsp:getProperty property="job" name="emp"/>
	급여 : <jsp:getProperty property="sal" name="emp"/>
	
</body>
</html>