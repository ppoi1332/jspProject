<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/myStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="loginForm">
		<form action="login.jsp" method="post">
			<fieldset>
				<legend> 로그인 </legend>
				아이디 	: <input type="text" name="id_login" /><br>
				비밀번호	: <input type="password" name="passwd_login" /> <br><br>
				<input type="submit" value="로그인">
				<button type="button" onclick="location.href='signupPage.jsp'">회원가입 </button>			
			</fieldset>
		</form>
	</div>
</body>
</html>