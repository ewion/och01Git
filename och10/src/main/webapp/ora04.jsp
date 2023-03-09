<%@page import="och10.Dept"%>
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
	// DTO : Data Transfer Object  DAO : Data Access   Object
	// DTO --> Data 전달하는 객체 단위(일반적 Table단위)
	String deptno = request.getParameter("deptno");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept where deptno = "+deptno;
	Class.forName(driver);
	System.out.println("sql -> " +sql);
	
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// DTO
	Dept dept = new Dept();
	
	if (rs.next()) {
		String dname = rs.getString("dname"); //rs.getStrin(2);
		String loc = rs.getString(3); //숫자는 조회되는 컬럼 순서 이름으로 가져올수도있음 3말고 "loc"
		
		// DTO 저장
		dept.setDeptno(Integer.parseInt(deptno));
		dept.setDname(dname);
		dept.setLoc(loc);
		// Dept.java (DTO)로 저장
		request.setAttribute("dept", dept);
		} else out. println("부서가 없습니다");
	// 변수 값 저장 --> ora03Result.jsp(EL표기법)
	rs.close();
	stmt.close();
	conn.close();
	// DTO로 묶어서 한꺼번에 보내고 받음
	RequestDispatcher rd = request.getRequestDispatcher("ora04Result.jsp");
	rd.forward(request, response);
%>

</body>
</html>