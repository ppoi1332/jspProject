<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<% String loginID5 = (String)session.getAttribute("loginID"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 업로드 처리 </title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String savePath="/fileUpload/upload";
	int uploadFileSizeLimit = 5*1024*1024;
	String encType="UTF-8";
	
	ServletContext context = getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	System.out.println("서버상의 실제 디렉터리");
	System.out.println(uploadFilePath);
	try{
		MultipartRequest multi = new MultipartRequest(
				request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy()
				);
		String fileName = multi.getFilesystemName("uploadFile");
		if(fileName == null) {
			System.out.print("파일 업로드 실패");
		} else {
			System.out.println("<br> ID : " + loginID5);
			System.out.println("<br> 제목 : " + multi.getParameter("title"));
			System.out.println("<br> 파일명 : " + fileName);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>