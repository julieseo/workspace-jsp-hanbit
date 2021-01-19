<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
/* 
	String filename = "";
	String realFolder = "D:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb */

	//객체 생성 및 초기화(request, 저장경로, 파일사이즈, 인코딩 ,파일 타입)
	MultipartRequest multi = new MultipartRequest(request, "D:\\cafeUpload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());

	String name = multi.getParameter("name");
	String kind = multi.getParameter("kind");
	String beans = multi.getParameter("beans");
	String regist_day = multi.getParameter("regist_day");
	String explan = multi.getParameter("explan");
	String variety = multi.getParameter("variety");
	String level = multi.getParameter("level");
	String fileName = multi.getFilesystemName("fileName");

	String sql = "insert into coffee(kind, name, beans, regist_day, explan, variety, level, fileName) values (?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, kind);
	pstmt.setString(2, name);
	pstmt.setString(3, beans);
	pstmt.setString(4, regist_day);
	pstmt.setString(5, explan);
	pstmt.setString(6, variety);
	pstmt.setString(7, level);
	pstmt.setString(8, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("editMain.jsp");
%>
