<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="greet" value="how are you"></c:set>
<body>
	원글 		: ${greet }<p>
	대문자 	: ${fn:toUpperCase(greet)}<p>
	소문자 	: ${fn:toLowerCase(greet)}<p>
	How위치 	: ${fn:indexOf(greet, "how")}<p>
	Are위치 	: ${fn:indexOf(greet, "are")}<p>
	Are변경 	: ${fn:replace(greet, "are", "were")}<p>
	문자길이 	: ${fn:length(greet)}<p>
	
</body>
</html>