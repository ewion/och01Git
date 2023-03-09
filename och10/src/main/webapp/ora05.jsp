<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
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
	//*****
	request.setCharacterEncoding("utf-8");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Class.forName(driver);
	
	String sql = "select empno, ename, job, sal from emp ";
	System.out.println("sql ->"+sql);
	ArrayList<Emp> al = new ArrayList<Emp>();
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	//al에 emp테이블의 로우를 하나씩 삽입
	if(rs.next()) {
		do {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setSal(rs.getInt(4));
			al.add(emp);
		} while (rs.next());
		request.setAttribute("al", al);
		
		// RequestDispatcher rd = request.getRequestDispatcher("ora05Result.jsp");
		// hw01
		RequestDispatcher rd = request.getRequestDispatcher("ora05Result2.jsp");
		rd.forward(request, response);
		
		// 사용객체 종료
		rs.close();
		stmt.close();
		conn.close();
	}
	
 
%>
</body>
</html>