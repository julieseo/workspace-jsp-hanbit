<%@ page contentType="text/html; charset=utf-8"%>
<%!
	int pageCount = 0;
	void addCount() {
		pageCount++; //1씩 증가
	}
%>
<%
	addCount(); //함수 호출
%>
<p>	이 사이트 방문은	<%=pageCount%>번째 입니다.</p>
