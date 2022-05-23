function idCheck(id) {
	if (id == "" ){
		alert("아이디를 입력해주세요");
		document.regForm.id.focus();
	}
	else {
		var popWidth = 300;
		var popHeight = 200;
		var winHeight = document.body.clientHeight;
		var winWidth = document.body.clientWidth;
		var winX = window.screenLeft;
		var winY = window.screenTop;
		var popX = winX + (winWidth - popWidth)/2;
		var popY = winY + (winHeight -popHeight)/2;
		url="idCheck.jsp?id="+id;
		window.open(url,"post","left="+popX+",top="+popY+",width="+popWidth+",height="+popHeight);
	}
	
}

function inputCheck() {
	if(document.regForm.id.value==""){
		alert("아이디를 입력 하세요");
		document.regForm.id.focus();
		return;
	}
	if(document.regForm.passwd.value==""){
		alert("비빌번호를 입력 하세요");
		document.regForm.passwd.focus();
		return;
	}
	if(document.regForm.passwdcheck.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regForm.passwdcheck.focus();
		return;
	}
	if(document.regForm.passwd.value != document.regForm.passwdcheck.value){
		alert("비밀번호가 일치하지 않습니다");
		document.regForm.passwdcheck.focus();
		return;
	}
	if(document.regForm.name.value==""){
		alert("이름을 입력 하세요");
		document.regForm.name.focus();
		return;
	}
	if(document.regForm.birth.value==""){
		alert("생년월일을 입력 하세요");
		document.regForm.birth.focus();
		return;
	}
	if(document.regForm.email.value==""){
		alert("이메일을 입력 하세요");
		document.regForm.email.focus();
		return;
	}
	
	var str=document.regForm.email.value;
	var atPos=str.indexOf('@');
	var atLastPos=str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos +1 < dotPos && dotPos + 1 < eMailSize);
	else {
		alert("이메일 주소 형식이 잘못되었습니다");
		document.regForm.email.focus();
		return;
	}
	document.regForm.submit();
	
}