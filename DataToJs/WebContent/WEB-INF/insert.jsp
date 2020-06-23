<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");
	String rdate = request.getRemoteAddr();
	
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "INSERT INTO `MEMBER` VALUES (`"+uid+"`,`"+name+"`,`"+hp+"`,`"+pos+"`,`"+dep+"`,`"+rdate+"`)";
	int result = stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);
%>

