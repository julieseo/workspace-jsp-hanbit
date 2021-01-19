<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	
	MultipartRequest multi = new MultipartRequest(request, "E:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());

	//System.out.print(multi.getParameter("cafeid"));
	String cafeId = multi.getParameter("cafeid");
	String name = multi.getParameter("name");
	String beans = multi.getParameter("beans");
	String regist_day = multi.getParameter("regist_day");
	String explan = multi.getParameter("explan");
	String variety = multi.getParameter("variety");
	String level = multi.getParameter("level");
	String fileName = multi.getFilesystemName("fileName"); //이미지
	
	
		String sql = "select * from coffee where cafeid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cafeId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) { //사진도 같이 업데이트 할 경우
				sql = "UPDATE coffee SET name=?, beans=?, regist_day=?, explan=?, variety=?, level=?, fileName=? WHERE cafeid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, beans);
				pstmt.setString(3, regist_day);
				pstmt.setString(4, explan);
				pstmt.setString(5, variety);
				pstmt.setString(6, level);
				pstmt.setString(7, fileName); 
				pstmt.setString(8, cafeId); 
				pstmt.executeUpdate();
			} else { //사진없이 업데이트 할 경우
				sql = "UPDATE coffee SET name=?, beans=?, regist_day=?, explan=?, variety=?, level=? WHERE cafeid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, beans);
				pstmt.setString(3, regist_day);
				pstmt.setString(4, explan);
				pstmt.setString(5, variety);
				pstmt.setString(6, level);
				pstmt.setString(7, cafeId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editMain.jsp?edit=update");
%>