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
	String[] col = {"red","orange","yellow","green","blue","navy","violet"};
	int n = (int)(Math.random()*8);
	
	// color1.jsp	gugu1.jsp	response.jsp
	//form문의 action값 = pgm
	
	String pgm = request.getParameter("pgm")+".jsp";
	System.out.println("pgm -> "+pgm);
	
	// 1. form 없이 이동 Page를 지정하는 객체 선언, 
	
	RequestDispatcher rd = request.getRequestDispatcher(pgm);
	
	if(pgm.equals("color1.jsp")) {
		System.out.println("col[n] -> "+col[n]);
		//변수선언, color에 n을 보여줌
		request.setAttribute("color", col[n]);
	} else if (pgm.equals("gugu1.jsp")) {
		request.setAttribute("num", n+2);
	} else if (pgm.equals("response.jsp")) {
		
	}
	// 2. 이동 Page를 지정하는 객체 선언를 실제적으로 이동, form의 submit을 누른것과같음
	rd.forward(request, response);
%>
</body>
</html>