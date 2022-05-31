<%@page import="javaBeans.FileDAO"%>
<%@page import="javaBeans.FileVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<% String loginID5 = (String)session.getAttribute("loginID"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% FileDAO fdao = new FileDAO(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 업로드 처리 </title>
<link href="../../css/myStyle.css" rel="stylesheet" type="text/css">
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
		String title = multi.getParameter("title");
		String cont = multi.getParameter("cont");
		if(fileName == null) {
			System.out.print("파일 업로드 실패");
		} else {
			FileVO fv = new FileVO(title, fileName, loginID5, cont);
			fdao.insertFile(fv);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<div id = ser_top>
<h1><a href="../main/main_Include.jsp">HOME</a></h1>
<hr color="gray" /> 
</div>
<div class="survaySelect">
	<fieldset id="file_ok">
	<h2>입력되었습니다</h2>
	<button type="button" class="btn_login btn_login_outline" onclick="location.href='../main/main_Include.jsp'">
	홈으로
	</button>
	</fieldset>
</div>
</body>
</html>