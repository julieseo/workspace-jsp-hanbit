
<%@ page import="java.sql.*"%>
<%
//연결 객체들을 선언 (pstmt)
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/cafe?useSSL=false";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		//연결성공
		
		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} //연결실패
		
%>