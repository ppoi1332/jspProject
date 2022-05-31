<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>파일 추가</title>
<meta charset="UTF-8">
<link href="../../css/myStyle.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }  
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	}); 
</script>
</head>
<body>
<div id = ser_top>
<h1><a href="../main/main_Include.jsp">HOME</a></h1>
<hr color="gray" /> 
</div>
<div class="survaySelect">
	<fieldset id="selectfield">
	<h2><legend> 내용 입력 </legend></h2>
	<form method="post" action="upload_process.jsp" enctype="multipart/form-data">
	<div class="titlebox">
	제목 <input type="text" name="title" size=90 class="title-name">
	</div>
	<div class="filebox">
   	파일 <input class="upload-name" value="첨부파일" placeholder="첨부파일">
    <label for="file">찾기
    </label> 
    <input type="file" id="file" class="upload-hidden" name="uploadFile">
	</div>
	<div class="textbox">
	내용 <br><br><textarea rows="10" cols="90" class="text-name" name="cont"></textarea>
	</div>
	<div class="submitbox">
	<input type="submit" value="입력" class="btn_login btn_login_outline">
	<input type="reset" value = "초기화" class="btn_login btn_login_outline">
	</div>
	<br><br>
	</form>
	</fieldset>
</div>
</body>
</html>