<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
	psmt.setString(1, seq);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);
%>
