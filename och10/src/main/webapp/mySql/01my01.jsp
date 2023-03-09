<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dberror" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC"; //드라이버찾고
	Class.forName(driver); //드라이버잡고
	Connection conn = DriverManager.getConnection(url,"root","3024"); //드라이버연결
	if (conn != null) out.println("mysql 연결 성공");
	else out.println("mysql 연결 실패...");
	conn.close();
%>
</body>
</html>