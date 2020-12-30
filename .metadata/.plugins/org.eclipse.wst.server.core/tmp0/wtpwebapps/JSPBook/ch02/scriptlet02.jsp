<html>
<head>
<title>Scripting tag</title>
</head>
<body>
	<%
		for (int i = 0; i <= 10; i++) {
			if (i % 2 == 0)//짝수
				out.println(i + "<br>"); //br 태그로 한줄씩 뛰움
		}
	%>
</body>
</html>
