<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javaBeans.FileDAO"%>
<%@page import="javaBeans.FileVO"%>
<% FileDAO dao = new FileDAO(); %>
<% FileVO fv = new FileVO(); %>
<% long number = Long.parseLong(request.getParameter("number")); %>
<% dao.upCount(number); %>
<% FileVO temp = new FileVO(); %>
<% temp = dao.selectIn(number); %>
<% session.setAttribute("file_name", temp.getFile_Name()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/myStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id = ser_top>
<h1><a href="../main/main_Include.jsp">HOME</a></h1>
<hr color="gray" /> 
</div>
<div class="survaySelect">
	<fieldset id="selectfield">
	<h2><legend> <% out.print(temp.getTitle()); %> </legend></h2>
	<table border="1" align="center">
	<tr>
	<th width="50" height="50" id="th_show">번 호</th><td width="50"><% out.print(temp.getNumber()); %></td><th width="50">ID</th><td width="50"><% out.print(temp.getId()); %></td><th width="50">조회수</th><td width="50"><% out.print(temp.getCount()); %></td>
	</tr>
	<tr>
	<th colspan="1" height="50" id="th_show">제 목</th><td colspan="5"><% out.print(temp.getTitle()); %></td>
	</tr>
	<tr>
	<th height="200" colspan="1" id="th_show">내 용</th><td colspan="5"><% out.print(temp.getContext()); %></td>
	</tr> 
	<tr>
	<th colspan="1" height="50">파 	일</th><td colspan="5"><a href="file_down.jsp"><% out.print(temp.getFile_Name()); %></a></td>
	</tr>
	</table>
	<div id="board_bottom">
	<button type="button" class="btn_login btn_login_outline" onclick="location.href='mainboard.jsp'">목록 </button>	
	<button type="button" class="btn_login btn_login_outline" onclick="location.href='../main/main_Include.jsp'">&nbsp홈&nbsp </button>	
	</div>
</div>
</body>
</html>