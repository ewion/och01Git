<%@page import="och10.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<!-- 3. 03my05Result.jsp ->이동   Model 1 View -->
	<h2>Professor 출력</h2>
	<h2>Model 1 View</h2>
	<%
		ArrayList<Professor> al = (ArrayList<Professor>)request.getAttribute("al");
	%>
	<table width="100%" bgcolor="yellow" border="1">
	<tr><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
	<%
	for(int i =0; i<al.size();i++) {
		out.println("<tr><td>"+al.get(i).getProfno()+"</td>");
		out.println("<td>"+al.get(i).getName()+"</td>");
		out.println("<td>"+al.get(i).getPosition()+"</td>");
		out.println("<td>"+al.get(i).getSal()+"</td></tr>");
	}
	%>
	</table>
</body>
</html>