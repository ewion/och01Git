<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.NAME }의 주소는? ${ADDRESS[param.NAME] }<p>
	<%-- ${ADDRESS."김시아" }<p> 오류 발생--%>
	${ADDRESS["김시아"] }<p> <!-- 부득이하게 한글을쓸때에는 대괄호로 감싸줘야댐 -->
	${ADDRESS.LeeSangMi} <!-- 한글아닌경우 .name  -->
</body>
</html>