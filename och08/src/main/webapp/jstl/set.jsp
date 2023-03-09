<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 밑의 문장은 int num1 = 6 와 같음 -->
<c:set var="num1" value="6"/>
<c:set var="num2" value="2"/>
<c:set var="result" value="${num1+num2 }"/>
<c:set var="divResult" value="${num1/num2 }"/>
<body>
	더쌤 : ${num1 }+${num2 }=${result }<p>
	뺄쌤 : ${num1 }-${num2 }=${num1+num2 }<p>
	곱쌤 : ${num1 }*${num2 }=${num1*num2}<p>
	나누쌤1 : ${num1 }/${num2 }=${num1/num2}<p>
	나누쌤2 : ${num1 }/${num2 }=${divResult}<p>
</body>
</html>