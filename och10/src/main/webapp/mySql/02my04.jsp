<%@page import="och10.Division"%>
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
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","3024");
	
	String dno = request.getParameter("dno");
	String sql = "select * from division where dno="+dno;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	Division d = new Division();
	
	if(rs.next()) {	
		d.setDno(rs.getInt(1));
		d.setDname(rs.getString(2));
		d.setPhone(rs.getString(3));
		d.setPosition(rs.getString(4));
		
		request.setAttribute("d", d);

	} else out.println("부서가 없습니다");
	rs.close();
	conn.close();
	stmt.close();
	
	RequestDispatcher rd = request.getRequestDispatcher("02my04result.jsp");
	rd.forward(request, response);
%>
</body>
</html>