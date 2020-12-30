<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%!String makeItLower(String data) {
		//문자열을 소문자로 변환
		return data.toLowerCase(); 
	}%>
	<%
		out.println(makeItLower("Hello World"));
	%>
</body>
</html>
