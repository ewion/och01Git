<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//		key 	Value
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("LeeSangMi", "목동");
	map.put("김시아", "신촌");
	map.put("정주희", "홍대");
	map.put("Park", "시드니");
	
	request.setAttribute("ADDRESS", map); //db allias처럼 address라는 별명에 map넣음
	RequestDispatcher dispatcher =
				request.getRequestDispatcher("mapView.jsp?NAME=Park"); //form문의 파라미터처럼 쓸수있다, ?치고 넘어가면 get방식처럼 넘어감
	dispatcher.forward(request, response);
%>
</body>
</html>