<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:formatNumber value="1000000"			groupingUsed="true"/><br> <!-- 3자리수 단위로 콤마 -->
	<fmt:formatNumber value="3.141592"			pattern="#.###"/><br>
	<fmt:formatNumber value="3.1"				pattern="#.##"/><br>
	<fmt:formatNumber value="3.1"				pattern="#.00"/><br>
	<fmt:formatNumber value="651234264361243"	pattern="#,###.00"/><br>
	<fmt:formatNumber value="250000"			type="currency" currencySymbol="\\"/><br> <!-- 첫역슬래시는 특수기호의 예고 두번째껀 원화표시 -->
	<fmt:formatNumber value="0.75"				type="percent"/><br>
</body>
</html>