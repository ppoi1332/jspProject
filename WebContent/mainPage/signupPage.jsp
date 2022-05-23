<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../css/myStyle.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
	<div id="signForm">
		<form action="loginPage.jsp" method="post">
			<fieldset  class="signForm_class">
				<legend> 회원가입 </legend>
				아이디 <br>
				<input type="text" name="id" />
				<input type="button" value="중복확인" onClick="idCheck(this.form.id.value)"/><br><br>
				비밀번호 <br> <input type="password" name="passwd" /> <br><br>
				비밀번호 확인 <br> <input type="password" name="passwdcheck" /> <br><br>
				이름 <br> <input type="text" name="name" /> <br><br>
				생년월일 <br> <input type="text" name="birth" /> <br><br>
				이메일 <br> <input type="email" name="email" /> <br><br>		
				<br>
 				<input type="reset" value="초기화" />
				<input type="submit" value="회원가입" />		
			</fieldset>
		</form>
	</div>
</body>
</html>
