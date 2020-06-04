<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	
	
	session.invalidate();//세션테이블에 있는 로그인에 시도한 해당 정보만
	response.sendRedirect("./login.jsp");


%>