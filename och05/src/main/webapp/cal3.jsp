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
	try {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		out.println(num1+"+"+num2+"="+(num1+num2)+"<p>");
		out.println(num1+"-"+num2+"="+(num1-num2)+"<p>");
		out.println(num1+"*"+num2+"="+(num1*num2)+"<p>");
		out.println(num1+"/"+num2+"="+(num1/num2)+"<p>");
	} catch (NumberFormatException e) {
%>
	<script type="text/javascript">
		alert("숫자가 아닙니다.");
		//전 페이지 이동
		history.back(-1);
	</script>
<% 
	} catch (ArithmeticException e) {
%>
	<script type="text/javascript">
		alert("0으로 나눌수 없습니다..");
		history.back(-1);
	</script>
<%
	} catch (Exception e) {
%>
	<script type="text/javascript">
		alert("error.");
		location.href="num2.html"
	</script>
<%
	}
%>
</body>
</html>