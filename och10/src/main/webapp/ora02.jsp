<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stmt = conn.createStatement();
	
	String deptno = request.getParameter("deptno");
	String sql = "select * from dept where deptno = "+deptno;
	ResultSet rs = stmt.executeQuery(sql);
	System.out.println("sql -> " +sql);
	
	
	if (rs.next()) {
		String dname = rs.getString("dname"); //rs.getStrin(2);
		String loc = rs.getString(3); //숫자는 조회되는 컬럼 순서 이름으로 가져올수도있음 3말고 "loc"
		
		out.println("부서코드 : "+deptno+"<p>");
		out.println("부서명 : "+dname+"<p>");
		out.println("근무지 : "+loc+"<p>");
		} else out. println("부서가 없습니다");
	
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>