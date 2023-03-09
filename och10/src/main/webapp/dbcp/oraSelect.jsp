<%@page import="java.util.Date"%>
<%@page import="och10.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dberror.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String empno = request.getParameter("empno");
	String sql = "select empno, ename, sal, hiredate from emp where empno = "+empno;
	
	//컨텍스트 선언, 인스턴스열어서
	Context ctx = new InitialContext();
	
	//(java:comp/emv/)+(context.xml의name)후 DataSource로 캐스팅
	//이름을 통해서 db설정에 접근, JNDI방식
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	
	//연결했다면 DataSource의 메소드로 쉽게 연결
	Connection conn = ds.getConnection();
	
	//이건 모둘화X 직접작성해야한다
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	Emp emp = new Emp();
	if (rs.next()) {
		emp.setEmpno(rs.getInt(1));
		emp.setEname(rs.getString(2));
		emp.setSal(rs.getInt(3));
		emp.setHiredate(rs.getDate(4));
		request.setAttribute("emp", emp);
	}
	rs.close();
	stmt.close();
	conn.close();
	RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
	rd.forward(request, response);
%>
</body>
</html>