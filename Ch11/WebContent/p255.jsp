<%@ page contentType="text/html;charset=UTF-8"    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "강래구");
	request.setAttribute("code", "DDD");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Object</title>
</head>
<body>
요청 URL: ${pageContext.request.requestURI}<br>
reqeust의 name속성 : ${requestScope.name }<br>
code 파라미터: ${param.code }<br>
</body>
</html>