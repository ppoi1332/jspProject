<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID3 = (String)session.getAttribute("loginID"); %>
<script src="../script.js"></script>
<div id = "main_mid">
	<input type="image" src="../../image/survey15.png" class="mid_btn mid_btn_outline" value="servay"
	<% if (loginID3 != null) {%>
		onclick="location.href='../survey/survay.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
	<input type="image" src="../../image/check15.png" class="check_btn check_btn_outline"  value="check"
	<% if (loginID3 != null) {%>
		onclick="location.href='../survey/survaySelect.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
</div>
<div id = "main_mid">
	<input type="image" src="../../image/show15.png" class="mid_btn mid_btn_outline" value="servay"
	<% if (loginID3 != null) {%>
		onclick="location.href='../board/mainboard.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
	<input type="image" src="../../image/file15.png" class="check_btn check_btn_outline"  value="check"
	<% if (loginID3 != null) {%>
		onclick="location.href='../board/fileIn.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
</div>
</body>
</html>