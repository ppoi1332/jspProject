<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID4 = (String)session.getAttribute("loginID"); %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>
<%@ page import="javaBeans.SoldierVO" %>
<%@ page import="javaBeans.SoldierDAO" %>
<% long division_code = Integer.parseInt(request.getParameter("division")); %>
<% long position_code = Integer.parseInt(request.getParameter("position")); %>
<% long year_code = Integer.parseInt(request.getParameter("year")); %>
<% String in_day = request.getParameter("in_day"); %>
<% String out_day = request.getParameter("out_day"); %>
<% SoldierVO sv = new SoldierVO(loginID4, division_code, position_code, in_day, out_day, year_code); %>
<% SoldierDAO dao = new SoldierDAO(); %>
<% dao.soldierInsert(sv); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = in_top>
	<h1>감사합니다</h1>
	<hr color="gray" /> 
	</div>
	<div id = in_mid>
		<h2><a href="main_Include.jsp" >메인화면으로 돌아가기</a></h2>
	</div>
</body>
</html>
