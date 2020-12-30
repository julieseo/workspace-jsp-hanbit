<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<!-- 주석 -->
	<!-- 선언문 -->
	<%!int data = 50;%>
	<!-- Scriptlet -->
	<%
		//out은 화면 출력을 위한 스트림(jsp에서는 out이 기본적으로 설치되어 있음)
		out.println("Value of the variable is:" + data);
	%>
</body>
</html>
