<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String seq = request.getParameter("seq");
	String title 	= request.getParameter("title");
	String content  = request.getParameter("content");
	
	//1,2 단계
		
	Connection conn = DBConfig.getConnection();
	
	//3 단계
	
	PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, seq);
	
	
	//4 단계
	psmt.executeUpdate();
	//5 단계
	//6 단계
	psmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+seq);


%>
