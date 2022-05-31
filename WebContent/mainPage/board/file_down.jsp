<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String file_name = (String)session.getAttribute("file_name"); %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String root = request.getSession().getServletContext().getRealPath("/");
	String savePath= root + "fileUpload/upload" ;
	String filename = file_name;
	String outfilename = file_name;
	
	InputStream is = null;
	OutputStream os = null;
	File file = null;
	boolean skip = false;
	String client = "";
	
	try{
		try {
			file = new File(savePath, filename);
			is = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			skip = true;
		}
	
		client = request.getHeader("User-Agent");
	
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Description", "JSP Generated Data");
	
		if (!skip) {
			if (client.indexOf("MSIE") != -1){
				response.setHeader("Content-Disposition", "attachment; filename="+new String(outfilename.getBytes("KSC5601"),"ISO8859_1"));
			} else {
				outfilename = new String(outfilename.getBytes("utf-8"),"iso-8859-1");
				
				response.setHeader("Content-Disposition", "attachment; filename=\"" + outfilename + "\"");
				response.setHeader("Content-Type","application/cotet-stream; charset=utf-8");
			}
		
			response.setHeader("Content-Length", ""+file.length());
			
			out.clear();
			out=pageContext.pushBody();
			os = response.getOutputStream();
			byte b[] = new byte[(int)file.length()];
			int leng = 0;
		
			while((leng = is.read(b)) > 0){
				os.write(b,0,leng);
			}
		} else {
			response.setContentType("text.html;charset=UTF-8");
			out.println("<script lanuage='javascript'>alert('파일을 찾을수 없습니다');history.back();<script>");
		}
		
		is.close();
		os.close();
	} catch(Exception e){
		e.printStackTrace();
	}	
%>