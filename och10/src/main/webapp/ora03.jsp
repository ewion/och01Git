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
<!--  DTO : Data Transfer Object  DAO : Data Access   Object -->
<%
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept where deptno = "+deptno;
	Class.forName(driver);
	System.out.println("sql -> " +sql);
	
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	if (rs.next()) {
		String dname = rs.getString("dname"); //rs.getStrin(2);
		String loc = rs.getString(3); //숫자는 조회되는 컬럼 순서 이름으로 가져올수도있음 3말고 "loc"
		
		request.setAttribute("deptno", deptno);
		request.setAttribute("dname", dname);
		request.setAttribute("loc", loc);
	
		} else out. println("부서가 없습니다");
	// 변수 값 저장 --> ora03Result.jsp(EL표기법)
	rs.close();
	stmt.close();
	conn.close();
	
	RequestDispatcher rd = request.getRequestDispatcher("ora03Result.jsp");
	rd.forward(request, response);
%>

</body>
</html>