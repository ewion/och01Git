<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>연산결과</h2>
<%
	try {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		out.println(num1+"+"+num2+"="+(num1+num2)+"<p>");
		out.println(num1+"-"+num2+"="+(num1-num2)+"<p>");
		out.println(num1+"*"+num2+"="+(num1*num2)+"<p>");
		out.println(num1+"/"+num2+"="+(num1/num2)+"<p>");
	} catch (NumberFormatException e) {
		out.println("jsp 연산 결과 NumberFormatException!!!");
	} catch (ArithmeticException e) {
		out.println("연산 결과 ArithmeticException!!!");
		out.println("0으로 나눌 수 없습니다");
	} catch (Exception e) {
		out.println("jsp e.getMessage() ->"+e.getMessage());
	}
	out.close();
%>
</body>
</html>