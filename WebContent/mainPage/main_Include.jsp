<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID2 = (String)session.getAttribute("loginID"); %>
<%@ include file="mainPage_Top.jsp" %>
<% if (loginID2 != null) {%>
		<%@ include file="loginOK.jsp" %>
	<% } else {%>
	<%@ include file="mainPage_Nav.jsp" %>
	<%} %>
	
<%@ include file="mainPage_Mid.jsp" %>

 