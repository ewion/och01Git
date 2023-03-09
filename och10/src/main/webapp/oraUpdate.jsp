<%@page import="java.sql.PreparedStatement"%>
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
	<h2>스크립트릿 + PrepareStatement수정 </h2>
<%
	//필요 객체 정리
	request.setCharacterEncoding("utf-8");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Class.forName(driver);
	
	//파라미터 입력
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	//sql문 작성
	String sql = "update dept set dname=?, loc=? where deptno=?";
	
	//작성한 sql문을 PreparedStatement객체에 담아 파라미터 와 결합, 물음표순서대로
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dname);
	pstmt.setString(2, loc);
	pstmt.setInt(3, deptno);
	
	
	//전송 확인 및 객체 종료
	
	int result = pstmt.executeUpdate();
	if (result > 0) out.println("수정 성공!!!");
	else out.println("수정 실패...");
	pstmt.close();
	conn.close();
%>
</body>
</html>