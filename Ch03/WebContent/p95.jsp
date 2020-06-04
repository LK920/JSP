<%@page import="java.net.URLEncoder"%>
<%@ page  pageEncoding="UTF-8"%>
<%
	String value = "자바";
	String encodedValue = URLEncoder.encode(value, "utf-8");
	response.sendRedirect("./p77.jsp?name" + encodedValue);
%>