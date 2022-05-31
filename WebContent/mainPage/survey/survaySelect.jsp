<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javaBeans.SoldierVO" %>
<%@ page import="javaBeans.SoldierDAO" %>
<%@page import="java.util.List"%>

<% SoldierDAO sdao = new SoldierDAO(); %>
<% List<SoldierVO> lis = null; %>
<% lis = sdao.selectAll(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 설문 확인 </title>
<link href="../../css/myStyle.css" rel="stylesheet" type="text/css">
<script src="../script.js"></script>
</head>
<body>
<div id = ser_top>
	<h1><a href="../main/main_Include.jsp">HOME</a></h1>
	<hr color="gray" />
</div> 
<div id="survaySelect">
	<fieldset id="selectfield">
	<h2><legend> 설문 현황 </legend></h2>
	<table border="1" align="center">
	<tr>
	<th>ID</th><th>입대일</th><th>전역일</th><th>부대 이름</th><th>보직 이름</th><th>예비군 년차</th>
	</tr>
	<%if (lis != null) {%>
		<%for(SoldierVO tmp : lis) {%>
		<tr>
			<h5><td><% out.print(tmp.getId()); %></td><td><% out.print(tmp.getIn_day()); %> </td><td> <% out.print(tmp.getOut_day()); %>
			</td><td> <%out.print(tmp.getDivision()); %> </td><td><%out.print(tmp.getPosition()); %> </td><td> <%out.print(tmp.getYear()); %></td>
			</h5>
		</tr>
		<%}%>
	<%} else { %>
		<%out.println("인원이 없습니다"); %>
	<%} %>
	</table>
	<br><br>
	<form action="selectPage.jsp" method="post">
		<select name ="sel_val">
		<option value="">검색</option>
		<option value = "ID">ID</option>
		<option value = "DIVISION">부대 </option>
		<option value = "POSITION">보직 </option>
		<option value = "YEAR">년도 </option> 
		</select>
		<input type="text" name="sel_search"/>
		<input type="submit" class="btn_login btn_login_outline" value="검색" />
		<button type="button"  class="btn_login btn_login_outline" onclick="location.href='../main/main_Include.jsp'">&nbsp홈&nbsp</button>
	</form>
	</fieldset>
</div>
</body>
</html>