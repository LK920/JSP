<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/JSON;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String hp = request.getParameter("hp");
	
	Connection conn = DBConfig.getConnection();
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
	psmt.setString(1, hp);
	
	ResultSet rs =  psmt.executeQuery();
	
	int result =0;
	if(rs.next()){
		result = rs.getInt(1);
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	//제이슨 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	//제이슨 출력
	out.print(json);
%>