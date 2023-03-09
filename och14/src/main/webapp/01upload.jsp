<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	request.setCharacterEncoding("utf-8");
	
	// 		5M
	int maxSize = 5*1024*1024;
	
	// file저장경로, 루트폴더(webapp) 밑에 만들어주어야한다 대소문자구분
	String fileSave = "/fileSave";
	
	//Meta Data, 
	String realPath = getServletContext().getRealPath(fileSave);
	System.out.println("realPath -> "+realPath);

	// com.orelly.servlet라이브러리의(cos) 클래스 
	// request : 멀티파츠리퀘스트와 연결될 리퀘스트객체 
	// new DefaultFileRenamePolicy() : 명명규칙, new DefaultFileRenamePolicy()는 기본정책임
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,"utf-8", new DefaultFileRenamePolicy());
	
	// 파일을 여러개 업로드 하는 경우
	Enumeration en = multi.getFileNames();
	while (en.hasMoreElements()) {
		//input 태그의 속성이 file인 태그의 name속성값 :파라미터이름
		String parameterName = (String) en.nextElement();
		// 서버에 저장된 파일 이름
		String serverSaveFilename = multi.getFilesystemName(parameterName);
		// 전송전 원래의 파일 이름
		String original = multi.getOriginalFileName(parameterName);
		// 전송된 파일의 내용 타입
		String type = multi.getContentType(parameterName);
		// 전송된 파일속성이 file인 태그의 name속성값을 이용해 파일객체 생성
		File file = multi.getFile(parameterName);
		
		out.println("real Path : "+realPath+"<br>");
		out.println("파라미터 이름 : "+parameterName+"<br>");
		out.println("실제 파일 이름 : "+original+"<br>");
		out.println("저장된 파일 이름 : "+serverSaveFilename+"<br>");
		out.println("파일 타입 : "+type+"<br>");
		if(file != null) {
			out.println("파일 크기 : "+file.length()+"<br>");
		}
		
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		
		// DTO Setting
		// DML --> DAO
		
		
		
		
		
		
		
	}
	
%>
</body>
</html>