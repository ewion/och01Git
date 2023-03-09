<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산결과 오류시 error page이동</h2>
	<%
	try {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		out.println(num1+"+"+num2+"="+(num1+num2));
		out.println(num1+"-"+num2+"="+(num1-num2));
		out.println(num1+"*"+num2+"="+(num1*num2));
		out.println(num1+"/"+num2+"="+(num1/num2));
	} catch (Exception e) {
		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
		//실질적 Error페이지 이동
		rd.forward(request, response);
	}
	%>
</body>
</html>