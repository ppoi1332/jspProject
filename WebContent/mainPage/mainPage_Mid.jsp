<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID3 = (String)session.getAttribute("loginID"); %>

<div id = "main_mid">
	<button id="midbtn" class="mid_btn mid_btn_outline" value="servay"
	<% if (loginID3 != null) {%>
		onclick="location.href='survay.jsp'"
	<% } else {%>
		onclick="location.href='loginPage.jsp'"
	<%} %>
	>
	</button>
	<button id="checkbtn" class="check_btn check_btn_outline"  value="check"
	<% if (loginID3 != null) {%>
		onclick="location.href='survay.jsp'"
	<% } else {%>
		onclick="location.href='loginPage.jsp'"
	<%} %>
	>
	</button>
</div>
</body>
</html>