<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	// 필요 객체 불러오기
	request.setCharacterEncoding("utf-8"); //post방식으로 한글이포함된 파라미터 받을때는 인코딩필요
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Class.forName(driver);
	
	// 파라미터 받기 
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	//SQL문장 처리
	String sql = String.format("insert into dept values ('%s', '%s', '%s')", deptno, dname, loc);
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate(sql);
	
	if (result>0) out.print("입력 성공!!!");
	else	out.print("입력 실패...");
	
	stmt.close();
	conn.close();

%>

</body>
</html>