<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사</title>
<link href="../css/myStyle.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
<div id = ser_top>
<h1>설문조사</h1>
<hr color="gray" /> 
</div>
<div id = ser_mid>
	<form action="survayIn.jsp" method="post">
	<ul>
		<li> <h3>입대일&nbsp <input type="date" name="in_day" /></li></h3><br>
		<li> <h3>전역일&nbsp <input type="date" name="out_day" /></li></h3><br>
		<li> <h3>부대 선택 
			<h4>
			<input type="radio" name="division" value=1>육군
			<input type="radio" name="division" value=2>공군
			<input type="radio" name="division" value=3>해군
			<input type="radio" name="division" value=4>해병대
			<input type="radio" name="division" value=5>기타				
		</li></h3><br>
		<li> <h3>보직 선택 
			<h4>
			<input type="radio" name="position" value=1>보병
			<input type="radio" name="position" value=2 >행정병
			<input type="radio" name="position" value=3>운전병
			<input type="radio" name="position" value=4>의무병
			<input type="radio" name="position" value=5>취사병
			<input type="radio" name="position" value=6>기타						
		</li></h3><br>
		<li> <h3>예비군 년차 선택 
			<h4>
			<input type="radio" name="year" value=1>1년차
			<input type="radio" name="year" value=2>2년차
			<input type="radio" name="year" value=3>3년차
			<input type="radio" name="year" value=4>4년차
			<input type="radio" name="year" value=5>5년차	
			<input type="radio" name="year" value=6>6년차	
			<input type="radio" name="year" value=7>7년차~		
		</li></h3>
	</ul><br>
	&nbsp&nbsp&nbsp&nbsp&nbsp
	<input type="submit" value="입력완료"/>
	<input type="reset" value="초기화" />
	</form>
	
</div>
</body>
</html>