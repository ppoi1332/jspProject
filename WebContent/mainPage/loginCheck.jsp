<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="javaBeans.InfoDAO"/>
<%
	String id = request.getParameter("id_login");
	String passwd = request.getParameter("passwd_login");
	int check = dao.loginCheck(id, passwd);
%>
<%
	if (check == 1){
		session.setAttribute("loginID", id);
		response.sendRedirect("main_Include.jsp");
	}
	else if (check == 0){
%>
<script>
	alert("비밀번호가 틀렸습니다");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("존재하지 않는 아이디입니다");
	history.go(-1);
</script>
<%
}
%>