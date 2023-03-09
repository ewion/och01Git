<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<h2>스크립트릿 + Statement 삭제 hw2-2</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		Class.forName(driver);
		
		Statement stmt = conn.createStatement();
		
		String deptno = request.getParameter("deptno");
		
		String sql = "delete dept where deptno = "+deptno;
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0 ) out.println("삭제 성공!!!");
		else out.println("삭제 실패...");
		stmt.close();
		conn.close();
		
	%>
</body>
</html>