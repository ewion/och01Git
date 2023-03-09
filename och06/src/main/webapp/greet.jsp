<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// 선언 -> member변수
	private PrintWriter pw;
	String date;
	
	// 선언 -> init
	public void jspInit() {
		GregorianCalendar gc = new GregorianCalendar();
		date = String.format("%TF %TT", gc, gc);
		System.out.println("date -> "+date);
		String fileName = "c:/log/"+date.replace(":","")+".txt";
		try {
			pw = new PrintWriter(new FileWriter(fileName, true));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("jspInit error!!!");
		}
	}
%>

<%
// get, post방식
	System.out.println("do get Start...");
		String name = request.getParameter("name");
		String msg = name+ "님 반가워\r\n";
		//화면출력
		out.println(msg+"<p> 현재시간 : "+date);
		//file출력
		pw.println(msg+"\r\n현재시간 : "+date+"\r\n");
%>

<%!
// destroy
	public void jspDestroy() {
		System.out.println("jspDestroy start...");
		pw.flush();
		if(pw !=null) pw.close();
	}
%>
</body>
</html>