<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 목록 출력</title>
</head>
<body>
	<%
		Enumeration headerEnum = request.getHeaderNames();
		while(headerEnum.hasMoreElements()){
			String headerName = (String) headerEnum.nextElement();
			String headerValue = request.getHeader(headerName);
		
		%>
	<%= headerName%> = <%= headerValue %><br />
	<%} %>

</body>
</html>