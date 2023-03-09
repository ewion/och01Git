<%@page import="och11.MemberDto"%>
<%@page import="och11.MemberDao"%>
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
	// Businesss --> Service모듈로 빠짐
	String chk = "";
	String agree = request.getParameter("agree");
	if (agree.equals("y")) {
		//세션에 저장해둔값을 여기서 꺼내볼예정, 세션을 받아서 DTO로 만듬
		String id = (String)session.getAttribute("id");
		String password = (String)session.getAttribute("password");
		String name = (String)session.getAttribute("name");
		
		MemberDao md = new MemberDao();
		MemberDto member = new MemberDto();
		
		// DTO 필드에 값을 넣는다
		// 01person.jsp에서 입력받은 개인정보(파라미터)가 폼의 액션으로 전송 ->
		// 01agree.jsp에서 폼:액션으로 보낸 파라미터를 request.getParameter로 받고 
		// request.getParameter로 받은 값을 session.setAttribute로 담아 01subscribe.jsp로 보냄 ->
		// session.setAttribute로 보낸 파라미터를 (String)session.getAttribute로 받음, 캐스팅이 필수
		// 받은 값을 사용자 선언 객체인 MemberDto에 저장(밑의 문장) 
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		
		// DTO에 필드값을 저장했다면 실제로 db에 접근하는 Dao객체로 필드값들을 db에 저장
		// Dao객체는 db에 필드값을 저장하고 저장이 완료되었는지 확인할 수 있는 리턴값을 사용한 sql문에 맞게 반환해주어야함
		
		int result = md.insert(member);
		if (result > 0) chk = "success";
		else chk = "fail";
		
	} else chk = "fail";
	
	session.invalidate(); //세션 끊기
	out.print("invalidate() 적용 후에도 "+session.getId()+"<br>");//세션을 끊어도 몇초간은 데이터를 볼수있음
	response.sendRedirect("01result.jsp?chk="+chk);
%>

</body>
</html>