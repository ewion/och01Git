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
	request.setCharacterEncoding("utf-8");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Class.forName(driver);
	
	String deptno = request.getParameter("deptno");
	String sql = "select * from dept where deptno = "+deptno;
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	if (rs.next()) {
		request.setAttribute("deptno", deptno);
		request.setAttribute("dname", rs.getString(2));
		request.setAttribute("loc", rs.getString(3));
		rs.close();
		stmt.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
		rd.forward(request, response);
	}	else {
		stmt.close();
		conn.close();
	}
%>
<script type="text/javascript">
	alert("부서없음!!!");
	location.href = "oraUpdate.html";
</script>
</body>
</html>