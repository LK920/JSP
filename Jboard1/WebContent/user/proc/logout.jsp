<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	//섹션 정보 초기화
	session.setAttribute("member", null);

	// 로그인 이동
	response.sendRedirect("/Jboard1/user/login.jsp");



%>