<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="javaBeans.InfoDAO"/>
<jsp:useBean id="dto" class="javaBeans.InfoVO"/>
<jsp:setProperty name="dto" property="*" />
<%
	boolean flag = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
<link href="../../css/myStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="signup_check">
<fieldset>
<%
	if(flag) {
		out.println("<b>회원 가입을 축하드립니다</b><br/>");
		out.println("<a href=../login/loginPage.jsp>로그인</a>");
	} else{
		out.println("<b>다시 입력하여 주십시오 </b><br/>");
		out.println("<a href=../login/signupPage.jsp>회원가입</a>");
	}
%>
</fieldset>
</div>
</body>
</html>