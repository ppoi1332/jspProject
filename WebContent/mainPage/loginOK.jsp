<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginID = (String)session.getAttribute("loginID"); %>
    
<div id="main_nav">
	<% if (loginID != null) {%>
		<h3><%=loginID %> 님 환영합니다
		<input type="button" value="로그아웃" class="sign_btn sign_btn_outline"onClick="location.href='logout.jsp'"/>
		</h3>
	<% } else {%>
	<script>
		alert("정상적인 접근이 아닙니다. 로그인 해 주세요");
		location.href="loginPage.jsp";
	</script>
	<%} %>
</div>