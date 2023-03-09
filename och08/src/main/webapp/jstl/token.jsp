<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 애니멀스배열을 애니멀에 넣음 delims속성값을 기준으로 쪼개 배열만듬 -->
	<c:set var="animals" value="토끼*고양이*강아지*여우"></c:set>
	<h2>사자의 생일</h2>
	<c:forTokens var="animal" items="${animals }" delims="*">
		${animal }<br>
	</c:forTokens>
</body>
</html>