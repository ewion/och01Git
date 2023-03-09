<%@page import="och10.Professor"%>
<%@page import="java.util.ArrayList"%>
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
	// 1.  Professor -->  profno,name,position,sal  조회
    // 2. Professor professor -> al
     // 3. my05Result.jsp ->이동  <!--  Model 1 View -->
     // 4. my05Result2.jsp ->이동  <!--  Model 2 View -->
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,"root","3024");
		//1. select profno, name, posiotion, sal from professor;
		//2. Professor p -> al로 선언
		String sql = "select profno, name, position, sal from professor;";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<Professor> al = new ArrayList<Professor>();
		Professor professor = new Professor();
		System.out.println(sql);
		if (rs.next()) {
			do { //실제 물리적인 로우가 하나일지라도 언제 데이터가 올라갈지모르기떄문에 필히 do-while문사용
			professor.setProfno(rs.getInt(1));
			professor.setName(rs.getString(2));
			professor.setPosition(rs.getString(3));
			professor.setSal(rs.getInt(4));
			al.add(professor);
			} while (rs.next());
			request.setAttribute("al", al);
			/* RequestDispatcher rd = request.getRequestDispatcher("03my05result.jsp"); */
			RequestDispatcher rd = request.getRequestDispatcher("03my05result2.jsp");
			rd.forward(request, response);
		} else out.print("데이터가 없습니다");
		stmt.close();
		conn.close();
		rs.close();
	%>
</body>
</html>