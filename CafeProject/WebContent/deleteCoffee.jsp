<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	//아이디를 가져온다
	String cafeId = request.getParameter("cafeid");	

	//실제 아이디의 제품이 있는지 검색
	String sql = "select * from coffee";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();  //rs 결과

	if (rs.next()) {  //결과가 있으면
		sql = "delete from coffee where cafeid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cafeId);
		pstmt.executeUpdate();  //DB에서 제품을 삭제한다
	} else  //결과가 없으면
		out.println("일치하는 상품이 없습니다");
	
	//연결 닫기
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	//다시 페이지를 삭제 페이지로 이동한다.
 	response.sendRedirect("editMain.jsp?edit=delete");
%>
