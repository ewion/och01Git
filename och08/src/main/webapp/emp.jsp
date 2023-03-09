<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--   hw2
	emp Bean 선언
	emp Bean 값 저장
	emp Bean Page 이동
	empResult.jsp 로 -->
	<jsp:useBean id="emp" class=och08.emp scope="request"/>
	<jsp:setProperty property="empno" name="emp"/>
	<jsp:setProperty property="ename" name="emp"/>
	<jsp:setProperty property="job" name="emp"/>
	<jsp:setProperty property="sal" name="emp"/>
	<jsp:forward page="empResult"/>
</body>
</html>