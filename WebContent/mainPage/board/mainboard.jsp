<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>목록보기</title>
<meta charset="UTF-8">
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
	<h2><legend> 자료실 </legend></h2>
	<br>
	<table border="1" align="center">
	<tr>
	<th width="80">번호</th><th>제목</th><th>파일 이름</th><th width="110">ID</th><th width="80">조회수</th>
	</tr>
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