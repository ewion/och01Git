<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Person Bean 선언  person -->
	<jsp:useBean id="ps" class="och08.Person" scope="request"/>
	<!-- 위 빈 선언은 자바 언어로 person person = new person와 같음, 인스턴스 생성 -->
	

	<jsp:setProperty property="name" name="ps"/>
	<jsp:setProperty property="gender" name="ps"/>
	<jsp:setProperty property="age" name="ps"/>
	<!-- 파라미터를 하나씩 받는 방법 -->
	
	<jsp:forward page="personResult.jsp"></jsp:forward>
	
</body>
</html>