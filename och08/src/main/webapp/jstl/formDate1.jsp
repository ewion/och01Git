<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="date1" value="<%=new Date() %>"></c:set>

<body>

	오늘 날짜 : <fmt:formatDate value="${ date1}"/> <p>
	현재 시간 : <fmt:formatDate value="${ date1}" type="time"/>
	
	<h2>현재 날짜와 시간</h2>
	<fmt:formatDate value="${date1 }" type="both" dateStyle="short" timeStyle="short"/><br>
	<fmt:formatDate value="${date1 }" type="both" dateStyle="medium" timeStyle="medium"/><br>
	<fmt:formatDate value="${date1 }" type="both" dateStyle="long" timeStyle="long"/><br>
	<fmt:formatDate value="${date1 }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h2>날짜 표기 방식 커스텀 type와 pattern으로</h2>
	날자 : <fmt:formatDate value="${date1 }" type="date" pattern="YYYY/MM/DD E"/><br>
	시간 : <fmt:formatDate value="${date1 }" type="time" pattern="hh:mm:ss (a)"/><br>
</body>
</html>