<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID3 = (String)session.getAttribute("loginID"); %>
<script src="script.js"></script>
<div id = "main_mid">
	<input type="image" src="../image/survey.png" class="mid_btn mid_btn_outline" value="servay"
	<% if (loginID3 != null) {%>
		onclick="location.href='survay.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
	</button>
	<input type="image" src="../image/check.png" class="check_btn check_btn_outline"  value="check"
	<% if (loginID3 != null) {%>
		onclick="location.href='survaySelect.jsp'"
	<% } else {%>
		onclick="loginCheck()"
	<%} %>
	>
	</button>
</div>
</body>
</html>